<?php

namespace App\Http\Controllers\ProviderResources;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\ModelNotFoundException;

use Auth;
use Setting;
use Storage;
use Carbon\Carbon;
use App\Helpers\Helper;
use App\Http\Controllers\SendPushNotification;

use DB;
use App\User;
use App\Messages;
use App\Admin;
use App\Promocode;
use App\UserRequests;
use App\RequestFilter;
use App\PromocodeUsage;
use App\Provider;
use App\ProviderService;
use App\UserRequestRating;
use App\UserRequestPayment;
use App\ServiceType;
use App\Insurances;
use App\Chat;
use App\Settings;
use App\ProviderWorkHour;
use App\AccountSwitch;
use App\WithdrawalMoney;
use App\ProviderDocument;
use App\Document;
use App\ProviderMembership;
use App\UserInvitation;
use Mail;
use App\SellingItem;
use App\ItemRequest;

class TripController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try{

           

            if($request->ajax()) {
                $Provider = Auth::user();
            } else {
                $Provider = Auth::guard('provider')->user();
            }

            $provider = $Provider->id;
           

          $AfterAssignProvider = RequestFilter::with(['request.user', 'request.payment', 'request'])
                ->where('provider_id', $provider)
                ->whereHas('request', function($query) use ($provider) {
                        $query->where('status','<>', 'CANCELLED');
                        $query->where('status','<>', 'SCHEDULED');
                        $query->where('provider_id', $provider );
                        $query->where('current_provider_id', $provider);
                    });

            $BeforeAssignProvider = RequestFilter::with(['request.user', 'request.payment', 'request'])
                ->where('provider_id', $provider)
                ->whereHas('request', function($query) use ($provider){
                        $query->where('status','<>', 'CANCELLED');
                        $query->where('status','<>', 'SCHEDULED');
                        $query->where('current_provider_id',$provider);
                    });

            $IncomingRequests = $BeforeAssignProvider->union($AfterAssignProvider)->get();

            if(!empty($request->latitude)) {
                $Provider->update([
                        'latitude' => $request->latitude,
                        'longitude' => $request->longitude,
                ]);
            }

            $Timeout = Setting::get('provider_select_timeout', 180);
                if(!empty($IncomingRequests)){
                    for ($i=0; $i < sizeof($IncomingRequests ); $i++) {
						
                        $IncomingRequests[$i]->time_left_to_respond = $Timeout - (time() - strtotime($IncomingRequests[$i]->request->assigned_at));
                        if($IncomingRequests[$i]->request->status == 'SEARCHING' && $IncomingRequests[$i]->time_left_to_respond < 0) {
                            $this->assign_next_provider($IncomingRequests[$i]->request->id);
                        }
                    }
                }
             
            $service_type = 0;
            
           if($IncomingRequests != '[]'){
               
                if($IncomingRequests[0]->request->status == 'DROPPED') {
                    
                   ItemRequest::where('user_id',$IncomingRequests[0]->request->user_id)->where('status',1)->update(['status'=>0]);
                }
               
                $service_type = ServiceType::findOrFail($IncomingRequests[0]->request->service_type_id);
                
                $itemList = ItemRequest::where('user_id',$IncomingRequests[0]->request->user_id)->where('status',1)->get();
                
               
                
                foreach($itemList as $k=>$v){
                    
                   $itemList[$k]['itemName'] = SellingItem::where('id',$v->selling_item_id)->first();
                }
                
                $service_type->itemList = $itemList;
             
//                  $now = Carbon::now();
//                 if(isset($IncomingRequests[0]->request->started_at)){

              
//                  if($IncomingRequests[0]->request->service_hour != 0){
              
//   // $hourServices = (new Carbon("$IncomingRequests[0]->request->started_at"))->addhour($IncomingRequests[0]->request->service_hour);


//   $minuteServices = (new Carbon($IncomingRequests[0]->request->started_at))->addHours($IncomingRequests[0]->request->service_hour);
  
//                  if($now > $minuteServices){
                
//                  if($IncomingRequests[0]->request->status == 'PICKEDUP'){
//                  if($IncomingRequests[0]->request->provider_service_type == 'CARETAKER'){
//                  UserRequests::where('id',$IncomingRequests[0]->request_id)->update(['service_hour_status'=>1,'status'=>'STOPPED']);
//                  }
//                  }
//                  }
//               }
//             }
            }

            $Response = [
                   
                    'account_status' => $Provider->status,
                    'service_status' => $Provider->service ? Auth::user()->service->status : 'offline',
                    'requests' => $IncomingRequests,
                    'itemDetails'=>$service_type,
                ];

           
            
            return $Response;
        } catch (ModelNotFoundException $e) {
            return response()->json(['error' =>  $e->getMessage()]);
        }
    }

    /**
     * Cancel given request.
     *
     * @return \Illuminate\Http\Response
     */
    public function cancel(Request $request)
    {
        $this->validate($request, [
            'cancel_reason'=> 'max:255',
        ]);
        try{
            $UserRequest = UserRequests::findOrFail($request->request_id);
            $Cancellable = ['SEARCHING', 'ACCEPTED', 'ARRIVED', 'STARTED', 'CREATED','SCHEDULED'];
        
            if(!in_array($UserRequest->status, $Cancellable)) {
                return back()->with(['flash_error' => 'Cannot cancel request at this stage!']);
            }

            $UserRequest->status = "CANCELLED";
            $UserRequest->cancel_reason = $request->cancel_reason;
            $UserRequest->cancelled_by = "PROVIDER";
            $UserRequest->save();

             RequestFilter::where('request_id', $UserRequest->id)->delete();

             ProviderService::where('provider_id',$UserRequest->provider_id)->update(['status' =>'active']);

             // Send Push Notification to User
            (new SendPushNotification)->ProviderCancellRide($UserRequest);

            return $UserRequest;

        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Something went wrong']);
        }


    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function rate(Request $request, $id)
    {

        $this->validate($request, [
                'rating' => 'required|integer|in:1,2,3,4,5',
                'comment' => 'max:255',
            ]);
    
        try {

            $UserRequest = UserRequests::where('id', $id)
                ->where('status', 'COMPLETED')
                ->firstOrFail();

            if($UserRequest->rating == null) {
                UserRequestRating::create([
                        'provider_id' => $UserRequest->provider_id,
                        'user_id' => $UserRequest->user_id,
                        'request_id' => $UserRequest->id,
                        'provider_rating' => $request->rating,
                        'provider_comment' => $request->comment,
                    ]);
            } else {
                $UserRequest->rating->update([
                        'provider_rating' => $request->rating,
                        'provider_comment' => $request->comment,
                    ]);
            }

            $UserRequest->update(['provider_rated' => 1]);

            // Delete from filter so that it doesn't show up in status checks.
            RequestFilter::where('request_id', $id)->delete();

            ProviderService::where('provider_id',$UserRequest->provider_id)->update(['status' =>'active']);

            // Send Push Notification to Provider 
            $average = UserRequestRating::where('provider_id', $UserRequest->provider_id)->avg('provider_rating');

            $UserRequest->user->update(['rating' => $average]);

            return response()->json(['message' => 'Request Completed!']);

        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Request not yet completed!'], 500);
        }
    }

    /**
     * Get the trip history of the provider
     *
     * @return \Illuminate\Http\Response
     */
    public function scheduled(Request $request)
    {
        
        try{

            $Jobs = UserRequests::where('provider_id', Auth::user()->id)
                    ->where('status', 'SCHEDULED')
                    ->with('service_type')
                    ->get();

            if(!empty($Jobs)){
                $map_icon = asset('asset/img/marker-start.png');
                foreach ($Jobs as $key => $value) {
                    $Jobs[$key]->static_map = "https://maps.googleapis.com/maps/api/staticmap?".
                            "autoscale=1".
                            "&size=320x130".
                            "&maptype=terrian".
                            "&format=png".
                            "&visual_refresh=true".
                            "&markers=icon:".$map_icon."%7C".$value->s_latitude.",".$value->s_longitude.
                           // "&markers=icon:".$map_icon."%7C".$value->d_latitude.",".$value->d_longitude.
                            "&path=color:0x000000|weight:3|enc:".$value->route_key.
                            "&key=".env('GOOGLE_MAP_KEY');
                }
            }

            return $Jobs;
            
        } catch(Exception $e) {
            return response()->json(['error' => "Something Went Wrong"]);
        }
    }

    /**
     * Get the trip history of the provider
     *
     * @return \Illuminate\Http\Response
     */
    public function history(Request $request)
    {
        if($request->ajax()) {

            $Jobs = UserRequests::where('provider_id', Auth::user()->id)
                    ->orderBy('created_at','desc')
                    ->with('payment')
                    ->get();

            if(!empty($Jobs)){
                $map_icon = asset('asset/img/marker-start.png');
                foreach ($Jobs as $key => $value) {
                    $Jobs[$key]->static_map = "https://maps.googleapis.com/maps/api/staticmap?".
                            "autoscale=1".
                            "&size=320x130".
                            "&maptype=terrian".
                            "&format=png".
                            "&visual_refresh=true".
                            "&markers=icon:".$map_icon."%7C".$value->s_latitude.",".$value->s_longitude.
                           // "&markers=icon:".$map_icon."%7C".$value->d_latitude.",".$value->d_longitude.
                            "&path=color:0x000000|weight:3|enc:".$value->route_key.
                            "&key=".env('GOOGLE_MAP_KEY');
                }
            }
            return $Jobs;
        }
        $Jobs = UserRequests::where('provider_id', Auth::guard('provider')->user()->id)->with('user', 'service_type', 'payment', 'rating')->get();
        return view('provider.trip.index', compact('Jobs'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function accept( Request $request, $id )
    {
        try {

            $UserRequest = UserRequests::findOrFail($id);
			
            if($UserRequest->status != "SEARCHING") {

                return response()->json(['error' => 'Request already under progress!']);
            }
            
            $UserRequest->provider_id = Auth::user()->id;

            if($UserRequest->schedule_at != "") {

                $beforeschedule_time = strtotime($UserRequest->schedule_at."- 1 hour");
                $afterschedule_time = strtotime($UserRequest->schedule_at."+ 1 hour");

                $CheckScheduling = UserRequests::where('status','SCHEDULED')
                            ->where('provider_id', Auth::user()->id)
                            ->whereBetween('schedule_at',[$beforeschedule_time,$afterschedule_time])
                            ->count();

                if($CheckScheduling > 0 ){
                    if($request->ajax()) {
                        return response()->json(['error' => trans('api.ride.request_already_scheduled')]);
                    }else{
                        return redirect('dashboard')->with('flash_error', 'If the ride is already scheduled then we cannot schedule/request another ride for the after 1 hour or before 1 hour');
                    }
                }

                RequestFilter::where('request_id',$UserRequest->id)->where('provider_id',Auth::user()->id)->update(['status' => 2]);

                $UserRequest->status = "SCHEDULED";
                $UserRequest->save();

            } else {
				
				
                $UserRequest->status = "STARTED";
				$UserRequest->save();
				
                
				ProviderService::where('provider_id',$UserRequest->provider_id)->update(['status' =>'riding']);
				
					
                $res = UserRequests::where('provider_id',$UserRequest->provider_id)->where('status','STARTED')->get();
                
				if($res[0]->status == 'STARTED') {
					
					$r = Provider::where('id',$UserRequest->provider_id)->get();
					
					UserRequests::where('id',$UserRequest->id)->where('id',$UserRequest->id)->update(['d_latitude' =>$r[0]->latitude,'d_longitude' =>$r[0]->longitude,'d_address' =>$UserRequest->s_address,'provider_service_type'=>$r[0]->provider_service_type]);
					
                }
              
                $Filters = RequestFilter::where('request_id', $UserRequest->id)->where('provider_id', '!=', Auth::user()->id)->get();
                // dd($Filters->toArray());
                foreach ($Filters as $Filter) {
                    $Filter->delete();
                }
            }

            $UnwantedRequest = RequestFilter::where('request_id','!=' ,$UserRequest->id)
                                ->where('provider_id',Auth::user()->id )
                                ->whereHas('request', function($query){
                                    $query->where('status','<>','SCHEDULED');
                                });

            if($UnwantedRequest->count() > 0){
                $UnwantedRequest->delete();
            }
			
			
			if( $UserRequest->request_type && $UserRequest->status == 'STARTED' ) {
				$total_price = $this->getRequestTotalAmount( $UserRequest );
				$UserRequest->request_amount =  $total_price;
				$UserRequest->status = 'AWAITING';
				$UserRequest->save();
			}

			
            // Send Push Notification to User
            (new SendPushNotification)->RideAccepted($UserRequest, $total_price);
          //  (new SendPushNotification)->sendPushToUser("hello android","");


            return $UserRequest->with('user')->get();

        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Unable to accept, Please try again later']);
        } catch (Exception $e) {
            return response()->json(['error' => 'Connection Error']);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
              'status' => 'required|in:ACCEPTED,STARTED,AWAITING,ARRIVED,PICKEDUP,DROPPED,PAYMENT,COMPLETED,STOPPED'
           ]);

        try{

            $UserRequest = UserRequests::with('user')->findOrFail($id);

            if($request->status == 'DROPPED' && $UserRequest->payment_mode != 'CARD') {
                $UserRequest->status = 'COMPLETED';
            }
            else if ($request->status == 'COMPLETED' && $UserRequest->payment_mode == 'CASH') {
                $UserRequest->status = $request->status;
                $UserRequest->paid = 1;
            }
             else if ($request->status == 'COMPLETED' && $UserRequest->payment_mode == 'CARD') {
                $UserRequest->status = $request->status;
                $UserRequest->paid = 1;

                $user_wallet = User::where('id',$UserRequest->user_id)->first();
                if($user_wallet->status == 1){
                
 
                $user_wallet->earning_money += $UserRequest->service_hour;
                $totalBillDeduct = UserRequestPayment::where('request_id',$UserRequest->id)->first();
                $deductionAmount = ($user_wallet->wallet_balance - $totalBillDeduct->total);
                User::where('id',$UserRequest->user_id)->update(['wallet_balance'=>$deductionAmount,'status'=>0,'earning_money'=>$user_wallet->earning_money]);
            
                }

               //  $UserRequest->surge = 5; 
                // ProviderService::where('provider_id',$UserRequest->provider_id)->update(['status' =>'active']);
            } else {
                $UserRequest->status = $request->status;

                if($request->status == 'ARRIVED'){
                  (new SendPushNotification)->Arrived($UserRequest);
                  
                
                }
            }

            if($request->status == 'PICKEDUP'){

                $UserRequest->started_at = Carbon::now();
				
                (new SendPushNotification)->Pickedup($UserRequest);

            }
			
			

             if($request->status == 'STOPPED'){

              

                $UserRequest->finished_at = Carbon::now();
            //     $this->getInvoice($UserRequest->id);
                (new SendPushNotification)->Stopped($UserRequest);

            

            }

            $UserRequest->save();

            if($request->status == 'DROPPED') {

            $UserRequest->invoice = $this->getInvoice($UserRequest->id);


                $UserRequest->total_time = $request->total_time;
                $UserRequest->save();
             
                $UserRequest->with('user')->findOrFail($id);

            
          

              // $UserRequest->invoice = $this->invoice($id);
               
            }

               

          
            // Send Push Notification to User
       
            return $UserRequest;

        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Unable to update, Please try again later']);
        } catch (Exception $e) {
            return response()->json(['error' => 'Connection Error']);
        }
    }

    public function get_all_sms_provider(Request $request)
    {
        $this->validate($request, [
                'provider_id' => 'required|integer',
                'user_id' => 'required|integer'
            ]);

        try
        {
            $requestdata = $request->input();
            $user_id = $requestdata['user_id'];
            $provider_id = $requestdata['provider_id'];
            
            $message = Messages::where('user_id',$user_id)->where('provider_id',$provider_id)->orderBy('created_at','asc')->get();

            return $message;

        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Please try again later']);
        } catch (Exception $e) {
            return response()->json(['error' => 'Connection Error']);
        }
    }

    public function get_recent_sms_provider(Request $request)
    {
        $this->validate($request, [
                'provider_id' => 'required|integer'
            ]);

        try
        {
            $requestdata = $request->input();
            $provider_id = $requestdata['provider_id'];

            // $message =  DB::select(DB::raw("SELECT * from (SELECT * FROM messages where provider_id = $provider_id Order by created_at desc) x GROUP BY user_id"));

            $message =  DB::select(DB::raw("select * from messages where id in (select MAX(id) from messages where provider_id = $provider_id GROUP by user_id)"));

            $returnData = array();
            $ind=0;
            foreach ($message as $msg) 
            {
                $returnData[$ind]['id'] = $msg->id;
                $returnData[$ind]['request_id'] = $msg->request_id;
                $returnData[$ind]['provider'] = Provider::where('id',$msg->provider_id)->first();
                $returnData[$ind]['user'] = User::where('id',$msg->user_id)->first();
                $returnData[$ind]['message'] = $msg->message;
                $returnData[$ind]['from_to'] = $msg->from_to;
                $returnData[$ind]['created_at'] = $msg->created_at;
                $ind++;
            }

            return $returnData;

        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Please try again later']);
        } catch (Exception $e) {
            return response()->json(['error' => 'Connection Error']);
        }
    }

    public function sendSMSToProvider(Request $request)
    {
        $this->validate($request, [
                'request_id' => 'required',
                'provider_id' => 'required',
                'user_id' => 'required',
                'message' => 'required',
            ]);

        $from_to_enum = "u_p";

        try
        {
            $requestdata = $request->input();

            $message = new Messages;
            $message->request_id = $requestdata['request_id'];
            $message->provider_id = $requestdata['provider_id'];
            $message->user_id = $requestdata['user_id'];
            $message->message = $requestdata['message'];
            $message->from_to = $from_to_enum;
            $message->save();

            (new SendPushNotification)->smsSendToProvider($message);

            return response()->json(['success' => 'Message Send Successfully']);

        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Please try again later']);
        } catch (Exception $e) {
            return response()->json(['error' => 'Connection Error']);
        }
       
    }

    public function get_all_sms_user(Request $request)
    {
        $this->validate($request, [
                'provider_id' => 'required|integer',
                'user_id' => 'required|integer'
            ]);

        try
        {
            $requestdata = $request->input();
            $user_id = $requestdata['user_id'];
            $provider_id = $requestdata['provider_id'];
            
            $message = Messages::where('user_id',$user_id)->where('provider_id',$provider_id)->orderBy('created_at','asc')->get();

            return $message;

        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Please try again later']);
        } catch (Exception $e) {
            return response()->json(['error' => 'Connection Error']);
        }
    }

    public function get_recent_sms_user(Request $request)
    {
        $this->validate($request, [
                'user_id' => 'required|integer'
            ]);

        try
        {
            $requestdata = $request->input();
            $user_id = $requestdata['user_id'];

            //$message =  DB::select(DB::raw("SELECT * from (SELECT * FROM messages where user_id = $user_id Order by created_at desc) x GROUP BY provider_id"));

            $message =  DB::select(DB::raw("select * from messages where id in (select MAX(id) from messages where user_id = $user_id GROUP by provider_id)"));

            $returnData = array();
            $ind=0;
            foreach ($message as $msg) 
            {
                $returnData[$ind]['id'] = $msg->id;
                $returnData[$ind]['request_id'] = $msg->request_id;
                $returnData[$ind]['provider'] = Provider::where('id',$msg->provider_id)->first();
                $returnData[$ind]['user'] = User::where('id',$msg->user_id)->first();
                $returnData[$ind]['message'] = $msg->message;
                $returnData[$ind]['from_to'] = $msg->from_to;
                $returnData[$ind]['created_at'] = $msg->created_at;
                $ind++;
            }

            return $returnData;

        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Please try again later']);
        } catch (Exception $e) {
            return response()->json(['error' => 'Connection Error']);
        }
    }

    public function sendSMSToUser(Request $request)
    {
         $this->validate($request, [
                'request_id' => 'required|integer',
                'provider_id' => 'required|integer',
                'user_id' => 'required|integer',
                'message' => 'required',
            ]);
        $from_to_enum = "p_u";

        try
        {
            $requestdata = $request->input();

            $message = new Messages;
            $message->request_id = $requestdata['request_id'];
            $message->provider_id = $requestdata['provider_id'];
            $message->user_id = $requestdata['user_id'];
            $message->message = $requestdata['message'];
            $message->from_to = $from_to_enum;
            $message->save();

            (new SendPushNotification)->smsSendToUser($message);

            return response()->json(['success' => 'Message Send Successfully']);

        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Please try again later']);
        } catch (Exception $e) {
            return response()->json(['error' => 'Connection Error']);
        }
       
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $UserRequest = UserRequests::find($id);

        try {
            $this->assign_next_provider($UserRequest->id);
            return $UserRequest->with('user')->get();

        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Unable to reject, Please try again later']);
        } catch (Exception $e) {
            return response()->json(['error' => 'Connection Error']);
        }
    }

    public function assign_next_provider($request_id) {

        try {
            $UserRequest = UserRequests::findOrFail($request_id);
        } catch (ModelNotFoundException $e) {
            // Cancelled between update.
            return false;
        }

        $RequestFilter = RequestFilter::where('provider_id', $UserRequest->current_provider_id)
            ->where('request_id', $UserRequest->id)
            ->delete();

        try {

            $next_provider = RequestFilter::where('request_id', $UserRequest->id)
                            ->orderBy('id')
                            ->firstOrFail();

          

            $UserRequest->current_provider_id = $next_provider->provider_id;

            // $UserRequest->provider_service_type = $next_provider->provider_service_type;
            $UserRequest->assigned_at = Carbon::now();
            $UserRequest->save();




            // incoming request push to provider
           # (new SendPushNotification)->IncomingRequest($next_provider->provider_id);
            
        } catch (ModelNotFoundException $e) {

            UserRequests::where('id', $UserRequest->id)->update(['status' => 'CANCELLED']);

            // No longer need request specific rows from RequestMeta
            RequestFilter::where('request_id', $UserRequest->id)->delete();

            //  request push to user provider not available
            (new SendPushNotification)->ProviderNotAvailable($UserRequest->user_id);
        }
    }

    public function invoice($request_id)
    {
        try {
            # $UserRequest = UserRequests::findOrFail($request_id);
            $tax_percentage = Setting::get('tax_percentage',10);
            $commission_percentage = Setting::get('commission_percentage',10);
            $service_type = ServiceType::findOrFail($UserRequest->service_type_id);

            $insurance_price = 0;
            $insuranceData = Insurances::where('insurance_id',$UserRequest->insurance_id)->first();
            if($insuranceData == null){
                $insurance_price = 0;
            }
            else{
                $insurance_price = $insuranceData->price ? $insuranceData->price : 0;
            }
            

            $kilometer = $UserRequest->distance;
            $Fixed = $service_type->fixed;
            $Distance = 0;
            $gettotal_time = explode(":", $UserRequest->total_time);
            $minutes = $gettotal_time[0];
            $Discount = 0; // Promo Code discounts should be added here.
            $Wallet = 0;
            $Surge = 0;

            if($service_type->calculator == 'MIN') {
                $Distance = $service_type->minute * $minutes;
            } else if($service_type->calculator == 'HOUR') {
                $Distance = $service_type->minute * 60;
            } else if($service_type->calculator == 'DISTANCE') {
                $Distance = ($kilometer * $service_type->price);
            } else if($service_type->calculator == 'DISTANCEMIN') {
                $Distance = ($kilometer * $service_type->price) + ($service_type->minute * $minutes);
            } else if($service_type->calculator == 'DISTANCEHOUR') {
                $Distance = ($kilometer * $service_type->price) + ($service_type->minute * $minutes * 60);
            } else {
                $Distance = ($kilometer * $service_type->price);
            }

            if($PromocodeUsage = PromocodeUsage::where('user_id',$UserRequest->user_id)->where('status','ADDED')->first()){
                if($Promocode = Promocode::find($PromocodeUsage->promocode_id)){
                    $Discount = $Promocode->discount;
                    $PromocodeUsage->status ='USED';
                    $PromocodeUsage->save();
                }
            }

            $Commision = ($Distance + $Fixed) * ( $commission_percentage/100 );
            $Tax = ($Distance + $Fixed) * ( $tax_percentage/100 );
            $Total = $Fixed + $Distance + $Tax - $Discount + $insurance_price;

            if($UserRequest->surge){
                $Surge = (Setting::get('surge_percentage')/100) * $Total;
                $Total += $Surge;
            }

            if($Total < 0){
                $Total = 0.00; // prevent from negative value
            }

            $Payment = new UserRequestPayment;
            $Payment->request_id = $UserRequest->id;
            $Payment->fixed = $Fixed;
            $Payment->distance = $Distance;
            $Payment->commision = $Commision;
            $Payment->surge = $Surge;
            $Payment->insurance = $insurance_price;
            if($Discount != 0 && $PromocodeUsage){
                $Payment->promocode_id = $PromocodeUsage->promocode_id;
            }
            $Payment->discount = $Discount;

            if($UserRequest->use_wallet == 1 && $Total > 0){

                $User = User::find($UserRequest->user_id);

                $Wallet = $User->wallet_balance;

                if($Wallet != 0){

                    if($Total > $Wallet) {

                        $Payment->wallet = $Wallet;
                        $Payable = $Total - $Wallet;
                        User::where('id',$UserRequest->user_id)->update(['wallet_balance' => 0 ]);
                        $Payment->total = abs($Payable);

                        // charged wallet money push 
                        (new SendPushNotification)->ChargedWalletMoney($UserRequest->user_id,currency($Wallet));

                    } else {

                        $Payment->total = 0;
                        $WalletBalance = $Wallet - $Total;
                        User::where('id',$UserRequest->user_id)->update(['wallet_balance' => $WalletBalance]);
                        $Payment->wallet = $Total;
                        
                        $Payment->payment_id = 'WALLET';
                        $Payment->payment_mode = $UserRequest->payment_mode;
                        $Payment->paid = 1;

                        $UserRequest->paid = 1;
                        $UserRequest->status = 'COMPLETED';
                        $UserRequest->save();

                        // charged wallet money push 
                        (new SendPushNotification)->ChargedWalletMoney($UserRequest->user_id,currency($Total));
                    }

                }

            } else {
                $Payment->total = abs($Total);
            }

            $Payment->tax = $Tax;
            $Payment->save();

            return $Payment;

        } catch (ModelNotFoundException $e) {
            return false;
        }
    }

    /**
     * Get the trip history details of the provider
     *
     * @return \Illuminate\Http\Response
     */
    public function history_details(Request $request)
    {
        $this->validate($request, [
                'request_id' => 'required|integer|exists:user_requests,id',
            ]);

        if($request->ajax()) {
            
            $Jobs = UserRequests::where('id',$request->request_id)
                                ->where('provider_id', Auth::user()->id)
                                ->with('payment','service_type','user','rating')
                                ->get();
                                
            if(!empty($Jobs)){
                $map_icon = asset('asset/img/marker-start.png');
                foreach ($Jobs as $key => $value) {
                    $Jobs[$key]->static_map = "https://maps.googleapis.com/maps/api/staticmap?".
                            "autoscale=1".
                            "&size=320x130".
                            "&maptype=terrian".
                            "&format=png".
                            "&visual_refresh=true".
                            "&markers=icon:".$map_icon."%7C".$value->s_latitude.",".$value->s_longitude.
                           // "&markers=icon:".$map_icon."%7C".$value->d_latitude.",".$value->d_longitude.
                            "&path=color:0x000000|weight:3|enc:".$value->route_key.
                            "&key=".env('GOOGLE_MAP_KEY');
                }
            }

            return $Jobs;
        }

    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function upcoming_trips() {
    
        try{
            $UserRequests = UserRequests::ProviderUpcomingRequest(Auth::user()->id)->get();
            if(!empty($UserRequests)){
                $map_icon = asset('asset/marker.png');
                foreach ($UserRequests as $key => $value) {
                    $UserRequests[$key]->static_map = "https://maps.googleapis.com/maps/api/staticmap?".
                                    "autoscale=1".
                                    "&size=320x130".
                                    "&maptype=terrian".
                                    "&format=png".
                                    "&visual_refresh=true".
                                    "&markers=icon:".$map_icon."%7C".$value->s_latitude.",".$value->s_longitude.
                                  //  "&markers=icon:".$map_icon."%7C".$value->d_latitude.",".$value->d_longitude.
                                    "&path=color:0x000000|weight:3|enc:".$value->route_key.
                                    "&key=".env('GOOGLE_MAP_KEY');
                }
            }
            return $UserRequests;
        }

        catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')]);
        }
    }

    /**
     * Get the trip history details of the provider
     *
     * @return \Illuminate\Http\Response
     */
    public function upcoming_details(Request $request)
    {

        $this->validate($request, [
                'request_id' => 'required|integer|exists:user_requests,id',
            ]);

        //if($request->ajax()) {
            $Jobs = UserRequests::where('id',$request->request_id)
                                ->where('provider_id', Auth::user()->id)
                                ->with('service_type','user')
                                ->get();
            if(!empty($Jobs)){
                $map_icon = asset('asset/img/marker-start.png');
                foreach ($Jobs as $key => $value) {
                    $Jobs[$key]->static_map = "https://maps.googleapis.com/maps/api/staticmap?".
                            "autoscale=1".
                            "&size=320x130".
                            "&maptype=terrian".
                            "&format=png".
                            "&visual_refresh=true".
                            "&markers=icon:".$map_icon."%7C".$value->s_latitude.",".$value->s_longitude.
                           // "&markers=icon:".$map_icon."%7C".$value->d_latitude.",".$value->d_longitude.
                            "&path=color:0x000000|weight:3|enc:".$value->route_key.
                            "&key=".env('GOOGLE_MAP_KEY');
                }
            }

            return $Jobs;
        //}

    }

    public function dailyearning_detail(Request $request)
    {

        $this->validate($request, [
                'request_id' => 'required|integer|exists:user_requests,id',
            ]);

        //if($request->ajax()) {
            $Jobs = UserRequests::where('provider_id',\Auth::guard('provider')->user()->id)
                    ->with('payment','service_type')
                    ->where('id',$request->request_id)
                    ->get();

            if(!empty($Jobs)){
                $map_icon = asset('asset/img/marker-start.png');
                foreach ($Jobs as $key => $value) {
                    $Jobs[$key]->static_map = "https://maps.googleapis.com/maps/api/staticmap?".
                            "autoscale=1".
                            "&size=320x130".
                            "&maptype=terrian".
                            "&format=png".
                            "&visual_refresh=true".
                            "&markers=icon:".$map_icon."%7C".$value->s_latitude.",".$value->s_longitude.
                           // "&markers=icon:".$map_icon."%7C".$value->d_latitude.",".$value->d_longitude.
                            "&path=color:0x000000|weight:3|enc:".$value->route_key.
                            "&key=".env('GOOGLE_MAP_KEY');
                }
            }

            return $Jobs;
        //}

    }

    /**
     * Get the trip history details of the provider
     *
     * @return \Illuminate\Http\Response
     */
    public function summary(Request $request)
    {
        try{
            if($request->ajax()) {
                $rides = UserRequests::where('provider_id', Auth::user()->id)->count();
                $revenue = UserRequestPayment::whereHas('request', function($query) use ($request) {
                                $query->where('provider_id', Auth::user()->id);
                            })
                        ->sum('total');

                $commision = UserRequestPayment::whereHas('request', function($query) use ($request) {
                                $query->where('provider_id', Auth::user()->id);
                            })
                        ->sum('commision');

                $cancel_rides = UserRequests::where('status','CANCELLED')->where('provider_id', Auth::user()->id)->count();
                $scheduled_rides = UserRequests::where('status','SCHEDULED')->where('provider_id', Auth::user()->id)->count();

                return response()->json([
                    'rides' => $rides, 
                    'total_earn'=>$commision,
                    'revenue' => $revenue,
                    'cancel_rides' => $cancel_rides,
                    'scheduled_rides' => $scheduled_rides,
                ]);
            }

        } catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')]);
        }

    }


    /**
     * help Details.
     *
     * @return \Illuminate\Http\Response
     */

    public function help_details(Request $request){

        try{

            if($request->ajax()) {
                return response()->json([
                    'contact_number' => Setting::get('contact_number',''), 
                    'contact_email' => Setting::get('contact_email','')
                     ]);
            }

        }catch (Exception $e) {
            if($request->ajax()) {
                return response()->json(['error' => trans('api.something_went_wrong')]);
            }
        }
    }

    /**
     * Set Prescrition in User-request
     *
     * @return \Illuminate\Http\Response
     */
    public function set_prescrition(Request $request)
    {
        $this->validate($request, [
                'user_request_id' => 'required|integer',
                'prescrition' => 'max:255'
            ]);

        try 
        {
            $UserRequest = UserRequests::findOrFail($request->user_request_id);
            $UserRequest->prescrition = $request->prescrition;
            $UserRequest->save();

            return response()->json(['success' => 'Prescrition Updated Successfully']);
        }
        catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'User Request data not Found'], 500);
        }
    }

    /**
     * Set Signature Image in User-request
     *
     * @return \Illuminate\Http\Response
     */
    public function set_signatureImg(Request $request)
    {
        $this->validate($request, [
                'user_request_id' => 'required|integer',
                'signature' => 'file|mimes:jpeg,bmp,png,jpg|min:1|max:5120'
            ]);

        try 
        {
            $UserRequest = UserRequests::findOrFail($request->user_request_id);
            Storage::delete($UserRequest->signature);
            $UserRequest->signature = $request->signature->store('provider/documents');
            $UserRequest->save();

             return response()->json(['success' => 'Signature Update Successfully']);
        }
        catch (ModelNotFoundException $e) {
             return response()->json(['error' => 'User Request data not Found'], 500);
        }
    }


public function madeReview(Request $request){ //PRESCRIPTION & SIGNATURES
    
     $this->validate($request, [
                'prescription' => 'required|max:255',
                'signature' => 'required|mimes:jpeg,bmp,png',
                'request_id'=>'required|max:255'
            ]);

   try 
        {
      
                Storage::delete($request->signature);
                $pic = $request->signature->store('signature/provider');

        $user = UserRequests::where('booking_id',$request->request_id)->update(["signature"=>$pic,"prescription"=>$request->prescription]);

        if($user){
         
         UserRequests::where('booking_id',$request->request_id)->update(["status"=>"DROPPED"]);
         $UserRequest = UserRequests::with('user')->where('booking_id',$request->request_id)->first();

         $data = UserRequests::select('id','booking_id','prescription','signature')->where('booking_id',$request->request_id)->get();
         $data[0]['invoice']=$this->getInvoice($data[0]->id);

        (new SendPushNotification)->Signature($UserRequest);

        return response()->json([
                    
                    'status' => 1,
                    'data' => $data,
                    
                    
                ]);

        } else {
        
        return response()->json([                   
                    'status' => 0,
                    'msg' => 'wrong value you passed in query',                   
                ]);

        }
        }
         catch (ModelNotFoundException $e) {
             return response()->json(['error' => 'Error-trip'], 500);
        }
        
    }

   public function stopWork(Request $request){
         
         $this->validate($request, [
                   'request_id'=>'required|max:255'
                ]);
  
         $UserRequest= UserRequests::with('user')->where('booking_id',$request->request_id)->first();
        if(empty($UserRequest->finished_at)){
                $r = UserRequests::where('booking_id',$request->request_id)->update(["finished_at"=>Carbon::now(),'status'=>'STOPPED']);
                
                if($r){
                  (new SendPushNotification)->Stopped($UserRequest);
                    return response()->json([                   
                                'status' => 1,
                                'msg' => 'Successfully finished_at',                   
                            ]);
                }

        } else {

             return response()->json([                   
                            'status' => 0,
                            'msg' => 'you have already stopped your work timer',                   
                        ]);
        }
    }




 public function getInvoice($requestId){
      $invoice = [];      

      $UserRequest = UserRequests::where('id',$requestId)->first();
      $provider = Provider::where('id',$UserRequest->provider_id)->first();
      
      $settings = Settings::where('key','tax_percentage')->first();
      
      $commission_percentage = Setting::get('commission_percentage',10);

      
     
        if($UserRequest->insurance_id != 0){
      $insurance = Insurances::where('insurance_id',$UserRequest->insurance_id)->first();
      $insurance_price = $insurance->price;
      }else{ $insurance_price = 0;}
      

       $earning_money = $UserRequest->service_hour; //as earning money

       $total = ($provider->base_amount*$UserRequest->service_hour) - $earning_money;

       $total_amount = ($total + $insurance_price ) ;
       $tax = ($total + $insurance_price ) * ($settings->value/100);
      
       $total_price = $total_amount + $tax;

      
          

        $checkd = UserRequestPayment::where('request_id',$UserRequest->id)->count();
       if($checkd == 0){


       $Payment = new UserRequestPayment;
            $Payment->request_id = $UserRequest->id;
             $Payment->user_service_hour = $UserRequest->service_hour;
              $Payment->provider_base_amount = $provider->base_amount;
               $Payment->request_id = $UserRequest->id;
             $Payment->earning_money = $earning_money;
             $Payment->fixed = $total;    

             
            
            $Payment->insurance = $insurance_price;
            $Payment->tax = $settings->value;
             $Payment->total = $total_price;
            $Payment->save();

        }
        else{ $Payment =  UserRequestPayment::where('request_id',$UserRequest->id)->first(); }
       
       



      
    
      
      return $Payment;
      

       }


 

 public function generate_invoice($booking_id)
    {
        try {
			

            $UserRequestInvoice = UserRequests::where('booking_id',$booking_id)->first();
            $tax_percentage = Setting::get('tax_percentage',10);
            $commission_percentage = Setting::get('commission_percentage',10);
            $service_type = ServiceType::findOrFail($UserRequestInvoice->service_type_id);

            $insurance_price = 0;
            $insuranceData = Insurances::where('insurance_id',$UserRequestInvoice->insurance_id)->first();
            if($insuranceData == null){
                $insurance_price = 0;
            }
            else{
                $insurance_price = $insuranceData->price ? $insuranceData->price : 0;
            }
            

            $kilometer = $UserRequestInvoice->distance;
            $Fixed = $service_type->fixed;
            $price = $service_type->fixed;
            $Distance = 0;
            $gettotal_time = explode(":", $UserRequestInvoice->total_time);
            $minutes = $gettotal_time[0];
            $Discount = 0; // Promo Code discounts should be added here.
            $Wallet = 0;
            $Surge = 0;

            
             if(count($UserRequestInvoice)!="")
             {
                if($UserRequestInvoice->started_at === null){
                    $UserRequestInvoice->started_at  = Carbon::now();
                }

             $startDate = Carbon::createFromFormat('Y-m-d H:i:s', $UserRequestInvoice->started_at);
             if(isset($r[0]->finished_at)){

             $endDate = Carbon::createFromFormat('Y-m-d H:i:s', $UserRequestInvoice->finished_at);

             $days = $startDate->diffInDays($endDate);
             $hours = $startDate->copy()->addDays($days)->diffInHours($endDate);
             $minutes = $startDate->copy()->addDays($days)->addHours($hours)->diffInMinutes($endDate);
             $total_minute = $hours.' Hours '.$minutes.' Minutes';
             
             }
			 
             else{

             $endDate = Carbon::createFromFormat('Y-m-d H:i:s', Carbon::now());

             $days = $startDate->diffInDays($endDate);
             $hours = $startDate->copy()->addDays($days)->diffInHours($endDate);
             $minutes = $startDate->copy()->addDays($days)->addHours($hours)->diffInMinutes($endDate);
             $total_minute = $hours.' Hours '.$minutes.' Minutes';

             }

         }else{

            return response()->json(["status"=>0,"msg"=>"wrong value passed or result return []"]);
         }

          if($service_type->calculator == 'MIN') {
                $price +=  ((($hours*60)+$minutes)*$service_type->minute);       //$service_type->minute as price
            }
             else{  return "Only minute Calculator allow ..please set calculator as MIN in admin panel";  }



            if($PromocodeUsage = PromocodeUsage::where('user_id',$UserRequestInvoice->user_id)->where('status','ADDED')->first()){
                if($Promocode = Promocode::find($PromocodeUsage->promocode_id)){
                    $Discount = $Promocode->discount;
                    $PromocodeUsage->status ='USED';
                    $PromocodeUsage->save();
                }
            }

            $Commision = ($Distance + $Fixed) * ( $commission_percentage/100 );
            $Tax = ($Distance + $Fixed) * ( $tax_percentage/100 );
            $Total = $Fixed + $Distance + $Tax - $Discount + $insurance_price;

            if($UserRequestInvoice->surge){
                $Surge = (Setting::get('surge_percentage')/100) * $Total;
                $Total += $Surge;
            }

            if($Total < 0){
                $Total = 0.00; // prevent from negative value
            }

            $Payment = new UserRequestPayment;
            $Payment->request_id = $UserRequestInvoice->id;
            $Payment->fixed = $Fixed;
            $Payment->distance = $Distance;
            $Payment->commision = $Commision;
            $Payment->surge = $Surge;
            $Payment->insurance = $insurance_price;
            if($Discount != 0 && $PromocodeUsage){
                $Payment->promocode_id = $PromocodeUsage->promocode_id;
            }
            $Payment->discount = $Discount;

            if($UserRequestInvoice->use_wallet == 1 && $Total > 0){

                $User = User::find($UserRequestInvoice->user_id);

                $Wallet = $User->wallet_balance;

                if($Wallet != 0){

                    if($Total > $Wallet) {

                        $Payment->wallet = $Wallet;
                        $Payable = $Total - $Wallet;
                        User::where('id',$UserRequestInvoice->user_id)->update(['wallet_balance' => 0 ]);
                       // $Payment->total = abs($Payable);

                        // charged wallet money push 
                        (new SendPushNotification)->ChargedWalletMoney($UserRequestInvoice->user_id,currency($Wallet));

                    } else {

                        $Payment->total = 0;
                        $WalletBalance = $Wallet - $Total;
                        User::where('id',$UserRequestInvoice->user_id)->update(['wallet_balance' => $WalletBalance]);
                        $Payment->wallet = $Total;
                        
                        $Payment->payment_id = 'WALLET';
                        $Payment->payment_mode = $UserRequestInvoice->payment_mode;
                        $Payment->paid = 1;

                        $UserRequestInvoice->paid = 1;
                        $UserRequestInvoice->status = 'COMPLETED';
                        $UserRequestInvoice->save();

                        // charged wallet money push 
                        (new SendPushNotification)->ChargedWalletMoney($UserRequestInvoice->user_id,currency($Total));
                    }

                }

            } else {
              #  $Payment->total = abs($Total);
            }
           # $Payment->tax = $Tax;
             $Payment->total_minute = (($hours*60)+$minutes);
             $Payment->per_price= $service_type->minute;
            $Payment->total = abs($price)+$insurance_price;

            $Payment->save();
            $Payment['bill'] = ["total_amount"=>abs($price)+$insurance_price,"total_worked_minute"=>$hours.' hours '.$minutes.' minutes',"base_amount"=>$service_type->fixed,"work_per_minute_amount"=>$service_type->minute];
            ($UserRequestInvoice->signature!=null)?
            $Payment['content'] = ["prescription"=>$UserRequestInvoice->prescrition,"signature"=>url('storage/app/public').'/'.$UserRequestInvoice->signature]: $Payment['content'] = ["prescription"=>$UserRequestInvoice->prescrition,"signature"=>$UserRequestInvoice->signature];
            
            return $Payment;
            // return response()->json(['data'=>$Payment]);

        } catch (ModelNotFoundException $e) {
            return false;
        }
    }
	
	//Invoice
	public function getChat(Request $request){

        $this->validate($request, [
                'request_id' => 'required',              
            ]);

          

          //  $UserRequest = UserRequests::with('user')->findOrFail($request->request_id);
                        
                 $userName = Auth::user()->first_name.' '.Auth::user()->last_name;
                if($request->has('message') && $request->has('provider_id') && $request->has('user_id') && $request->has('type')){

                 //push notification

                (new SendPushNotification)->chatNotify($request->user_id,$request->message,$request->request_id,$userName);

              $msgCreate = Chat::Create([
                                        'request_id'=>$request->request_id,
                                        'provider_id'=>$request->provider_id,
                                        'user_id'=>$request->user_id,
                                         'message'=>$request->message,
                                         'type'=>$request->type,
                                        ]);
               }

	 	$r = Chat::where('request_id',$request->request_id)->get();

	 	 return response()->json(['status'=>1,"data"=>$r]);
	 }

     public function services(){

       $data = ServiceType::select('id','provider_name')->groupBy('provider_name')->get();
       if(count($data) !==0){
       return response()->json(['status'=>1,'data'=>$data,'msg'=>'Available service types list']);
      }
      else{
         return response()->json(['status'=>1,'msg'=>' service types list not Available']);
           }
     }

      public function getSubServices(Request $request){
      
       $this->validate($request, [
                'service_name' => 'required',              
            ]);

       $data = ServiceType::select('id','name')->where('provider_name',$request->service_name)->get();
       if(count($data) !==0){
       return response()->json(['status'=>1,'data'=>$data,'msg'=>'Available service types list']);
      }
      else{
         return response()->json(['status'=>1,'msg'=>' service types list not Available']);
           }
     }

 public function getSubCatServices(Request $request){
      
       $this->validate($request, [
                'service_name' => 'required',              
            ]);

       $data = ServiceType::select('id','name')->where('provider_name',$request->service_name)->get();
       if(count($data) !==0){
       return response()->json(['status'=>1,'data'=>$data,'msg'=>'Available service types list']);
      }
      else{
         return response()->json(['status'=>1,'msg'=>' service types list not Available']);
           }
     }

    public function getCountry(Request $request){
     

       $data = Settings::select('id','key','value')->where('type',1)->get();
       if(count($data) !==0){
       return response()->json(['status'=>1,'data'=>$data,'msg'=>'country list Available']);
      }
      else{
         return response()->json(['status'=>1,'msg'=>' country list not Available']);
           }
     }

      public function getAvailableTime(Request $request){
     

       $data = Settings::select('id','value')->where('type',3)->get();
       
       if(count($data) !==0){
       return response()->json(['status'=>1,'data'=>$data,'msg'=>'available time ']);
      }
      else{
         return response()->json(['status'=>0,'msg'=>' country list not Available']);
           }
     }


 public function new_account(Request $request){


  

           $r = ServiceType::select('provider_name','id')->where('id',$request->service_type_id)->get();

           
      
                 $Newdata = [
             "provider_service_type" => $r->provider_name,
             "service_type_id"=>$request->service_type_id,
             "major_service_type_id"=>$r->id,
             "available_to"=>$request->available_to,
             "base_amount"=>$request->base_amount,
             "provider_id" => Auth::user()->id,
             "currency_id" => Auth::user()->currency_id
                     
                ];

         $count = AccountSwitch::where('provider_id',Auth::user()->id)->where('provider_service_type',$r->provider_name)->first();

         if(count($count) == 0){
 
         $r = AccountSwitch::Create($Newdata);

         

           return response()->json(["status"=>2,"msg"=>"you have successfully created new account"]);

            
    }else{

     return response()->json(["status"=>0,"msg"=>"account already created try with another data"]);
            }
       
     }

  public function account_switch(Request $request){


       $this->validate($request, [
                'provider_service_type' => 'required',
               
            ]);

   $firstUp = [
              "provider_service_type" => Auth::user()->provider_service_type,
             "service_type_id"=>Auth::user()->service_type_id,
              "major_service_type_id"=>Auth::user()->major_service_type_id,
             "available_to"=>Auth::user()->available_to,
             "base_amount"=>Auth::user()->base_amount,
             "available_for_emergency"=>Auth::user()->available_for_emergency,
             "currency_id"=>Auth::user()->currency_id
                     
                ];


AccountSwitch::where('provider_id',Auth::user()->id)->where('provider_service_type',Auth::user()->provider_service_type)->update($firstUp);

 // from incoming request update to in provider table


   $res = AccountSwitch::where('provider_id',Auth::user()->id)->where('provider_service_type',$request->provider_service_type)->get();

   $secondUp = [
             "provider_service_type" => $res[0]->provider_service_type,
             "service_type_id"=>$res[0]->service_type_id,
             "major_service_type_id"=>$res[0]->major_service_type_id,
             "available_to"=>$res[0]->available_to,
             "base_amount"=>$res[0]->base_amount,
             "available_for_emergency"=>$res[0]->available_for_emergency,
             "currency_id"=>$res[0]->currency_id
                     
                ];

 ProviderService::where('provider_id',Auth::user()->id)->update(['service_type_id'=>$res[0]->major_service_type_id]);

 Provider::where('id',Auth::user()->id)->where('provider_service_type',Auth::user()->provider_service_type)->update($secondUp);

   
  
   return response()->json(["status"=>1,"msg"=>"successfully switched account"]);

  
    
  

       
     }

public function account_switch_list(Request $request){



  $r = AccountSwitch::where('provider_id',Auth::user()->id)->get();
  if(count($r) != 0){

   foreach($r as $k=>$v){
   if($v->provider_service_type == Auth::user()->provider_service_type){
   $r[$k]['account'] = 'active';
   }else { $r[$k]['account'] = 'offline'; }
   
     }

  return response()->json(["status"=>1,"data"=>$r]);
  
  }
  else{
 
return response()->json(["status"=>0,"msg"=>"new account not found"]);
   }
 

}
   

public function videoCall_user(Request $request){

(new SendPushNotification)->videoNotify($request->user_id,$request->video_status,$request->random_id);
return response()->json(["status"=>1,"data"=>$request->all()]);
}


public function withdrawalRequest(Request $request){

 $this->validate($request, [
                'provider_id' => 'required|int',
                'bank_account_id' => 'required',
                'amount' => 'required|int',  //bank token btok_we32e3
               
            ]);
   
  $totalEarn = UserRequestPayment::whereHas('request', function($query) use ($request) {
                                $query->where('provider_id', Auth::user()->id);
                            })
                        ->sum('commision');

          
    if($request->amount <= $totalEarn){              
   
   $r = WithdrawalMoney::Create($request->all()); 
   $status = 1;
   $msg = 'successfully requested for withdrawal';
}
else
{
    $r = [];
    $status = 0;
   $msg = 'You do not have sufficient balance .plese take less amount of your earn amount';

}

    if($request->ajax()) {
                   return response()->json(['status'=>$status,'data'=>$r,'msg'=>$msg]);
                } 
}

public function withdrawRequestList(Request $request){

   $totalEarn = UserRequestPayment::whereHas('request', function($query) use ($request) {
                                $query->where('provider_id', Auth::user()->id);
                            })
                        ->sum('commision');

          $totalEarn? : 0;              

$r =  WithdrawalMoney::where('provider_id',Auth::user()->id)->where('status','APPROVED')->sum('amount');
    

     if($r != 0){
 
     $res = $r;
     $status = 1;
    
     $afterdeduct = ($totalEarn-$r);
     $amount = $afterdeduct;
    

     }
     else{
     
      $res = 0;
      $status = 0;
     $amount = $totalEarn;


     }

     return response()->json(["status"=>$status,"data"=>$res,'totalEarn'=>$amount]);
}

  public function uploadDocument(Request $request)
    {

         $this->validate($request, [
                'document' => 'mimes:jpg,jpeg,png,pdf',
                'type' => 'required',
                'id'   => 'required'
            ]);


       $r = ProviderDocument::create([
                    'url' => $request->document->store('provider/documents'),
                    'provider_id' => Auth::user()->id,
                    'document_id' => $request->id,
                    'status' => 'ASSESSING',
                ]);

        return response()->json(['status'=>'1','data'=>$r]);

    }

    public function documentList(Request $request){

         $doc = ProviderDocument::where('provider_id',Auth::user()->id)->get();

        $r = Document::select('id','name','type')->get();

        return response()->json(['data'=>$r,'uploadDocument'=>$doc]);


    }


   
	public function trackTimer(Request $request) {

        $this->validate($request, [
                   'request_id'=>'required'
                ]);


         $now = Carbon::now();

						 
			   $res = UserRequests::where('booking_id',$request->request_id)->first();
			  
			  

						  $status = 2;


			if(isset($res->started_at))
			{
			 $minuteServices = (new Carbon($res->started_at))->addHours($res->service_hour);
  
                if($now > $minuteServices){
                
                if($res->status != 'STOPPED'){
                 UserRequests::where('id',$res->request_id)->update(['service_hour_status'=>1,'status'=>'STOPPED']);
                 
                 
                 $timer = 'your request time '.$res->service_hour.' hours has been completed';
                 }
                 else{

                 $timer = 'already done';

                 }
                  $status = 0;


                } else {
                
             $timer = $now->diff($minuteServices)->format('%H:%I:%S');

              $status = 1;
                }
                
                }
          

       return response()->json(['status'=>$status,'timer'=>$timer]);
    
    }
	
	public function getRequestTotalAmount( $user_request ) {
        
		try {
			
			$amount 		 = 0;
            $insurance_price = 0;
            
			
            $kilometer 		=	$user_request->distance;
			
            $service_type 	=	ServiceType::where('id', $user_request->service_type_id )->first();
			
			
			
			$tax_percentage	=	Setting::get('tax_percentage',10);
            $insuranceData 	=	Insurances::where('insurance_id',$user_request->insurance_id)->first();
			
			
			
            if( $insuranceData ) {
                $insurance_price = $insuranceData->price;
            }
			
			if( $user_request->started_at === null ) {
				$user_request->started_at  = Carbon::now();
			}
			
			
			if( $user_request->request_type ) {
				
				$req_hours		=	$user_request->service_hour;
				$price			=	$service_type->price;
				$amount			=  $req_hours * $price;
			
			} else { 
			
				$req_finished	=	strtotime($user_request->finished_at);
				$req_started	=	strtotime($user_request->started_at);
				$minutes		=	($req_finished -  $req_started) / 60;
				$amount 		=	$service_type->fixed;
				
				
				if($service_type->calculator == 'MIN') {
					$amount += $service_type->minute * $minutes;
				} else if($service_type->calculator == 'HOUR') {
					$amount += $service_type->minute * ( $minutes / 60 );
				} else if($service_type->calculator == 'DISTANCE') {
					$amount += ( ( $kilometer - $service_type->distance ) * $service_type->price);
				} else if($service_type->calculator == 'DISTANCEMIN') {
					$amount +=  ( ( $kilometer - $service_type->distance ) * $service_type->price)  + ($service_type->minute * $minutes);
				} else if($service_type->calculator == 'DISTANCEHOUR') {
					$amount += ( ( ( $kilometer - $service_type->distance ) * $service_type->price)  * $service_type->price) + ($service_type->minute * ( $minutes / 60 ) );
				}
			}			
	
		
			
			//Surge amount added
            $distance 			= Setting::get('provider_search_radius', '10');
            $latitude 			= $user_request->s_latitude;
            $longitude 			= $user_request->s_longitude;
			$ActiveProviders 	= ProviderService::AvailableServiceProvider($user_request->service_type_id)->get()->pluck('provider_id');

            $Providers = Provider::whereIn('id', $ActiveProviders)
                ->where('status', 'approved')
                ->whereRaw("(1.609344 * 3956 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ) <= $distance")
                ->get();
      
            if($Providers->count() <= Setting::get('surge_trigger') && $Providers->count() > 0) {
                $surge_price = (Setting::get('surge_percentage')/100) * $total;
                $amount += $surge_price;
            }
			
            //Discount amount Added
			if($PromocodeUsage	= PromocodeUsage::where('user_id', $user_request->user_id)->where('status','ADDED')->first() ) {
                if($Promocode	= Promocode::find($PromocodeUsage->promocode_id)) {
                    $Discount	= $Promocode->discount;	
					
					//Discount applied
					$amount = $amount - $Discount;
                }
            }
			
			//Tax amount Added
            $tax 		=	$amount * ( $tax_percentage/100 );
			$amount 	= 	$amount + $tax;
			
			
			return number_format($amount, 2, '.', '');

        } catch (Exception $e ) {
			
            return response()->json(['status'=>$e->getMessage() ]);
        }
	}




public function profile_video(Request $request){

    $this->validate($request, [
                
                
                'video' => 'mimes:mp4,ogx,oga,ogv,ogg,webm,mov ',
                
             
            ]);
try{
     
   //  foreach($request->video as $key=>$file){
     
   

     $videos = '/storage/app/public/'.$request->video->store('user/uploads');
     
         
    Provider::where('id',Auth::user()->id)->update(['video'=>$videos]);
  
     
   //  }
     
  // $data = Provider::where('id',$request->provider_id)->get();

return response()->json(['status'=>1,'msg'=>'successfully uploaded']);

} catch (Exception $e) {
             return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }

}


public function rating_level(Request $request){

 $res = UserRequestRating::where('provider_id',$request->provider_id)->where('user_rating','<>','null')->count();
  $res = 0;
  if($res >= 10 && $res <50){

    $level = '1st';
  }
   elseif($res >= 50 && $res < 100){

    $level = '2nd';
  }
  elseif($res >= 100){

    $level = '3rd';
  }
  else{
    $level = 0;
  }

  return response()->json(['status'=>1,'level'=>$level]);
}


public function getMembershipList(Request $request){

$data = ProviderMembership::all();

return response()->json(['status'=>1,'data'=>$data]);

}



public function getActivationMembership(Request $request){

$data = Provider::where('id',Auth::user()->id)->update(['provider_membership_id'=>$request->provider_membership_id]);

return response()->json(['status'=>1,'msg'=>'activated successfully']);

}



 public function sendEmailReminder(Request $request)
    {

        return UserInvitation::all();
       // $user = User::findOrFail($id);

   return    Mail::raw('Text to e-mail', function ($message) {
    $message->from('support@carecrew.care', 'Laravel');

    $message->to('jawed7siddiqui@gmail.com');
});
    }


 public function getLang(Request $request){

$data = Provider::where('id',Auth::user()->id)->update(['lang'=>$request->lang]);

return response()->json(['status'=>1,'msg'=>'language selected successfully','lang'=>$request->lang]);

}



 public function getInvitationsList(Request $request)
    {

        $data = UserInvitation::all();

        return response()->json(['status'=>1,'data'=>$data]);

    
    }


public function sendInvitations(Request $request)
    {
   $this->validate($request, [              
                
                'email' => 'required',
                'body'=>'required',  //msg body
          
            ]);

        //email match from user database user if exists then mail go only for exists users of app

        try{

        $data = User::where('id',Auth::user()->id)->whereIn('email',[$request->email])->get(); // get if email exists 


        return response()->json(['status'=>1,'msg'=>'successfully sent mail to users']);

    }catch(Exception $e){

     return response()->json(['error' => trans('api.something_went_wrong')], 500);
 

    }
    }






}




