<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\ModelNotFoundException;

use DB;
use Log;
use Auth;
use Hash;
use Storage;
use Setting;
use Exception;
use Notification;
use Validator;
use Session;

use Carbon\Carbon;
use App\Http\Controllers\SendPushNotification;
use App\Notifications\ResetPasswordOTP;
use App\Helpers\Helper;

use App\Card;
use App\User;
use App\Provider;
use App\Settings;
use App\Promocode;
use App\ServiceType;
use App\UserRequests;
use App\RequestFilter;
use App\PromocodeUsage;
use App\ProviderService;
use App\UserRequestRating;
use App\UserRequestPayment;
use App\Insurances;
use App\ProviderBookmarks;
use App\Offer;
use App\SellingItem;
use App\ItemRequest;
use App\CourierDetail;
use App\StoreUser;
use App\Category;
use App\SubCategory;
use RegistersUsers;
//use App\StoreUser;

use App\Http\Controllers\ProviderResources\TripController;



class StoreController extends Controller
{
    public function dashboard()
    {
        try{

            $rides = UserRequests::has('user')->orderBy('id','desc')->get();
            $cancel_rides = UserRequests::where('status','CANCELLED');
            $scheduled_rides = UserRequests::where('status','SCHEDULED')->count();
            $user_cancelled = $cancel_rides->where('cancelled_by','USER')->count();
            $provider_cancelled = $cancel_rides->where('cancelled_by','PROVIDER')->count();
            $cancel_rides = $cancel_rides->count();
            $service = ServiceType::count();
            $revenue = UserRequestPayment::sum('total');

            return view('store.dashboard',compact('providers','scheduled_rides','service','rides','user_cancelled','provider_cancelled','cancel_rides','revenue'));
        }
        catch(Exception $e){
            return redirect()->route('store.user.index')->with('flash_error','Something Went Wrong with Dashboard!');
        }
    }

    protected function register(Request $request)
    {
		 $this->validate($request, [
            'first_name' => 'required|max:255',
            'phone_number' => 'required',
            'email' => 'required|email|max:255|unique:store_users',
            'password' => 'required|min:6|confirmed',
            'store_type' =>'required'
        ]);
		       
        
        $store['password'] = bcrypt($request->password);
        $store['mobile'] = $request->phone_number;
        $store['name'] = $request->first_name;
        $store['email'] = $request->email;
        $store['store_type'] = $request->store_type;
        StoreUser::create($store);
        return redirect('store/login');

    }
    public function login(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required'
        ]);
        
        $email = $request->input('email');
        $password = $request->input('password');
    
        $user = StoreUser::where('email', '=', $email)->first();
        if (!$user) {
            return response()->json(['success'=>false, 'message' => 'Login Fail, please check email id']);
            return redirect('store/login');
        }
        if (!Hash::check($password, $user->password)) {
            return response()->json(['success'=>false, 'message' => 'Login Fail, pls check password']);
            return redirect('store/login');
        }
            //return response()->json(['success'=>true,'mes;sage'=>'success', 'data' => $user]);
            Session::set('storesession', $user);

            return view('store.dashboard',compact('user'));
            //return redirect('store/dashboard');
        
    }
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // echo "Dashboard page";
        // exit()
         try{

            $rides = UserRequests::has('user')->orderBy('id','desc')->get();
            $cancel_rides = UserRequests::where('status','CANCELLED')->where('provider_id',\Auth::guard('store')->user()->id);
            $scheduled_rides = UserRequests::where('status','SCHEDULED')->where('provider_id',\Auth::guard('store')->user()->id)->count();
           
            $completed_rides = UserRequests::where('status','COMPLETED')->where('provider_id',\Auth::guard('store')->user()->id)->count();
        
            //$accepted_rides = UserRequests::where('status','ACCEPTED')->where('provider_id',\Auth::guard('provider')->user()->id)->count();
            $accepted_rides = $scheduled_rides + $completed_rides;
            $cancel_rides = $cancel_rides->count();
            $rides = $rides->where('provider_id',\Auth::guard('store')->user()->id);
            //$date = date('Y-m-d H:i:s');
            //echo $carbon = Carbon::today();

            $from_date1 = date("Y-m-d")." 00:00:00";
            $to_date1 = date("Y-m-d")." 23:59:59";
           
            //$today_rides = $rides->where('provider_id',\Auth::guard('provider')->user()->id)->where('created_at', '>=', $from_date1)->andwhere('created_at', '<', $to_date1);
        
            $today_rides = $rides->where('provider_id',\Auth::guard('store')->user()->id)->where('created_at', '>', Carbon::today()->startOfDay())->where('created_at', '<', Carbon::today()->endOfDay());

            //whereBetween('created_at', [$from_date1, $to_date1]);
           
            $fully = UserRequests::where('provider_id',\Auth::guard('store')->user()->id)
                    ->with('payment','service_type')
                    ->get();

            return view('store.index',compact('scheduled_rides','cancel_rides','rides','accepted_rides','today_rides','completed_rides','fully'));
        }
        catch(Exception $e){
            
            return redirect()->route('store.index')->with('flash_error','Something Went Wrong with Dashboard!');
        }

    }
     
    public function details(Request $request) {
        
        $this->validate($request, [
            'device_type' => 'in:android,ios',
            
        ]);
		
		
        try{

		
            if($user = StoreUser::find($request->store_user_id)){

                if($request->has('device_token')){
                    $user->device_token = $request->device_token;
                }

                if($request->has('device_type')){
                    $user->device_type = $request->device_type;
                }

                if($request->has('device_id')){
                    $user->device_id = $request->device_id;
                }

                $user->save();

           
 
             
                return $user;

            } else {
                return response()->json(['error' => trans('api.user.user_not_found')], 500);
            }
        }
        catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }

    }
    
    
    
    public function addItem(Request $request) {
		
	
		
        $this->validate($request, [
            'item_name' => 'required',
            'item_price' => 'required',
            'item_type' => 'required',
            'selling_item_price' => 'required',
            'quantity' => 'required',
            'description' => 'required',
            'service_provider_id' => 'required',
            'item_image' =>  'mimes:jpeg,bmp,png',
           
           
            
        ]);
		
		
        try{

		
            $addItem = SellingItem::create($request->all());
            
                      if ($request->item_image != "") {
                // Storage::delete($user->picture);
               
               SellingItem::where('id',$addItem->id)->update(['item_image'=>$request->item_image->store('user/profile')]);
            }
            
            return $addItem;
          
        }
        catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }

    }
    
    
     public function editItem(Request $request) {
		
	
		
        $this->validate($request, [
            'item_name' => 'required',
            'item_price' => 'required',
            'selling_item_price' => 'required',
            'quantity' => 'required',
            'description' => 'required',
            'service_provider_id' => 'required',
            'item_image' =>  'mimes:jpeg,bmp,png',
           
           
            
        ]);
		
		
        try{
                 
                 $data = [
                     
                     'item_name'=>$request->item_name,
                     'item_price'=>$request->item_price,
                     'selling_item_price'=>$request->selling_item_price,
                     'quantity'=>$request->quantity,
                     'description'=>$request->description,
                     'service_provider_id'=>$request->service_provider_id,
                     
                     
                     ];
		
            $addItem = SellingItem::where('id',$request->selling_id)->update($data);
            
                      if ($request->item_image != "") {
                // Storage::delete($user->picture);
               
               SellingItem::where('id',$request->selling_id)->update(['item_image'=>$request->item_image->store('user/profile')]);
            }
            
            return response()->json(['status'=>1,'msg'=>'Item Updated successfully']);
          
        }
        catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }

    }
    
     public function itemList(Request $request) {
		
	
		
        $this->validate($request, [
            'service_provider_id' => 'required',
           
          
           ]);
		
		
        try{

		
            $addItem = SellingItem::where('service_provider_id',$request->service_provider_id)->get();
       
            
            return response()->json(['status'=>1,'data'=>$addItem]);
          
        }
        catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }

    }
    
    
     public function liveRequest(Request $request) {
		
        $this->validate($request, [
            'store_user_id' => 'required',
           ]);
		
		
        try{

		
            $data = UserRequests::select('id','status','booking_id','user_id','d_address','d_latitude','d_longitude','service_type_id as store_user_id','created_at as request_date_time')->where('service_type_id',$request->store_user_id)->where('status','ACCEPT')->get();
            if(count($data) != 0){
                
                foreach($data as $k=>$v){
                    
                    //$data[$k]['item_request'] = ItemRequest::where('user_id',$v->user_id)->where('booking_id',$v->booking_id)->where('status',1)->get();
                    $data[$k]['item_request'] = ItemRequest::where('user_id',$v->user_id)->where('status',1)->get();
                    
                    foreach($data[$k]['item_request'] as $b=>$d){
                       
                       $data[$k]['item_request'][$b]['item_details'] =SellingItem::where('id',$d->selling_item_id)->first();
                        
                    }
                }
                    
               return response()->json(['status'=>1,'data'=>$data]); 
                
            }else{
                
                return response()->json(['status'=>0,'data'=>[],'msg'=>'No request Found']);
            }
            
            
          
        }
        catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }

    }
    
    public function cancelItemRequest(Request $request){
        
         $this->validate($request, [
            'booking_id' => 'required',
           
          ]);
          
         $data = UserRequests::where('booking_id',$request->booking_id)->update(['status'=>'CANCELLED']);
         
         RequestFilter::where('booking_id', $request->booking_id)->delete();
                // ProviderService::where('provider_id',$UserRequest->provider_id)->update(['status' => 'active']);
         if($data){
             
             return response()->json(['status'=>1,'msg'=>'successfully cancelled']);
         }
        
    }
    
    
    public function acceptItemRequest(Request $request){
        
            $this->validate($request, [
                'booking_id' => 'required',

            ]);          
           
            $distance = Setting::get('provider_search_radius', '10');
            $UserRequest = UserRequests::select('id','service_type_id as store_id')->where('booking_id',$request->booking_id)->first();
            
            $datt = StoreUser::where('id',$UserRequest->store_id)->first();
            
            $latitude = $datt->latitude;
            $longitude = $datt->longitude;
          
          	$Providers = Provider::select(DB::Raw("(6371 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ) AS distance"),'id')
					->where('status', 'approved')
					->whereRaw("(6371 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ) <= $distance")
					->orderBy('distance')
					->get();
					
			if(count($Providers) == 0) {
           
                return response()->json(['message' => trans('api.ride.no_Drivers_found')]); 
            
            }
          
            $data = UserRequests::where('booking_id',$request->booking_id)->update(['provider_id'=>$Providers[0]->id,'current_provider_id'=>$Providers[0]->id,'s_latitude'=>$latitude,'s_longitude'=>$longitude,'s_address'=>$datt->address,'status'=>'SEARCHING']);      
         
                $Filter = new RequestFilter;
                $Filter->request_id = $UserRequest->id;
                $Filter->provider_id = $Providers[0]->id; 
                $Filter->save();
       
            if($data){
             
                return response()->json([
                        'status'=>1,
                        'msg'=>'successfully ACCEPTED',
                        'request_id' => $UserRequest->id,
                        'current_provider' => $Providers[0]->id
                        ]);
            }
        
    }
	
	
	/**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
	public function orderHistory(Request $request){
		//return Auth::guard('service_type_id')->user()->id;
		
		$service_type_id = $request->service_type_id;
		$orders = UserRequests::select('booking_id', 'status', 'created_at as booking_date', 'user_id', 'provider_id', 'service_type_id', 's_address as user_address')->where('status', 'COMPLETED')
			->where('service_type_id', $service_type_id)
			->with('userSelectedColumn')
			->with('providerSelectedColumn')
			->with('storeUserSelectedColumn')
			->with('sellerItem')
			->orderBy('created_at','desc')->get(); 
			
		return response()->json(['status' => 1, 'data' => $orders]);
	}
	
	/**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
	public function orderTodayHistory(Request $request){
        
		$service_type_id = $request->service_type_id;
		$data['COMPLETED'] = UserRequests::where('status', 'COMPLETED')
			->where('service_type_id', $service_type_id)
			->whereDay('created_at', '=', date('d') )
			->orderBy('created_at','desc')
			->get();
			
		$data['CANCELLED'] = UserRequests::where('status', 'CANCELLED')
			->where('service_type_id', $service_type_id)
			->whereDay('created_at', '=', date('d') )
			->orderBy('created_at','desc')
			->get();
		
		$data['PENDING'] = UserRequests::where('service_type_id', $service_type_id) 
			->whereDay('created_at', '=', date('d') )
			->where('status', '!=', 'ACCEPTED') 
			->where('status', '!=', 'COMPLETED') 
			->orderBy('created_at','desc') 
			->get();
			
		return response()->json(['status' => 1, 'data' => $data]); 
	 
	}


	public function revenue( Request $request ) {
		try {
			
			 $this->validate($request, [
				'store_id' => 'required',
			]);
		
		
			$data['total_received']		=	UserRequests::where('service_type_id', $request->store_id )->get()->count();
			$data['total_deliverd']		=	UserRequests::where('service_type_id', $request->store_id )->where('status', 'COMPLETED')->get()->count();	
			$data['total_cancelled']	=	UserRequests::where('service_type_id', $request->store_id)->where('status', 'CANCELLED')->get()->count();
			$data['total_pending']		=	UserRequests::where('service_type_id', $request->store_id )->whereIn('status', ['INPROCESS','ACCEPTED','STARTED','ARRIVED','PICKEDUP','DROPPED'])->get()->count(); 
			$data['total_revenue']		=	DB::table('user_requests')
											->join('user_request_payments', 'user_requests.id', '=', 'user_request_payments.request_id')
											->where('user_requests.status', 'COMPLETED')
											->where('user_requests.paid', 1 )
											->sum('user_request_payments.total');
											
			
			
			return response()->json(['status' => 1, 'data' => $data ]);
			
		}catch(Exception $e) {
			
			return response()->json(['status' => 0, 'error' => $e->getMessage() ]);
		}

	}
	
	
	/**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function update_profile(Request $request)
    {

			$this->validate($request, [
                'store_id'	=>	'required|numeric',
            ]);
			
			
         try {
		
            $StoreUser = StoreUser::findOrFail( $request->store_id );
			
			if( $request->has('address') ) {
				$StoreUser->address	=	$request->address;
			}
			
            if ( $request->hasFile('image') ) {
                Storage::delete($StoreUser->image);
				$StoreUser->image = $request->image->store('user/profile');
            }
            
            if ( $request->hasFile('banner_image') ) {
                Storage::delete($StoreUser->banner_image);
				$StoreUser->banner_image = $request->banner_image->store('user/profile');
            }
			
			if( $request->has('store_name') ) {
				$StoreUser->store_name	=	$request->store_name;
			}
			
			if( $request->has('latitude') && $request->has('longitude') ) {
				$StoreUser->latitude = $request->latitude;
				$StoreUser->longitude = $request->longitude;	
			}
			
			
			if( $request->has('landmark') ) {
				$StoreUser->landmark = $request->landmark;	
			}
			
			
			// added ```sarwan````
			if( $request->has('open_time') ) {
				$StoreUser->open_time = $request->open_time;	
			}
			
			if( $request->has('close_time') ) {
				$StoreUser->close_time = $request->close_time;	
			}
			
			$StoreUser->save();

            return response()->json(['status'=> 1 ,'msg'=>'You have updated info successfully!']);
			
        }

        catch (ModelNotFoundException $e) {
             return response()->json(['error' => trans('api.user.user_not_found')], 500);
        }

    }
    
    public function item_category(Request $request){
        
        return SubCategory::where('category_name',$request->item_type)->get();
    }
	
	
	/**
     * This function for update business details of store user
     *
     * @return \Illuminate\Http\Response
     */

    public function updateBusinessDetails(Request $request)
    {

			$this->validate($request, [
                'store_id'	=>	'required|numeric',
            ]);
			
			
         try {
		
            $StoreUser = StoreUser::findOrFail( $request->store_id );
			
			if( $request->has('business_store_name') ) {
				$StoreUser->business_store_name	=	$request->business_store_name;
			}
			
            if ( $request->hasFile('address_proof') ) {
                Storage::delete($StoreUser->address_proof);
				$StoreUser->address_proof = $request->address_proof->store('user/profile');
            }
            
            if ( $request->hasFile('signature_proof') ) {
                Storage::delete($StoreUser->signature_proof);
				$StoreUser->signature_proof = $request->signature_proof->store('user/profile');
            }
			
			if( $request->has('business_license_no') ) {
				$StoreUser->business_license_no	=	$request->business_license_no;
			}
			
			$StoreUser->save();

            return response()->json(['status'=> 1 ,'msg'=>'You have updated info successfully!']);
			
        }

        catch (ModelNotFoundException $e) {
             return response()->json(['error' => trans('api.user.user_not_found')], 500);
        }

    }
	
	/**
     * This function for update business details of store user
     *
     * @return \Illuminate\Http\Response
     */

    public function getBusinessDetails(Request $request)
    {

			$this->validate($request, [
                'store_id'	=>	'required|numeric',
            ]);
			
			
         try {
		
            $StoreUser = StoreUser::select('business_store_name', 'address_proof', 'signature_proof', 'business_license_no')->findOrFail( $request->store_id );
			if($StoreUser->count()){
				return response()->json(['status'=> 1 ,'data'=>$StoreUser]);
			}else{
				return response()->json(['status'=> 0 ,'msg'=>'Business details not found']);
			}
            
			
        }

        catch (ModelNotFoundException $e) {
             return response()->json(['error' => trans('api.user.user_not_found')], 500);
        }

    }
    
    
    public function saleSummary(Request $request){
        
        	$this->validate($request, [
                'store_id'	=>	'required|numeric',
            ]);
            
            
            
        // return ItemRequest::where('service_provider_id',$request->store_id)->get();
        
        $sellId = SellingItem::where('service_provider_id',$request->store_id)->pluck('id');
        
        $data = ItemRequest::whereIn('selling_item_id',$sellId)->get();
        
        $todayEarn = $data->where('created_at','>=',Carbon::today())->sum('item_price'); 
        
        $totalEarn = $data->sum('item_price');
        
        return response()->json(['status'=>1,'data'=>$data,'todayEarn'=>"$todayEarn",'totalEarn'=>"$totalEarn"]);
    }
    
     public function payment()
    {
        try {
             $payments = UserRequests::where('paid', 1)
                    ->has('user')
                    ->has('provider')
                    ->has('payment')
                    ->orderBy('user_requests.created_at','desc')
                    ->get();
            
            return view('store.payment.payment-history', compact('payments'));
        } catch (Exception $e) {
             return back()->with('flash_error','Something Went Wrong!');
        }
    }
	public function statement($type = 'individual'){

        try{

            $page = 'Care Statement';

            if($type == 'individual'){
                $page = 'Provider Care Statement';
            }elseif($type == 'today'){
                $page = 'Today Statement - '. date('d M Y');
            }elseif($type == 'monthly'){
                $page = 'This Month Statement - '. date('F');
            }elseif($type == 'yearly'){
                $page = 'This Year Statement - '. date('Y');
            }

            $rides = UserRequests::with('payment')->orderBy('id','desc');
            $cancel_rides = UserRequests::where('status','CANCELLED');
            $revenue = UserRequestPayment::select(\DB::raw(
                           'SUM(ROUND(fixed) + ROUND(distance)) as overall, SUM(ROUND(commision)) as commission' 
                       ));

            if($type == 'today'){

                $rides->where('created_at', '>=', Carbon::today());
                $cancel_rides->where('created_at', '>=', Carbon::today());
                $revenue->where('created_at', '>=', Carbon::today());

            }elseif($type == 'monthly'){

                $rides->where('created_at', '>=', Carbon::now()->month);
                $cancel_rides->where('created_at', '>=', Carbon::now()->month);
                $revenue->where('created_at', '>=', Carbon::now()->month);

            }elseif($type == 'yearly'){

                $rides->where('created_at', '>=', Carbon::now()->year);
                $cancel_rides->where('created_at', '>=', Carbon::now()->year);
                $revenue->where('created_at', '>=', Carbon::now()->year);

            }

            $rides = $rides->get();
            $cancel_rides = $cancel_rides->count();
            $revenue = $revenue->get();

            return view('store.providers.statement', compact('rides','cancel_rides','revenue'))
                    ->with('page',$page);

        } catch (Exception $e) {
            return back()->with('flash_error','Something Went Wrong!');
        }
    }
    public function statement_provider(){

        try{

            $Providers = Provider::all();

            foreach($Providers as $index => $Provider){

                $Rides = UserRequests::where('provider_id',$Provider->id)
                            ->where('status','<>','CANCELLED')
                            ->get()->pluck('id');

                $Providers[$index]->rides_count = $Rides->count();

                $Providers[$index]->payment = UserRequestPayment::whereIn('request_id', $Rides)
                                ->select(\DB::raw(
                                   'SUM(ROUND(fixed) + ROUND(distance)) as overall, SUM(ROUND(commision)) as commission' 
                                ))->get();
            }

            return view('store.providers.provider-statement', compact('Providers'))->with('page','Providers Statement');

        } catch (Exception $e) {
            return back()->with('flash_error','Something Went Wrong!');
        }
    }
    public function statement_today(){
        
        return $this->statement('today');
    }

    /**
     * account statements monthly.
     *
     * @param  \App\Provider  $provider
     * @return \Illuminate\Http\Response
     */
    public function statement_monthly(){
        return $this->statement('monthly');
    }

     /**
     * account statements monthly.
     *
     * @param  \App\Provider  $provider
     * @return \Illuminate\Http\Response
     */
    public function statement_yearly(){
        return $this->statement('yearly');
    }
    
    public function request()
    {
        try {
            $requests = UserRequests::RequestHistory()->get();
            
            
            return view('store.request.index', compact('requests'));
        } catch (Exception $e) {
            return back()->with('flash_error','Something Went Wrong!');
        }
    }
    public function show($id)
    {
        try {
            $request = UserRequests::findOrFail($id);
            return view('store.request.show', compact('request'));
        } catch (Exception $e) {
             return back()->with('flash_error','Something Went Wrong!');
        }
    }
    public function destroy($id)
    {

        if(Setting::get('demo_mode', 0) == 1) {
            return back()->with('flash_error', 'Disabled for demo purposes! Please contact us at info@appoets.com');
        }
        
        try {
            $Request = UserRequests::findOrFail($id);
            $Request->delete();
            return back()->with('flash_success','Request Deleted!');
        } catch (Exception $e) {
            return back()->with('flash_error','Something Went Wrong!');
        }
    }
    public function selling(Request $request)
    {

        $services = SellingItem::select('selling_items.*','store_users.name as name')->join('store_users', 'selling_items.service_provider_id', '=', 'store_users.id')->get();
        if($request->ajax()) {
            return $services;
        } else {
            return view('store.selling.index', compact('services'));
        }
    }
    public function create()
    {
        return view('store.selling.create');
    }
    public function selling_destroy($id)
    {
        if(Setting::get('demo_mode', 0) == 1) {
            return back()->with('flash_error','Disabled for demo purposes! Please contact us at info@appoets.com');
        }
        
        try {
            $Request = SellingItem::findOrFail($id);
            $Request->delete();
            return back()->with('message', 'Service Type deleted successfully');
        } catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Service Type Not Found');
        } catch (Exception $e) {
            return back()->with('flash_error', 'Service Type Not Found');
        }
    }
    public function selling_edit($id)
    {
        // DB::connection()->enableQueryLog();
        //    $service = SellingItem::find($id);
        //    $queries = DB::getQueryLog();
           // dd($queries);
        try {
            $service = SellingItem::findOrFail($id);
            return view('store.selling.edit',compact('service'));
        } catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Service Type Not Found');
        }
    }
     public function selling_update(Request $request, $id)
    {
        if(Setting::get('demo_mode', 0) == 1) {
            return back()->with('flash_error','Disabled for demo purposes! Please contact us at info@appoets.com');
        }

        $this->validate($request, [
            'item_name' => 'required|max:255',
         //   'provider_name' => 'required|max:255',
           
            'image' => 'mimes:ico,png,jpg,jpeg'
            
        ]);

        try {

            $service = SellingItem::findOrFail($id);

            if($request->hasFile('image')) {
                if($service->image) {
                    Helper::delete_picture($service->image);
                }
                $service->item_image = Helper::upload_picture($request->image);
            }

            $service->item_name = $request->item_name;
            
            $service->save();

            return redirect()->route('store.selling.index')->with('flash_success', 'Service Type Updated Successfully');    
        } 

        catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Service Type Not Found');
        }
    }
    public function selling_store(Request $request)
    {

     $this->validate($request, [
            'item_name' => 'required|max:255',
            'item_price' => 'required',  
             'quantity' => 'required',         
            'image' => 'mimes:ico,png,jpg,jpeg'
        ]);

        try {
            $service = $request->all();

            if($request->hasFile('image')) {
                $image = Helper::upload_picture($request->image);
            }

           $data = [
                 "item_name"=>$request->item_name,
                 "item_price"=>$request->item_price,
                 "service_provider_id"=>Session::get('storesession')->id,
                 "quantity"=>$request->quantity,
                 "item_image"=>$image,
                       ];

             SellingItem::create($data);

            return back()->with('flash_success','Service Type Saved Successfully');
        } catch (Exception $e) {
            dd("Exception", $e);
            return back()->with('flash_error', 'Service Type Not Found');
        }
    }
    public function getSubCategories(Request $request){
    // DB::connection()->enableQueryLog();
    $data = ServiceType::where('provider_name',$request->provider_name)->get();
    // $queries = DB::getQueryLog();
    // dd($data);
     return $data;
    
    }

    public function getSubCategoriesTwo(Request $request){

    return ServiceType::where('provider_name',$request->provider_name)->get();

    }

    public function logout()
    {
        Session::flush();
        Auth::logout();
        return redirect('store/login');
    }
}

