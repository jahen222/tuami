<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
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
use App\UserLocationType;
use App\SubCategory;
use App\Http\Controllers\ProviderResources\TripController;


class UserApiController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function signup(Request $request)
    {   
        /*$v = Validator::make($request->all(), [
            'title' => 'required|unique|max:255',
            'body' => 'required',
        ]);

        if ($v->fails())
        {
            dd($v->errors());
        }

     
        $this->validate($request, [
            'social_unique_id' => ['required_if:login_by,facebook,google','unique:users'],
            'device_type' => 'required|in:android,ios',
            'device_token' => 'required',
            'device_id' => 'required',
            'login_by' => 'required|in:manual,facebook,google',
            'first_name' => 'required|max:255',
            'last_name' => 'required|max:255',
            //'email' => 'required|email|max:255|unique:users',
            'mobile' => 'required|unique:users',
            'password' => 'required|min:6',
        ]);*/
        
        try{			
            $User = $request->all();
            $User['payment_mode'] = 'CARD';
            //$User['latitude'] = $request->latitude;
            //$User['longitude'] = $request->longitude;
            $User['password'] = bcrypt($request->password);
            $User = User::create($User);

            return $User;
        } catch (Exception $e) {
            return response()->json(['error' => 'Something went wrong.'], 500);
        }
    }   
	
	function login( Request $request ){
		
	    $this->validate($request, [
           
            'device_type' => 'required|in:android,ios',
            'device_token' => 'required',
            'device_id' => 'required',
            //'login_by' => 'required|in:manual,facebook,google',
            'mobile' => 'required',
            'password' => 'required',
        ]);
	
		$User = User::where('mobile', $request->mobile)->first();
	
		if(  ! $User ) {
			return response()->json(['error'=>'Unauthorised'], 401); 
		}
			
		
        if( Auth::attempt(['email' => $User->email, 'password' => $request->password])){ 
            
			$user = Auth::user(); 

			//$http = new GuzzleHttp\Client;
		
			/*  $response = $http->post(url('/oauth/token'), [
				'form_params' => [
					'grant_type' => 'password',
					'client_secret' => 'WifS1rMi3LvuorP1G2UdtKZairUNSH2iMqrKivPf',
					'username' => $user->email,
					'password' => $request->password,
					'scope' => '',
				],
			]);
			
			return response()->json(['success' => $response ]); 
            */
			 
			$request->request->add(['username' => $user->email]);
        
		
			return $proxy = Request::create('oauth/token', 'POST');
			 
		} else{ 
            
			return response()->json(['error'=>'Unauthorised'], 401); 
        
		} 
    }
	

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function logout(Request $request)
    {
        try {
            User::where('id', $request->id)->update(['device_id'=> '', 'device_token' => '']);
            return response()->json(['message' => trans('api.logout_success')]);
        } catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }
    }


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function change_password(Request $request) {

        $this->validate($request, [
                'password' => 'required|confirmed|min:6',
                'old_password' => 'required',
            ]);

        $User = Auth::user();

        if(Hash::check($request->old_password, $User->password))
        {
            $User->password = bcrypt($request->password);
            $User->save();

            if($request->ajax()) {
                return response()->json(['message' => trans('api.user.password_updated')]);
            }else{
                return back()->with('flash_success', 'Password Updated');
            }

        } else {
            return response()->json(['error' => trans('api.user.incorrect_password')], 500);
        }

    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function update_location(Request $request){

        $this->validate($request, [
                'latitude' => 'required|numeric',
                'longitude' => 'required|numeric',
            ]);

        if($user = User::find(Auth::user()->id)){

            $user->latitude = $request->latitude;
            $user->longitude = $request->longitude;
            $user->save();

            return response()->json(['message' => trans('api.user.location_updated')]);

        }else{

            return response()->json(['error' => trans('api.user.user_not_found')], 500);

        }

    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function details(Request $request) {
		
		
		
        $this->validate($request, [
            'device_type' => 'in:android,ios',
        ]);
		
		
        try{

		
            if($user = User::find(Auth::user()->id)){

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

                 $avgRating_user = UserRequestRating::groupBy('provider_rating')->select('provider_rating', DB::raw('count(provider_rating) as total'))->where('user_id',Auth::user()->id)->get();  //provider Rating

                if(count($avgRating_user) !=0){
                    $avgsumUser = [];
                    $avgUser = [];
                    foreach ($avgRating_user as $rk => $rv) {

                    $avgsumUser[] =$rv->provider_rating*$rv->total;
                    $avgUser[] = $rv->total;
                }

                    $avgRating_user = round(array_sum($avgsumUser)/array_sum($avgUser),1);
                }
                else{
                    $avgRating_user = 0;   
                }

                $user->currency = Setting::get('currency');
                $user->sos = Setting::get('sos_number', '911');
                $user->avgRatingUserbyProvider = $avgRating_user;
                $user['location'] = UserLocationType::where('user_id',Auth::user()->id)->get();
                return $user;

            } else {
                return response()->json(['error' => trans('api.user.user_not_found')], 500);
            }
        }
        catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
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
                'first_name' => 'required|max:255',
                'last_name' => 'max:255',
               // 'email' => 'email|unique:users,email,'.Auth::user()->id,
                'mobile' => 'required',
                'picture' => 'mimes:jpeg,bmp,png',
            ]);

         try {

            $user = User::findOrFail(Auth::user()->id);

            if($request->has('first_name')){ 
                $user->first_name = $request->first_name;
            }
            
            if($request->has('last_name')){
                $user->last_name = $request->last_name;
            }
            
            if($request->has('email')){
                $user->email = $request->email;
            }
        
            if($request->has('mobile')){
                $user->mobile = $request->mobile;
            }


           if($request->has('family_name')){
                $user->family_name = $request->family_name;
            }


           if($request->has('relative_name')){
                $user->relative_name = $request->relative_name;
            }

            if($request->has('self_name')){
                $user->self_name = $request->self_name;
            }

           if($request->has('self_contact_number')){
                $user->self_contact_number = $request->self_contact_number;
            }

          if($request->has('family_address')){
                $user->family_address = $request->family_address;
            }
            if($request->has('self_address')){
                $user->self_address = $request->self_address;
            }


            if($request->has('relative_address')){
                $user->relative_address = $request->relative_address;
            }
          
            if($request->has('family_contact_number')){
                $user->family_contact_number = $request->family_contact_number;
            }
        
            if($request->has('relative_contact_number')){
                $user->relative_contact_number = $request->relative_contact_number;
            }


            if ($request->picture != "") {
                Storage::delete($user->picture);
                $user->picture = $request->picture->store('user/profile');
            }

            $user->save();

            if($request->ajax()) {
                return response()->json($user);
            }else{
                return back()->with('flash_success', trans('api.user.profile_updated'));
            }
        }

        catch (ModelNotFoundException $e) {
             return response()->json(['error' => trans('api.user.user_not_found')], 500);
        }

    }
	
	/**
     * Update store user.
     *
     * @return \Illuminate\Http\Response
     */

    public function updateStoreUser(Request $request)
    {

         try {

            $user = StoreUser::findOrFail(Auth::user()->id);

            if($request->has('address')){ 
                $user->address = $request->address;
            }
            
            if($request->has('open_time')){
                $user->open_time = $request->open_time;
            }
            
            if($request->has('close_time')){
                $user->close_time = $request->close_time;
            }
        
            if($request->has('mobile')){
                $user->mobile = $request->mobile;
            }

            if ($request->image != "") {
                Storage::delete($user->image);
                $user->image = $request->image->store('user/profile');
            }
			
			if ($request->banner_image != "") {
                Storage::delete($user->banner_image);
                $user->banner_image = $request->banner_image->store('user/profile');
            }

            $user->save();

            if($request->ajax()) {
                return response()->json($user);
            }else{
                return back()->with('flash_success', trans('api.user.profile_updated'));
            }
        }

        catch (ModelNotFoundException $e) {
             return response()->json(['error' => trans('api.user.user_not_found')], 500);
        }

    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function services(Request $request) {

         $this->validate($request, [
                'latitude' => 'required|numeric',
                'longitude' => 'required|numeric',
               
            ]);

      if($request->has('latitude')){
          
          User::where('id',Auth::user()->id)->update(['latitude'=>$request->latitude,'longitude'=>$request->longitude]);
      }

        if(ServiceType::all()) {
            $data = ServiceType::select('id','provider_name','provider_image')->groupBy('provider_name')->get();
          
            return response()->json(['status'=>1,'data' => $data]);

        } else {
            return response()->json(['error' => trans('api.services_not_found')], 500);
        }

    }


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function send_request(Request $request) {

        $this->validate($request, [
                's_latitude' => 'required|numeric',
                'd_latitude' => 'required|numeric',
                's_longitude' => 'required|numeric',
                'd_longitude' => 'required|numeric',
                'service_type' => 'required|numeric|exists:service_types,id',
                'promo_code' => 'exists:promocodes,promo_code',
                'distance' => 'required|numeric',
                'use_wallet' => 'numeric',
                'payment_mode' => 'required|in:CASH,CARD,PAYPAL',
               # 'card_id' => ['required_if:payment_mode,CARD','exists:cards,card_id,user_id,'.Auth::user()->id],
                'insurance_id' => 'integer',
                'selling_item_id' => 'required',
                'total_item' => 'numeric',
                
               # 'schedule_end_date_time' => 'required'
            ]);

        Log::info('New Request from User: '.Auth::user()->id);
        Log::info('Request Details:', $request->all());

        $ActiveRequests = UserRequests::PendingRequest(Auth::user()->id)->count();

        if($ActiveRequests > 0) {
            if($request->ajax()) {
                return response()->json(['error' => trans('api.ride.request_inprogress')], 500);
            } else {
                return redirect('dashboard')->with('flash_error', 'Already request is in progress. Try again later');
            }
        }

        if($request->has('schedule_date') && $request->has('schedule_time')){
            $beforeschedule_time = (new Carbon("$request->schedule_date $request->schedule_time"))->subHour(1);
            $afterschedule_time = (new Carbon("$request->schedule_date $request->schedule_time"))->addHour(1);

            $CheckScheduling = UserRequests::where('status','SCHEDULED')
                            ->where('user_id', Auth::user()->id)
                            ->whereBetween('schedule_at',[$beforeschedule_time,$afterschedule_time])
                            ->count();


            if($CheckScheduling > 0){
                if($request->ajax()) {
                    return response()->json(['error' => trans('api.ride.request_scheduled')], 500);
                }else{
                    return redirect('dashboard')->with('flash_error', 'Already request is Scheduled on this time.');
                }
            }

        }

        $distance = Setting::get('provider_search_radius', '10');
        $latitude = $request->s_latitude;
        $longitude = $request->s_longitude;
        $service_type = $request->service_type;

		if( $request->has('provider_id') &&  $request->provider_id > 0 ) {
		
			$Providers = Provider::where('id',$request->provider_id)->get();			
			
		} else {

			$Providers = Provider::with('service')
        					->select(DB::Raw("(6371 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ) AS distance"),'id')
        					->where('status', 'approved')
        					->whereRaw("(6371 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ) <= $distance")
        					->whereHas('service', function($query) use ($service_type){
        								$query->where('status','active');
        								$query->where('service_type_id',$service_type);
        							})
        					->orderBy('distance')
        					->get();
					
			
		}

        // List Providers who are currently busy and add them to the filter list.

        if(count($Providers) == 0) {
            if($request->ajax()) {
                // Push Notification to User
                return response()->json(['message' => trans('api.ride.no_Drivers_found')]); 
            }else{
                return back()->with('flash_success', 'No Providers Found! Please try again.');
            }
        }

        try{

            $details = "https://maps.googleapis.com/maps/api/directions/json?origin=".$request->s_latitude.",".$request->s_longitude."&destination=".$request->d_latitude.",".$request->d_longitude."&mode=driving&key=".env('GOOGLE_MAP_KEY');

            $json = curl($details);

            $details = json_decode($json, TRUE);

            $route_key = $details['routes'][0]['overview_polyline']['points'];

            $UserRequest = new UserRequests;
            $UserRequest->booking_id = Helper::generate_booking_id();
            $UserRequest->user_id = Auth::user()->id;
            $UserRequest->provider_id = $Providers[0]->id;
            $UserRequest->current_provider_id = $Providers[0]->id;
            $UserRequest->service_type_id = $request->service_type;
            $UserRequest->payment_mode = $request->payment_mode;
            $UserRequest->selling_item_id = $request->selling_item_id;
            $UserRequest->total_item = $request->total_item;
            $UserRequest->status = 'SEARCHING';
            $UserRequest->total_time = $request->total_time;
            
            $UserRequest->courier_id = $request->courier_id ? : "";

            $UserRequest->s_address = $request->s_address ? : "";
            $UserRequest->d_address = $request->d_address ? : "";

            $UserRequest->s_latitude = $request->s_latitude;
            $UserRequest->s_longitude = $request->s_longitude;

            $UserRequest->d_latitude = $request->d_latitude;
            $UserRequest->d_longitude = $request->d_longitude;
            $UserRequest->distance = $request->distance;

            if(Auth::user()->wallet_balance > 0){
                $UserRequest->use_wallet = $request->use_wallet ? : 0;
            }

            if(isset($request->insurance_id)) {
                $UserRequest->insurance_id = $request->insurance_id ? $request->insurance_id : 0;
            }

            $UserRequest->assigned_at = Carbon::now();
            $UserRequest->route_key = $route_key;

            if($Providers->count() <= Setting::get('surge_trigger') && $Providers->count() > 0){
                $UserRequest->surge = 1;
            }

            if($request->has('schedule_date') && $request->has('schedule_time')){
                $UserRequest->schedule_at = date("Y-m-d H:i:s",strtotime("$request->schedule_date $request->schedule_time"));
            }

            $UserRequest->save();
            ItemRequest::where('user_id',Auth::user()->id)->where('request_status',0)->update(['booking_id'=>$UserRequest->booking_id,'request_status'=>1]);
            Log::info('New Request id : '. $UserRequest->id .' Assigned to provider : '. $UserRequest->current_provider_id);


            // update payment mode 

            User::where('id',Auth::user()->id)->update(['payment_mode' => $request->payment_mode]);

            if($request->has('card_id')){

                Card::where('user_id',Auth::user()->id)->update(['is_default' => 0]);
                Card::where('card_id',$request->card_id)->update(['is_default' => 1]);
            }

            #(new SendPushNotification)->IncomingRequest($Providers[0]->id);  //1

            foreach ($Providers as $key => $Provider) {

                $Filter = new RequestFilter;
                $Filter->request_id = $UserRequest->id;
                $Filter->provider_id = $Provider->id; 
                $Filter->save();
            }

            if($request->ajax()) {
                return response()->json([
                        'message' => 'New request Created!',
                        'request_id' => $UserRequest->id,
                        'current_provider' => $UserRequest->current_provider_id,
                    ]);
            }else{
                return redirect('dashboard');
            }

        } catch (Exception $e) {
            if($request->ajax()) {
                return response()->json(['error' => trans('api.something_went_wrong')], 500);
            }else{
                return back()->with('flash_error', 'Something went wrong while sending request. Please try again.');
            }
        }
    }


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function cancel_request(Request $request) {

        $this->validate($request, [
            'request_id' => 'required|numeric|exists:user_requests,id,user_id,'.Auth::user()->id,
        ]);

        try{

            $UserRequest = UserRequests::findOrFail($request->request_id);

            if($UserRequest->status == 'CANCELLED')
            {
                if($request->ajax()) {
                    return response()->json(['error' => trans('api.ride.already_cancelled')], 500); 
                }else{
                    return back()->with('flash_error', 'Request is Already Cancelled!');
                }
            }

            if(in_array($UserRequest->status, ['SEARCHING','AWAITING','STARTED','ARRIVED','SCHEDULED'])) {

                if($UserRequest->status != 'SEARCHING'){
                    $this->validate($request, [
                        'cancel_reason'=> 'max:255',
                    ]);
                }

                $UserRequest->status = 'CANCELLED';
                $UserRequest->cancel_reason = $request->cancel_reason;
                $UserRequest->cancelled_by = 'USER';
                $UserRequest->save();

                RequestFilter::where('request_id', $UserRequest->id)->delete();
                ProviderService::where('provider_id',$UserRequest->provider_id)->update(['status' => 'active']);

               /* if($UserRequest->status != 'SCHEDULED'){

                    if($UserRequest->provider_id != 0){

                        ProviderService::where('provider_id',$UserRequest->provider_id)->update(['status' => 'active']);

                    }
                } */

                 // Send Push Notification to User
                (new SendPushNotification)->UserCancellRide($UserRequest);

                if($request->ajax()) {
                    return response()->json(['message' => trans('api.ride.ride_cancelled')]); 
                }else{
                    return redirect('dashboard')->with('flash_success','Request Cancelled Successfully');
                }

            } else {
                if($request->ajax()) {
                    return response()->json(['error' => trans('api.ride.already_onride')], 500); 
                }else{
                    return back()->with('flash_error', 'Service Already Started!');
                }
            }
        }

        catch (ModelNotFoundException $e) {
            if($request->ajax()) {
                return response()->json(['error' => trans('api.something_went_wrong')]);
            }else{
                return back()->with('flash_error', 'No Request Found!');
            }
        }

    }

    /**
     * Show the request status check.
     *
     * @return \Illuminate\Http\Response
     */

     public function getInvoice($requestId){
        
        $invoice = [];      

        $tax_percentage = Setting::get('tax_percentage');
        $commission_percentage = Setting::get('commission_percentage');
        //$UserRequest = UserRequests::where('id',$requestId)->first();
        $UserRequest = UserRequests::where('id',$requestId)->orderBy('created_at','desc')->first();
        $provider = Provider::where('id',$UserRequest->provider_id)->first();
        $insurance = Insurances::where('insurance_id',$UserRequest->insurance_id)->first();
        $settings = Settings::where('key','tax_percentage')->first();
        $ServiceTyp = ServiceType::where('id',$provider->major_service_type_id)->first();

        $lat1 = $UserRequest->s_latitude;
        $lat2 = $UserRequest->d_latitude;
        $lon1 = $UserRequest->s_longitude;
        $lon2 = $UserRequest->d_longitude;
        $unit = "K";

        if (($lat1 == $lat2) && ($lon1 == $lon2)) {
            return 0;
          }
          else {
            $theta = $lon1 - $lon2;
            $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
            $dist = acos($dist);
            $dist = rad2deg($dist);
            $miles = $dist * 60 * 1.1515;
            $unit = strtoupper($unit);

            if ($unit == "K") {
                $kilometer =  ($miles * 1.609344);
            } else if ($unit == "N") {
                $kilometer =  ($miles * 0.8684);
            } else {
                $kilometer =  $miles;
            }
          }          
          $rountkilo = round($kilometer,0);

            $fare_price = Settings::where('key','fare_price')->first();
            $driver_base_price = Settings::where('key','driver_base_price')->first();

        if($UserRequest->insurance_id != 0){
            $insurance = Insurances::where('insurance_id',$UserRequest->insurance_id)->first();
            $insurance_price = $insurance->price;
        }   else{ $insurance_price = 0;}

        //$totalPrice = ItemRequest::where('booking_id',$UserRequest->booking_id)->sum('item_price');

        $totalPrice = ItemRequest::where('booking_id',$UserRequest->booking_id)->sum('item_price');   
        
        $deliveryprice = ($fare_price['value']*$rountkilo)+$driver_base_price['value'];

        //$totalbaseprice = ($driver_base_price*$kilometer); 

        $total = ($deliveryprice+$totalPrice); 
        
        $total_amount = ($total) ;
        $tax = ($tax_percentage/100) * $total;
        //$tax_price = ( $tax_percentage/100 ) * $price;

        $total_price = $total_amount + $tax;    

        $checkd = UserRequestPayment::where('request_id',$UserRequest->id)->count();
        if($checkd == 0){

            $Payment = new UserRequestPayment;
            $Payment->request_id = $UserRequest->id;
            $Payment->user_service_hour = $UserRequest->service_hour;
            $Payment->per_price = $totalPrice;
            $Payment->provider_base_amount = $driver_base_price['value'];
            $Payment->request_id = $UserRequest->id;
            $Payment->delivery = $deliveryprice;
            $Payment->fixed = $total; 
            $Payment->insurance = $insurance_price;
            $Payment->tax = $tax;
            $Payment->total = $total_price;
            $Payment->save();

        }
        else{ $Payment =  UserRequestPayment::where('request_id',$UserRequest->id)->first(); }      
      
            return $Payment;

        }

    public function generate_invoice($booking_id)
    
	{
        try {
            $UserRequest = UserRequests::where('booking_id',$booking_id)->first();
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
            $price = $service_type->fixed;
            $Distance = 0;
            $gettotal_time = explode(":", $UserRequest->total_time);
            $minutes = $gettotal_time[0];
            $Discount = 0; // Promo Code discounts should be added here.
            $Wallet = 0;
            $Surge = 0;

            
             if(count($UserRequest)!="")
             {
                if($UserRequest->started_at === null){
                    $UserRequest->started_at  = Carbon::now();
                }

             $startDate = Carbon::createFromFormat('Y-m-d H:i:s', $UserRequest->started_at);
             if(isset($r[0]->finished_at)){

             $endDate = Carbon::createFromFormat('Y-m-d H:i:s', $UserRequest->finished_at);

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
              #  $Payment->total = abs($Total);
            }
            $Payment->tax = $Tax;
            $Payment->total = abs($price);
            $Payment->save();
            $Payment['bill'] = ["total_amount"=>abs($price),"total_worked_minute"=>$hours.' hours '.$minutes.' minutes',"base_amount"=>$service_type->fixed,"work_per_minute_amount"=>$service_type->minute];
            ($UserRequest->signature!=null)?
            $Payment['content'] = ["prescription"=>$UserRequest->prescrition,"signature"=>url('storage/app/public').'/'.$UserRequest->signature]: $Payment['content'] = ["prescription"=>$UserRequest->prescrition,"signature"=>$UserRequest->signature];
            
            return $Payment;
            // return response()->json(['data'=>$Payment]);

        } catch (ModelNotFoundException $e) {
            return false;
        }
    }     //Invoice

    public function request_status_check() {

        try{
			
           $check_status = ['CANCELLED', 'SCHEDULED'];

            $UserRequests = UserRequests::UserRequestStatusCheck(Auth::user()->id, $check_status)->orderBy('id','desc')->take(1)->get();
			
			
            $search_status = ['SEARCHING','SCHEDULED','INPROCESS'];
			
			$UserRequestsFilter = UserRequests::UserRequestAssignProvider(Auth::user()->id,$search_status)->get(); 

            // Log::info($UserRequestsFilter);

            $Timeout = Setting::get('provider_select_timeout', 180);
            
            $service_type = 0;
            
            if(count($UserRequests) !=0){
                
                $UserRequests[0]['store_type'] = StoreUser::where('id',$UserRequests[0]->service_type_id)->first();
                
                 $itemList = ItemRequest::where('user_id',$UserRequests[0]->user_id)->where('status',1)->get();
                
                foreach($itemList as $k=>$v){
                    
                  $itemList[$k]['itemName'] = SellingItem::where('id',$v->selling_item_id)->first();
                }
                
                $UserRequests[0]['store_type']['item_details'] = $itemList;
            }

            if(!empty($UserRequestsFilter)){
                for ($i=0; $i < sizeof($UserRequestsFilter); $i++) {
                    
                    $ExpiredTime = $Timeout - (time() - strtotime($UserRequestsFilter[$i]->assigned_at));
                    if($UserRequestsFilter[$i]->status == 'SEARCHING' && $ExpiredTime < 0) {
                        $Providertrip = new TripController();
                        $Providertrip->assign_next_provider($UserRequestsFilter[$i]->id);
                    }else if($UserRequestsFilter[$i]->status == 'SEARCHING' && $ExpiredTime > 0){
                        break;
                    }
                }
                
            
                
                // $service_type = ServiceType::findOrFail($UserRequests[0]->service_type_id);
                
                // $itemList = ItemRequest::where('user_id',$UserRequests[0]->user_id)->where('status',1)->get();
                
               
                
                // foreach($itemList as $k=>$v){
                    
                //   $itemList[$k]['itemName'] = SellingItem::where('id',$v->selling_item_id)->first();
                // }
                
                // $service_type->itemList = $itemList;
            }
            
            // foreach ($UserRequests as $key => $value) {
            //   $UserRequests[0]['provider_service']["gov_id"] = $value->provider_service->service_number;
            //   $UserRequests[0]['provider_service']["certificate_no"] = $value->provider_service->service_model;
             
            // }
			
       //    if(count($UserRequests)!=0){
             //  if($UserRequests[0]->status == 'STOPPED' || $UserRequests[0]->status == 'DROPPED'){
           //  $this->getInvoice($UserRequests[0]->id);  
          //  }
       //    }
           
            return response()->json(['data' => $UserRequests]);
            // return response()->json(['data' => $UserRequests,'itemDetails'=>$service_type]);

        } catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */


    public function rate_provider(Request $request) {

        $this->validate($request, [
                'request_id' => 'required|integer|exists:user_requests,id,user_id,'.Auth::user()->id,
                'rating' => 'required|integer|in:1,2,3,4,5',
                'comment' => 'max:255',
            ]);
    
        $UserRequests = UserRequests::where('id' ,$request->request_id)
                ->where('status' ,'COMPLETED')
                ->where('paid', 0)
                ->first();

        if ($UserRequests) {
            if($request->ajax()){
                return response()->json(['error' => trans('api.user.not_paid')], 500);
            } else {
                return back()->with('flash_error', 'Service Already Started!');
            }
        }

        try{

            $UserRequest = UserRequests::findOrFail($request->request_id);
            
            if($UserRequest->rating == null) {
                UserRequestRating::create([
                        'provider_id' => $UserRequest->provider_id,
                        'user_id' => $UserRequest->user_id,
                        'request_id' => $UserRequest->id,
                        'user_rating' => $request->rating,
                        'user_comment' => $request->comment,
                    ]);
            } else {
                $UserRequest->rating->update([
                        'user_rating' => $request->rating,
                        'user_comment' => $request->comment,
                    ]);
            }

            $UserRequest->user_rated = 1;
            $UserRequest->save();

            $average = UserRequestRating::where('provider_id', $UserRequest->provider_id)->avg('user_rating');

            Provider::where('id',$UserRequest->provider_id)->update(['rating' => $average]);

            // Send Push Notification to Provider 
            if($request->ajax()){
                return response()->json(['message' => trans('api.ride.provider_rated')]); 
            }else{
                return redirect('dashboard')->with('flash_success', 'Driver Rated Successfully!');
            }
        } catch (Exception $e) {
            if($request->ajax()){
                return response()->json(['error' => trans('api.something_went_wrong')], 500);
            }else{
                return back()->with('flash_error', 'Something went wrong');
            }
        }

    } 


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function trips() {  
    
        try{
            $UserRequests = UserRequests::UserTrips(Auth::user()->id)->get();
            if(!empty($UserRequests)){
                $map_icon = asset('asset/img/marker-start.png');
                foreach ($UserRequests as $key => $value) {
                    $UserRequests[$key]->static_map = "https://maps.googleapis.com/maps/api/staticmap?".
                            "autoscale=1".
                            "&size=320x130".
                            "&maptype=terrian".
                            "&format=png".
                            "&visual_refresh=true".
                            "&markers=icon:".$map_icon."%7C".$value->s_latitude.",".$value->s_longitude.
                           // "&markers=icon:".$map_icon."%7C".$value->d_latitude.",".$value->d_longitude.
                            "&path=color:0x191919|weight:3|enc:".$value->route_key.
                            "&key=".env('GOOGLE_MAP_KEY');
                }
            }
            return $UserRequests;
        }

        catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')]);
        }
    }


    public function Currenttrips() { 
        try{

            $check_status = ['CANCELLED', 'SCHEDULED','COMPLETED'];

            $UserRequests = UserRequests::CurrentUserTrips(Auth::user()->id, $check_status)->get();
            //$totalPrice = ItemRequest::where('user_id',$UserRequests->booking_id)->sum('item_price');
            if(!empty($UserRequests)){
                $map_icon = asset('asset/img/marker-start.png');
                foreach ($UserRequests as $key => $value) {
                    //dd($value->d_latitude);
                    $UserRequests[$key]->static_map = "https://maps.googleapis.com/maps/api/staticmap?".
                        "autoscale=1".
                        "&size=320x130".
                        "&maptype=terrian".
                        "&format=png".
                        "&visual_refresh=true".
                        "&markers=icon:".$map_icon."%7C".$value->d_latitude.",".$value->d_longitude.
                       // "&markers=icon:".$map_icon."%7C".$value->d_latitude.",".$value->d_longitude.
                        "&path=color:0x191919|weight:3|enc:".$value->route_key.
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
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function estimated_fare(Request $request){
        \Log::info('Estimate', $request->all());
        $this->validate($request,[
                's_latitude' => 'required|numeric',
                's_longitude' => 'required|numeric',
                'd_latitude' => 'required|numeric',
                'd_longitude' => 'required|numeric',
                'service_type' => 'required|numeric|exists:service_types,id',
            ]);

        try{

            $details = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=".$request->s_latitude.",".$request->s_longitude."&destinations=".$request->d_latitude.",".$request->d_longitude."&mode=driving&sensor=false&key=".env('GOOGLE_MAP_KEY');

            $json = curl($details);

            $details = json_decode($json, TRUE);

            $meter = $details['rows'][0]['elements'][0]['distance']['value'];
            $time = $details['rows'][0]['elements'][0]['duration']['text'];
            $seconds = $details['rows'][0]['elements'][0]['duration']['value'];

            $kilometer = round($meter/1000);
            $minutes = round($seconds/60);

            $tax_percentage = Setting::get('tax_percentage');
            $commission_percentage = Setting::get('commission_percentage');
            $service_type = ServiceType::findOrFail($request->service_type);
            
            $price = $service_type->fixed;

            if($service_type->calculator == 'MIN') {
                $price += $service_type->minute * $minutes;
            } else if($service_type->calculator == 'HOUR') {
                $price += $service_type->minute * 60;
            } else if($service_type->calculator == 'DISTANCE') {
                $price += ($kilometer * $service_type->price);
            } else if($service_type->calculator == 'DISTANCEMIN') {
                $price += ($kilometer * $service_type->price) + ($service_type->minute * $minutes);
            } else if($service_type->calculator == 'DISTANCEHOUR') {
                $price += ($kilometer * $service_type->price) + ($service_type->minute * $minutes * 60);
            } else {
                $price += ($kilometer * $service_type->price);
            }

            $tax_price = ( $tax_percentage/100 ) * $price;
            $total = $price + $tax_price;

            $ActiveProviders = ProviderService::AvailableServiceProvider($request->service_type)->get()->pluck('provider_id');

            $distance = Setting::get('provider_search_radius', '10');
            $latitude = $request->s_latitude;
            $longitude = $request->s_longitude;

            $Providers = Provider::whereIn('id', $ActiveProviders)
                ->where('status', 'approved')
                ->whereRaw("(1.609344 * 3956 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ) <= $distance")
                ->get();

            $surge = 0;
            
            if($Providers->count() <= Setting::get('surge_trigger') && $Providers->count() > 0){
                $surge_price = (Setting::get('surge_percentage')/100) * $total;
                $total += $surge_price;
                $surge = 1;
            }

            return response()->json([
                    'estimated_fare' => round($total,2), 
                    'distance' => $kilometer,
                    'time' => $time,
                    'surge' => $surge,
                    'surge_value' => '1.4X',
                    'tax_price' => $tax_price,
                    'base_price' => $service_type->fixed,
                    'wallet_balance' => Auth::user()->wallet_balance
                ]);

        } catch(Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function trip_details(Request $request) {

         $this->validate($request, [
                'request_id' => 'required|integer|exists:user_requests,id',
            ]);
    
        try{
            $UserRequests = UserRequests::UserTripDetails(Auth::user()->id,$request->request_id)->get();
            if(!empty($UserRequests)){
                $map_icon = asset('asset/img/marker-start.png');
                foreach ($UserRequests as $key => $value) {
                    $UserRequests[$key]->static_map = "https://maps.googleapis.com/maps/api/staticmap?".
                            "autoscale=1".
                            "&size=320x130".
                            "&maptype=terrian".
                            "&format=png".
                            "&visual_refresh=true".
                            "&markers=icon:".$map_icon."%7C".$value->s_latitude.",".$value->s_longitude.
                          //  "&markers=icon:".$map_icon."%7C".$value->d_latitude.",".$value->d_longitude.
                            "&path=color:0x191919|weight:3|enc:".$value->route_key.
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
     * get all promo code.
     *
     * @return \Illuminate\Http\Response
     */

    public function promocodes() {
        try{
            $this->check_expiry();

            return PromocodeUsage::Active()
                    ->where('user_id', Auth::user()->id)
                    ->with('promocode')
                    ->get();

        } catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }
    } 


    public function check_expiry(){
        try{
            $Promocode = Promocode::all();
            foreach ($Promocode as $index => $promo) {
                if(date("Y-m-d") > $promo->expiration){
                    $promo->status = 'EXPIRED';
                    $promo->save();
                    PromocodeUsage::where('promocode_id', $promo->id)->update(['status' => 'EXPIRED']);
                }else{
                    PromocodeUsage::where('promocode_id', $promo->id)->update(['status' => 'ADDED']);
                }
            }
        } catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }
    }


    /**
     * add promo code.
     *
     * @return \Illuminate\Http\Response
     */

    public function add_promocode(Request $request) {

        $this->validate($request, [
                'promocode' => 'required|exists:promocodes,promo_code',
            ]);

        try{

            $find_promo = Promocode::where('promo_code',$request->promocode)->first();

            if($find_promo->status == 'EXPIRED' || (date("Y-m-d") > $find_promo->expiration)){

                if($request->ajax()){

                    return response()->json([
                        'message' => trans('api.promocode_expired'), 
                        'code' => 'promocode_expired'
                    ]);

                }else{
                    return back()->with('flash_error', trans('api.promocode_expired'));
                }

            }elseif(PromocodeUsage::where('promocode_id',$find_promo->id)->where('user_id', Auth::user()->id)->where('status','ADDED')->count() > 0){

                if($request->ajax()){

                    return response()->json([
                        'message' => trans('api.promocode_already_in_use'), 
                        'code' => 'promocode_already_in_use'
                        ]);

                }else{
                    return back()->with('flash_error', 'Promocode Already in use');
                }

            }else{

                $promo = new PromocodeUsage;
                $promo->promocode_id = $find_promo->id;
                $promo->user_id = Auth::user()->id;
                $promo->status = 'ADDED';
                $promo->save();

                if($request->ajax()){

                    return response()->json([
                            'message' => trans('api.promocode_applied') ,
                            'code' => 'promocode_applied'
                         ]); 

                }else{
                    return back()->with('flash_success', trans('api.promocode_applied'));
                }
            }

        }

        catch (Exception $e) {
            if($request->ajax()){
                return response()->json(['error' => trans('api.something_went_wrong')], 500);
            }else{
                return back()->with('flash_error', 'Something Went Wrong');
            }
        }

    } 

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function upcoming_trips() {
    
        try{
            $UserRequests = UserRequests::UserUpcomingTrips(Auth::user()->id)->get();
            if(!empty($UserRequests)){
                $map_icon = asset('asset/img/marker-start.png');
                foreach ($UserRequests as $key => $value) {
                    $UserRequests[$key]->static_map = "https://maps.googleapis.com/maps/api/staticmap?".
                            "autoscale=1".
                            "&size=320x130".
                            "&maptype=terrian".
                            "&format=png".
                            "&visual_refresh=true".
                            "&markers=icon:".$map_icon."%7C".$value->s_latitude.",".$value->s_longitude.
                            "&markers=icon:".$map_icon."%7C".$value->d_latitude.",".$value->d_longitude.
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
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function upcoming_trip_details(Request $request) {

         $this->validate($request, [
                'request_id' => 'required|integer|exists:user_requests,id',
            ]);
       
        try{
            $UserRequests = UserRequests::UserUpcomingTripDetails(Auth::user()->id,$request->request_id)->get();
            if(!empty($UserRequests)){
                $map_icon = asset('asset/img/marker-start.png');
                foreach ($UserRequests as $key => $value) {
                    $UserRequests[$key]->static_map = "https://maps.googleapis.com/maps/api/staticmap?".
                            "autoscale=1".
                            "&size=320x130".
                            "&maptype=terrian".
                            "&format=png".
                            "&visual_refresh=true".
                            "&markers=icon:".$map_icon."%7C".$value->s_latitude.",".$value->s_longitude.
                            "&markers=icon:".$map_icon."%7C".$value->d_latitude.",".$value->d_longitude.
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
     * Show the nearby providers.
     *
     * @return \Illuminate\Http\Response
     */

    public function show_providers(Request $request) {

        $this->validate($request, [
                'latitude' => 'required|numeric',
                'longitude' => 'required|numeric',
                'service' => 'numeric|exists:service_types,id',
            ]);

        try{

        

            $distance = Setting::get('provider_search_radius', '10');
            $latitude = $request->latitude;
            $longitude = $request->longitude;

            if($request->has('service')){
                $ActiveProviders = ProviderService::AvailableServiceProvider($request->service)->get()->pluck('provider_id');
                $Providers = Provider::whereIn('id', $ActiveProviders)
                    ->where('status', 'approved')
                    ->whereRaw("(1.609344 * 3956 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ) <= $distance")
                    ->get();
            } else {
                $Providers = Provider::where('status', 'approved')
                    ->whereRaw("(1.609344 * 3956 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ) <= $distance")
                    ->get();
            }

            if(count($Providers) == 0) {
                if($request->ajax()) {
                    return response()->json(['message' => "No Providers Found"]); 
                }else{
                    return back()->with('flash_success', 'No Providers Found! Please try again.');
                }
            }
        
            return $Providers;

        } catch (Exception $e) {
            if($request->ajax()) {
                return response()->json(['error' => trans('api.something_went_wrong')], 500);
            }else{
                return back()->with('flash_error', 'Something went wrong while sending request. Please try again.');
            }
        }
    }


    /**
     * Forgot Password.
     *
     * @return \Illuminate\Http\Response
     */


    public function forgot_password(Request $request){

        $this->validate($request, [
                'mobile' => 'required',
            ]);

        try{  
            
            $user = User::where('mobile',$request->mobile)->first();
            if(count($user)>0)
            {
                $otp = mt_rand(100000, 999999);

                $user->otp = $otp;
                $user->save();
    
                Notification::send($user, new ResetPasswordOTP($otp));
    
                return response()->json([
                    'message' => 'OTP sent to your mobile!',
                    'user' => $user
                ]);    
            }   else{
                return response()->json(['error' => 'Mobile not found'], 200);
            }

        }catch(Exception $e){
                return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }
    }


    /**
     * Reset Password.
     *
     * @return \Illuminate\Http\Response
     */

    public function reset_password(Request $request){

        $this->validate($request, [
                'password' => 'required|confirmed|min:6',
                'id' => 'required|numeric|exists:users,id'
            ]);

        try{

            $User = User::findOrFail($request->id);
            $User->password = bcrypt($request->password);
            $User->save();

            if($request->ajax()) {
                return response()->json(['message' => 'Password Updated']);
            }

        }catch (Exception $e) {
            if($request->ajax()) {
                return response()->json(['error' => trans('api.something_went_wrong')]);
            }
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
     * Insert Insurance
     *
     * @return \Illuminate\Http\Response
     */

    public function insertInsurance(Request $request)
    {
        $this->validate($request, [
                'name' => 'required',
                'price' => 'required'
            ]);

        try
        {
            $insuranceData = $request->input();
            $insuranceMst = new Insurances;
            $insuranceMst->name = $insuranceData['name'];
            $insuranceMst->price = $insuranceData['price'];
            $insuranceMst->save();

            return response()->json(['message' => 'Insurance Inserted Successfully']);

        }catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')]);
        }
    }

    /**
     * Get All Insurance
     *
     * @return \Illuminate\Http\Response
     */

    public function getAllInsurance(Request $request,$insuranceId = null)
    {
        try
        {
            if ($insuranceId == null) {
                $insuranceMst = Insurances::all();
            }
            else{
                $insuranceMst = Insurances::where('insurance_id',$insuranceId)->get();
            }
            
            if ($insuranceMst->count() > 0) {
                return $insuranceMst;
            }

            return response()->json(['message' => 'No Insurance Available']);

        }catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')]);
        }
    }
public function getBookmarkList(Request $request){

if($request->has('latitude') && $request->has('longitude')){
           User::where('id',\Auth::id())->update(['latitude'=>$request->latitude,'longitude'=>$request->longitude]);
                }
         $distance = Setting::get('provider_search_radius', '10');
        $arr = [];
       
    $res = Provider::with('service','bookmarks')->where('status','approved')->whereRaw("(1.609344 * 3956 * acos( cos( radians('$request->latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$request->longitude') ) + sin( radians('$request->latitude') ) * sin( radians(latitude) ) ) ) <= $distance")->get();
    $kilometer = 0;

        foreach ($res as $key => $value) {

          $pres = ProviderService::where('status','active')->where('provider_id',$value->id)->get();

          foreach ($pres as $pk => $pv) {

     
          $details = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=".Auth::user()->latitude.",".Auth::user()->longitude."&destinations=".$value->latitude.",".$value->longitude."&key=".env('GOOGLE_MAP_KEY');

               $json = curl($details);

                   $details = json_decode($json, TRUE);
                 $rc = json_encode($details['rows'][0]['elements'][0]);
                 $rcv = json_decode($rc);
                 $dr =  json_encode(@$rcv->distance);
                 if($dr=='null'){ $km = '0 m';}
                 else{ 
                 $pobj = json_decode($dr);
                 $km = $pobj->text;

                  }
                 

                 #if($details['rows'][0]['elements']['distance']){ echo 'sss';}
                 #if($details['rows'][0]['elements']['status']){ echo 'aa';}
                 # echo $meter = json_encode($details['rows'][0]['elements']).'<br/>';
                 # echo $meter = json_encode($details['rows'][0]['elements']).'<br/>';
              
 

           $r = ServiceType::where('id',$pv->service_type_id)->get();
           foreach ($r as $k => $v) {

               $arr[] = [
                              "id"=>$value->id,
                              "first_name"=>$value->first_name,
                              "last_name"=>$value->last_name,
                              "email"=>$value->email,
                              "mobile"=>$value->mobile,
                              "rating"=>$value->rating,
                              "latitude"=>$value->latitude,
                              "longitude"=>$value->longitude,
                              "avatar"=>$value->avatar,
                              "distance"=>$km,
                              "created_at"=>$value->created_at,                             
                              "service_Type"=>[
                                                "id"=>$v->id,
                                                "name"=>$v->name,
                                                "image"=>$v->image,
                                               ],
                              "bookmarks"=>$value->bookmarks,

                          ];
               
               
           }
           
        }
}
        return response()->json(["status"=>"1","data"=>$arr]);

}


	public function getCaretakerList(Request $request) {
	
		if($request->has('latitude') && $request->has('longitude')) {
           User::where('id',\Auth::id())->update(['latitude'=>$request->latitude,'longitude'=>$request->longitude]);
        }
		

       if($request->has('radius')){

         $distance = $request->radius;

        $res = Provider::with('service','bookmarks')->where('status','approved')->Where('service_type_id',$request->service_type_id)->whereBetween('base_amount', [$request->min_price, $request->max_price])->whereRaw("(1.609344 * 3956 * acos( cos( radians('$request->latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$request->longitude') ) + sin( radians('$request->latitude') ) * sin( radians(latitude) ) ) ) <= $distance")->get();

       } else {
		   
        $distance = Setting::get('provider_search_radius', '10');
    	
    	$res = Provider::with('service','bookmarks')->where('status','approved')->Where('service_type_id',$request->service_type_id)->whereRaw("(1.609344 * 3956 * acos( cos( radians('$request->latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$request->longitude') ) + sin( radians('$request->latitude') ) * sin( radians(latitude) ) ) ) <= $distance")->get();

       }

        $arr = [];


        foreach ($res as $key => $value) {
          
			$pres = ProviderService::where('status','active')->where('provider_id',$value->id)->get();
			
			foreach ($pres as $pk => $pv) {
				
			  
			  $details = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=".Auth::user()->latitude.",".Auth::user()->longitude."&destinations=".$value->latitude.",".$value->longitude."&key=".env('GOOGLE_MAP_KEY');
				   $json = curl($details);
					$details = json_decode($json, TRUE);
					
					
					 $rc = json_encode($details['rows'][0]['elements'][0]);
					 $rcv = json_decode($rc);
					 $dr =  json_encode(@$rcv->distance);
					 if($dr=='null'){ $km = '0 m';}
					 else{ 
					 $pobj = json_decode($dr);
					 $km = $pobj->text;

					  }
					  
			   $r = ServiceType::where('id',$pv->service_type_id)->get();
			   
			   foreach ($r as $k => $v) {

				   $arr[] = ["id"=>$value->id, "first_name"=>$value->first_name,
								  "last_name"=>$value->last_name,
								  "email"=>$value->email,
								  "provider_service_type"=>$value->provider_service_type,
								  "mobile"=>$value->mobile,
								  "rating"=>$value->rating,
								  "latitude"=>$value->latitude,
								  "longitude"=>$value->longitude,
								  "avatar"=>$value->avatar,
								  "distance"=>$km,
								  "currency"=>$this->getCurrency($value->currency_id),
								  "base_amount"=>$value->base_amount,
								  "created_at"=>$value->created_at,                             
								  "service_Type"=>[
													"id"=>$v->id,
													"name"=>$v->name,
													"image"=>$v->image,
												   ],
								  "bookmarks"=>$value->bookmarks,

							  ];
				   
				   
			   }
			   
			}
		}
		
        return response()->json(["status"=>"1","data"=>$arr]);
    }

    public function getCurrency($currency_id){
    
return Settings::select('value')->find($currency_id);
   
    }


    public function postBookmark(Request $request){
        
         $this->validate($request, [
                'provider_id' => 'required|int'
            ]);

        $res = ProviderBookmarks::where('provider_id',$request->provider_id)->where('user_id',\Auth::id())->get();
        if(count($res)){
             if($res[0]->bmark==='Y'){
             ProviderBookmarks::where('id',$res[0]->id)->update(['bmark'=>'N']);
             return response()->json(["status"=>1,"result"=>"Bookmarked"]);
             }
             else{
              ProviderBookmarks::where('id',$res[0]->id)->update(['bmark'=>'Y']);
              return response()->json(["status"=>0,"result"=>"unBookmarked"]);
             }

             
        }
        else{

       ProviderBookmarks::Create(['user_id'=>\Auth::id(),'provider_id'=>$request->provider_id,'bmark'=>'Y']);  
       return response()->json(["status"=>1,"result"=>"Bookmarked"]);


        }
    }
	
	
    public function request_for_careTaker( Request $request ) {
	   
        $this->validate($request, [
                's_latitude' => 'required|numeric',
                's_longitude' => 'required|numeric',
                'service_type' => 'required',
                'promo_code' => 'exists:promocodes,promo_code',
                'use_wallet' => 'numeric',
                'payment_mode' => 'required|in:CASH,CARD,PAYPAL',
         
            ]);
			

        Log::info('New Request from User: '.Auth::user()->id);
        Log::info('Request Details:', $request->all());
		
        $distance 		= Setting::get('provider_search_radius', '10');
        $latitude 		= $request->s_latitude;
        $longitude 		= $request->s_longitude;
        $service_type 	= $request->service_type;
		
        try{

      
            $UserRequest = new UserRequests;
            $UserRequest->booking_id = Helper::generate_booking_id();
            $UserRequest->user_id = Auth::user()->id;
			
		
            $UserRequest->service_type_id = $request->service_type;
            $UserRequest->payment_mode = $request->payment_mode;
            
            $UserRequest->status = 'ACCEPT';

            $UserRequest->d_address = $request->s_address ? : "";
            $UserRequest->d_latitude = $request->s_latitude;
            $UserRequest->d_longitude = $request->s_longitude;

            if(Auth::user()->wallet_balance > 0){
                $UserRequest->use_wallet = $request->use_wallet ? : 0;
            }

      
            $UserRequest->assigned_at = Carbon::now();

            $UserRequest->save();
            
            $countR = ItemRequest::where('request_status',0)->count();
            if($countR == 1){
            ItemRequest::where('user_id',Auth::user()->id)->where('request_status',0)->update(['booking_id'=>$UserRequest->booking_id,'request_status'=>1]);  //update booking id in item request db table 
            }
          
            Log::info('New Request id : '. $UserRequest->id .' Assigned to provider : '. $UserRequest->current_provider_id);


   
            User::where('id',Auth::user()->id)->update(['payment_mode' => $request->payment_mode]);

            if($request->has('card_id')){

                Card::where('user_id',Auth::user()->id)->update(['is_default' => 0]);
                Card::where('card_id',$request->card_id)->update(['is_default' => 1]);
            }
		

            if($request->ajax()) {
				
                return response()->json([
                        'message' => 'New request Created!',
                        'request_id' => $UserRequest->id,
                        'current_provider' => $UserRequest->current_provider_id,
                    ]);
            
			} 

        } catch (Exception $e) {
            if($request->ajax()) {
                return response()->json(['error' =>  $e->getMessage()], 500);
            }else{
                return back()->with('flash_error', 'Something went wrong while sending request. Please try again.');
            }
        }
    }

    public function careTaker_fare(Request $request){
        \Log::info('Estimate', $request->all());
        $this->validate($request,[
               'service_type' => 'required|numeric|exists:service_types,id',
            ]);

        try{           
          
           # $r = UserRequests::select('started_at','finished_at')->where('status','ARRIVED')->where("user_id",\Auth::id())->latest()->get();

            $r = UserRequests::select('started_at','finished_at')->where("user_id",\Auth::id())->latest()->get();

            if(count($r)!="")
            {

                $startDate = Carbon::createFromFormat('Y-m-d H:i:s', $r[0]->started_at);
                if(isset($r[0]->finished_at)){

                    $endDate = Carbon::createFromFormat('Y-m-d H:i:s', $r[0]->finished_at);

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

            }   else{

                return response()->json(["status"=>0,"msg"=>"wrong value passed or result return []"]);
            }
            

            $tax_percentage = Setting::get('tax_percentage');
            $commission_percentage = Setting::get('commission_percentage');
            $service_type = ServiceType::findOrFail($request->service_type);
            
            $price = $service_type->fixed;

            if($service_type->calculator == 'MIN') {
                $price +=  ((($hours*60)+$minutes)*$service_type->minute);       //$service_type->minute as price
            }
            else{  return "Only minute Calculator allow ..please set calculator as MIN in admin panel";  }

            $tax_price = ( $tax_percentage/100 ) * $price;
            $total = $price; //without tax           

            return response()->json([
                    'toal_fare' => round($total,2), 
                    'total_minute' => $total_minute,
                    'base_price' => $service_type->fixed,
                    'tax_price' => $tax_price,
                    ]);

        }   catch(Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }
    }

    public function getInsuranceList(Request $request){

        try
        {
            $r =  Insurances::select('Insurance_id','name','price')->get();
            if($r){              

                return response()->json(['status' =>1,'data'=>$r]);
            }else{
                return response()->json(['status' =>0,'msg'=>'insurance data not found']);
            }

        }catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')]);
        }
    }

	public function estimated_time(Request $request) {
        \Log::info('Estimate', $request->all());
        $this->validate($request,[
                's_latitude' => 'required|numeric',
                's_longitude' => 'required|numeric',
                'service_type' => 'required|numeric|exists:service_types,id',
            ]);

        try{

            
            $service_type = ServiceType::findOrFail($request->service_type);
            
          

            $ActiveProviders = ProviderService::AvailableServiceProvider($request->service_type)->get()->pluck('provider_id');

            $distance = Setting::get('provider_search_radius', '10');
            $latitude = $request->s_latitude;
            $longitude = $request->s_longitude;

            $Providers = Provider::whereIn('id', $ActiveProviders)
                ->where('status', 'approved')
                ->whereRaw("(1.609344 * 3956 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ) <= $distance")
                ->get();

            $surge = 0;
            $time = 0;
            $kilometer = 0;
            
            if($Providers->count() <= Setting::get('surge_trigger') && $Providers->count() > 0){
                $surge_price = (Setting::get('surge_percentage')/100) * $total;
                $total += $surge_price;
                $surge = 1;
                
                $r = UserRequests::where('status','STARTED')->where('user_id',\Auth::id())->get();
                 if($r){

                   $res = Providers::select('latitude','longitude')->where('id',$r[0]->provider_id)->get();
                   if(isset($res[0]->latitude)){
               
                $details = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=".$request->s_latitude.",".$request->s_longitude."&destinations=".$res[0]->latitude.",".$res[0]->longitude."&mode=driving&sensor=false&key=".env('GOOGLE_MAP_KEY');

                   $json = curl($details);

                   $details = json_decode($json, TRUE);

                   $meter = $details['rows'][0]['elements'][0]['distance']['value'];
                   $time = $details['rows'][0]['elements'][0]['duration']['text'];
                   $seconds = $details['rows'][0]['elements'][0]['duration']['value'];
                   $kilometer = round($meter/1000);
                 }
                 else{

                    return response()->json(['msg'=>'please set Provider lat-lang or update']);
                 }
                 }
                 else{
                    return response()->json(['msg'=>'user request not started yet,please accept user request']);

                 }


            }

            return response()->json([
                    
                    'distance' => $kilometer,
                    'time' => $time,
                    'surge' => $surge,
                    'surge_value' => '1.4X',
                    'base_price' => $service_type->fixed,
                    'wallet_balance' => Auth::user()->wallet_balance,
                ]);

        } catch(Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }
    }

    

   public function gpsLocation(Request $request){

    $this->validate($request, [
                'latitude' => 'required|numeric',
                'longitude' => 'required|numeric',
            ]);
$gps = User::where('id',\Auth::id())->update(['latitude'=>$request->latitude,'longitude'=>$request->longitude]);
if($gps){
    return response()->json(["status"=>1,'msg'=>'Successfully gps localtion updated']);
    }
    else{
    return response()->json(["status"=>0,'msg'=>'location not updated']);

    }
}

public function getProviderDetails(Request $request){
            
    $this->validate($request, [
                'provider_id' => 'required|numeric',
                ]);

   
    $pres = Provider::where('id',$request->provider_id)->get();
   // $currency = Settings::where('id',$pres[0]->currency_id)->first();
    $card = Card::select('last_four','brand')->where('user_id',Auth::user()->id)->get();
    if(count($card) != 0){
       $card = 1;
       }else {  $card = 0; }

    $res = ServiceType::select('id','name','image')->where('id',$pres[0]->major_service_type_id)->get();
    $res[0]['provider_base_amount'] = $pres[0]->base_amount;
    //$res[0]['currency_symbol'] = $currency->value;
    $res[0]['currency_symbol'] = '$';
    $res[0]['user_card'] = $card;
    $res[0]['wallet_balance'] = Auth::user()->wallet_balance;
 

 
    return response()->json([$res[0]]);
}

   public function majoRservices(){

       $data = ServiceType::select('id','provider_name','provider_image')->groupBy('provider_name')->get();
       if(count($data) !==0){
       return response()->json(['status'=>1,'data'=>$data,'msg'=>'Available service types list']);
      }
      else{
         return response()->json(['status'=>1,'msg'=>' service types list not Available']);
           }
     }

    public function majoRservicesSubList(Request $request){
      
        $this->validate($request, [
            'service_name' => 'required',              
        ]);      
      

        $data = StoreUser::where('store_type',$request->service_name)->get();
       
        $latitude = Auth::user()->latitude;
        $longitude = Auth::user()->longitude;
        $distance = Setting::get('provider_search_radius', '10');
        //dd($latitude);
        if($request->service_name != 'Courier'){
       		$data = StoreUser::
					select(DB::Raw("ROUND((6371 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ),2) AS distance"),'id','name','store_name','image','store_type as mainCategory','min_amount','latitude as storelat','longitude as lon')
					->where('store_type',$request->service_name)
					->whereRaw("(6371 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ) <= $distance")
					->orderBy('distance')
					->get();
        }	
        //dd($data);
        if(count($data) !==0){
            return response()->json(['status'=>1,'data'=>$data,'msg'=>'Available service types list']);
        }
        else{
            return response()->json(['status'=>0,'msg'=>' service types list not Available']);
        }
     }
     
     
    

	 
	//Modified BY SI
    public function providerFullDetails(Request $request) {
		
		$this->validate($request, [
                'provider_id' => 'required',              
            ]);
       
   
		$r = Provider::where('id',$request->provider_id)->get();
		
		$provider = Provider::where( 'id',$request->provider_id )->first();
		
		$cr = Settings::select('key','value')->where('id',$r[0]->currency_id)->first();
		
		
		
		$r[0]['currency_type'] = @$cr->value;
	
	
		if(isset($r[0]->service_type_id) ) {
			
			foreach($r as $k=>$v) {
				
				//$arr  = explode(",",$v->service_type_id);
			 
			   $level_3 = ServiceType::select('id','name','provider_name','image')->where('id',$v->major_service_type_id)->get();
			 
			   

				  $r[0]['service'] = ['main_cat'=>$level_3[0]->provider_name,'sub_cat'=>$level_3[0]->name];
				  $r[0]['subCategory'] = json_decode($level_3);
				
				
			   
			}

			$res = UserRequestRating::select('user_id','provider_id','user_rating','user_comment')->where('provider_id',$r[0]->id)->get();

             $resLevel = UserRequestRating::where('provider_id',$request->provider_id)->where('user_rating','<>','null')->count();

             $totaldrive = UserRequests::whereIn('status',['COMPLETED','CANCELLED'])->where('provider_id',$request->provider_id)->count();

             if($totaldrive != 0){

             $successdrive = UserRequests::whereIn('status',['COMPLETED'])->where('provider_id',$request->provider_id)->count();

             // $totalCompletion = (($resLevel*100)/$totaldrive)/(5/100);

             $successRate = (($successdrive*100)/$totaldrive);

                    $totalCompletion = round(($successRate*(5/100)),1);
              }else{
                $totalCompletion = 0;
              }

              if($resLevel >= 10 && $resLevel <50){

              $level = '1st';
              }
             elseif($resLevel >= 50 && $resLevel < 100){

             $level = '2nd';
             }
             elseif($resLevel >= 100){

             $level = '3rd';
             }
             else{
                  $level = 0;
                 }
		
  $avgRating = UserRequestRating::groupBy('user_rating')->select('user_rating', DB::raw('count(user_rating) as total'))->where('provider_id',$request->provider_id)->get();  //provider Rating

  if(count($avgRating) !=0){
$avgsum = [];
$avg = [];
  foreach ($avgRating as $rk => $rv) {
     
     $avgsum[] =$rv->user_rating*$rv->total;
     $avg[] = $rv->total;
  }

$avgRating = round(array_sum($avgsum)/array_sum($avg),1);
}
else{
 $avgRating = 0;   
}







			foreach($res as $f=>$t){
			   
			   $res[$f]['user_details'] = User::select('first_name','last_name','picture')->where('id',$t->user_id)->get();

			} 
    
			return response()->json(['status'=>1,'data'=>$r[0],'userReview'=>json_decode($res),'level'=>$level,'completionRate'=>$totalCompletion,'avgRating'=>$avgRating]);
	
       } else {  
	   
		return response()->json(['status'=>0,'data'=>$r[0],'msg'=>' Service type is not found']); 
		
		}
    }

public function test(){



 $now = Carbon::now();
$d = explode(",",1,30);

 echo $res = (new Carbon("2018-10-03 15:49:15"))->addminute(2);
echo '<br/>';
if($now > $res){ echo 'expire';}else{ echo 'not expire';}
echo '<br/>';
echo $r = $now->format('g:i A');
echo '<br/>';

$start_service = '2018-10-03 13:10:18';

$start = '12:17 PM';
$end = '1:18 AM';



if(strtotime($now) > strtotime($start) && strtotime($now) < strtotime($end) ) {
    echo 'YES<br/>';
    echo strtotime($now).'----'.strtotime($start).'---'.strtotime($end);
} else {
    echo 'NO<br/>';
   echo strtotime($now).'----'.strtotime($start).'---'.strtotime($end);
}


}

public function videoCall_user(Request $request){

(new SendPushNotification)->videoNotifyProvider($request->provider_id,$request->video_status,$request->random_id);

  // (new SendPushNotification)->testIosUser(Auth::user()->id,'hello Ravi');


return response()->json(["status"=>1,"data"=>$request->all()]);
}

 public function stopWork(Request $request){
         
         $this->validate($request, [
                   'request_id'=>'required|max:255'
                ]);
  
         $UserRequest= UserRequests::with('user')->where('booking_id',$request->request_id)->first();
        if(empty($UserRequest->finished_at)){
                $r = UserRequests::where('booking_id',$request->request_id)->update(["finished_at"=>Carbon::now(),'status'=>'STOPPED','service_hour_status'=>1]);
                
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


    public function trackTimer(Request $request){

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


                }
                else{
                
             $timer = $now->diff($minuteServices)->format('%H:%I:%S');

              $status = 1;
                }
                
                }
           

       return response()->json(['status'=>$status,'timer'=>$timer]);
    
    }

    

public function ur_offer(){

    $r = Offer::all();

    return response()->json(['data'=>$r]);
}


public function getLang(Request $request){

$data = User::where('id',Auth::user()->id)->update(['lang'=>$request->lang]);

return response()->json(['status'=>1,'msg'=>'language selected successfully','lang'=>$request->lang]);

}

public function paypalAuth(Request $request){


    $ch = curl_init();
$clientId = "AeXL64Bbyhem2VYxL6FeOT8HoqqoXZAdA7S1pWFoiqt1AfmG7VDi5xMEEjwjuOusBVKolos0fUfS21mX";
$secret = "EAc2LQhWCpCAgk-H3LVzjARhwu0Gbf0mkVbk5zXug6Dsczli_bZtI-SAcIxhG2QBx9yMS80aTo5abP-1";

curl_setopt($ch, CURLOPT_URL, "https://api.sandbox.paypal.com/v1/oauth2/token");
curl_setopt($ch, CURLOPT_HEADER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 
curl_setopt($ch, CURLOPT_USERPWD, $clientId.":".$secret);
curl_setopt($ch, CURLOPT_POSTFIELDS, "grant_type=client_credentials");

$result = curl_exec($ch);

if(empty($result))die("Error: No response.");
else
{

    $json = json_decode($result);
    return response()->json(['access_token'=>$json->access_token]);
}

curl_close($ch);
}


    public function item_list(Request $request){
      
       $this->validate($request, [
                'service_provider_id' => 'required',              
            ]);
       
        //   $data = SellingItem::select('item_type')->where('service_provider_id',$request->service_provider_id)->distinct()->get();
       
        $data = SellingItem::select('id','item_type')->where('service_provider_id','=',$request->service_provider_id)->where('quantity','!=',0)->groupBy('item_type')->orderBy('created_at', 'asc')->get();
      
        if($data->count() == 0){ return response()->json(['status'=>0,'data'=>[],'msg'=>'No item found']);   };
      
        foreach($data as $ik=>$iv){
          
            $data[$ik]['item_type_name'] = SubCategory::where('id',$iv->item_type)->value('name');
        }
       
        foreach($data as $key=>$value){
           
            $data[$key][$value->item_type_name] = SellingItem::where('item_type',$value->item_type)->where('service_provider_id','=',$request->service_provider_id)->get();
            //dd($data[$key][$value->item_type_name]);
            foreach($data[$key][$value->item_type_name] as $kk=>$vv){
            $data[$key][$value->item_type_name][$kk]['item_quantity']  = ItemRequest::where('user_id',Auth::user()->id)->where('selling_item_id',$vv->id)->where('status',1)->value('quantity')?:0;
            }
        }
       
        if(count($data) !==0){
           
           $totalPrice = ItemRequest::where('user_id',Auth::user()->id)->where('status',1)->sum('item_price');
      
           $totalQuantity = ItemRequest::where('user_id',Auth::user()->id)->where('status',1)->sum('quantity');
    
           
            return response()->json(['status'=>1,'data'=>$data,'msg'=>'Available item list','totalCalculation'=>['totalAmount'=>$totalPrice?:0,'totalQuantity'=>$totalQuantity?:0]]);
        }
        else{
            return response()->json(['status'=>0,'msg'=>' item list not Available']);
        }
     }
     

        public function addCart(Request $request){
    
            $this->validate($request, [
                   'item_id'=>'required',
                   'quantity'=>'numeric',
            ]);   
             
                
            $itemStock = SellingItem::where('id',$request->item_id)->value('quantity');

            if($itemStock == 0){

                return response()->json(['status'=>0,'msg'=>'item has been out of stock']); 

            }
               
            $item = SellingItem::where('id',$request->item_id)->first();
        
            $r =   ItemRequest::where('user_id',Auth::user()->id)->where('selling_item_id',$request->item_id)->where('status',1)->first();
            if($r){
          
                if($request->has('plus')){
                    $r->quantity += 1; 
                    $itemprice = ($item->item_price * $r->quantity); 
                }
                if($request->has('minus')){
                    if($r->quantity!=0)
                    {
                        $r->quantity -= 1;
                    } 
                     
                    $itemprice = ($item->item_price * $r->quantity); 
                      
                }
                ItemRequest::where('user_id',Auth::user()->id)->where('selling_item_id',$request->item_id)->update(['quantity'=>$r->quantity,'item_price'=>$itemprice]);
               
                $getUpId = ItemRequest::where('selling_item_id',$request->item_id)->first();          
                $quantity_d = SellingItem::find($request->item_id);
                $stock = $quantity_d->quantity - $getUpId->quantity;
                $quantity_d->update(['quantity'=>$stock]);
                /*if(ItemRequest::where('quantity',0)->first()){                  
                    ItemRequest::where('quantity',0)->delete();
                }*/
          
            }else{
                //dd($itemStock);
                ItemRequest::create([                  
                                    'selling_item_id'=>$request->item_id,
                                    'user_id'=>Auth::user()->id,
                                    'quantity'=>1,
                                    'item_price'=>@$item->item_price,                                 
                                    ]);          
            }
            //$latitude = Auth::user()->latitude;
            //$longitude = Auth::user()->longitude;
            $lat1 = Auth::user()->latitude;
            $lat2 = $request->storelat;
            $lon1 = Auth::user()->longitude;
            $lon2 = $request->storelon;
            $unit = "K";

            if (($lat1 == $lat2) && ($lon1 == $lon2)) {
                return 0;
            }
            else {
                $theta = $lon1 - $lon2;
                $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
                $dist = acos($dist);
                $dist = rad2deg($dist);
                $miles = $dist * 60 * 1.1515;
                $unit = strtoupper($unit);

                if ($unit == "K") {
                    $kilometer =  ($miles * 1.609344);
                } else if ($unit == "N") {
                    $kilometer =  ($miles * 0.8684);
                } else {
                    $kilometer =  $miles;
                }
            }          
            $rountkilo = round($kilometer,0);
            $fare_price = Settings::where('key','fare_price')->first();
            $driver_base_price = Settings::where('key','driver_base_price')->first();
            $deliveryprice = ($fare_price['value']*$rountkilo)+$driver_base_price['value'];
            
      
            $totalPrice = ItemRequest::where('user_id',Auth::user()->id)->where('status',1)->sum('item_price');
          
            $totalQuantity = ItemRequest::where('user_id',Auth::user()->id)->where('status',1)->sum('quantity'); 

        return response()->json(['status'=>1,'data'=>['totalAmount'=>$totalPrice,'totalQuantity'=>$totalQuantity,'delivery'=>$deliveryprice]]);
      
    
    
}

public function viewCart(Request $request){
      
       $this->validate($request, [
             //   'service_provider_id' => 'required',              
            ]);
       
       

       $data = ItemRequest::where('user_id',Auth::user()->id)->where('quantity','!=',0)->where('status',1)->get();
       
     //  SellingItem::where('service_provider_id',$request->service_provider_id)->get();
       
       foreach($data as $key=>$value){
           
           
               $data[$key]['details'] = SellingItem::where('id',$value->selling_item_id)->first();
         
           
       }
       
        if(count($data) !==0){
           
           $totalPrice = ItemRequest::where('user_id',Auth::user()->id)->where('status',1)->sum('item_price');
      
      $totalQuantity = ItemRequest::where('user_id',Auth::user()->id)->where('status',1)->sum('quantity');
      
      $deliveryFee = 'Free';
    
           
       return response()->json(['status'=>1,'data'=>$data,'totalCalculation'=>['totalAmount'=>$totalPrice?:0,'totalQuantity'=>$totalQuantity?:0,'deliveryFee'=>$deliveryFee]]);
      }
      else{
         return response()->json(['status'=>0,'msg'=>' item list not Available']);
           }
     }

    public function mostSearchable(Request $request){
        
    //   $r = ServiceType::select('id','name','image','provider_name as MainCategory','latitude','longitude','location')->inRandomOrder()->get();
       
        $latitude = Auth::user()->latitude;
        $longitude = Auth::user()->longitude;
        $distance = Setting::get('provider_search_radius', '10');
       
       		$r = ServiceType::
					 select(DB::Raw("ROUND((6371 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ),2) AS distance"),'id','name','image','provider_name as MainCategory','latitude','longitude','location')
					->inRandomOrder()
					->whereRaw("(6371 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ) <= $distance")
					->orderBy('distance')
					->get();
       
    //   foreach($r as $key=>$value){
           
    //       $r[$key]['distance'] = 5;
    //   }
       
       return response()->json(['status'=>1,'data'=>$r]);
        
    }
    
    
    
     public function search_item(Request $request){
        
     
      $this->validate($request, [
                'q' => 'required',    
               
            ]);
       
     

      if($request->has('latitude')){
          
          User::where('id',Auth::user()->id)->update(['latitude'=>$request->latitude,'longitude'=>$request->longitude]);
      }
       
        // $data = ServiceType::select('id','name','image','provider_name as mainCategory')->where('name', 'like', "%{$request->q}%")->get();
        
         $latitude = Auth::user()->latitude;
       $longitude = Auth::user()->longitude;
       $distance = Setting::get('provider_search_radius', '10');
       
       		$data = StoreUser::
					 select(DB::Raw("ROUND((6371 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ),2) AS distance"),'id','store_name as name','image','store_type as mainCategory')
					->where('name', 'like', "%{$request->q}%")
					->whereRaw("(6371 * acos( cos( radians('$latitude') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$longitude') ) + sin( radians('$latitude') ) * sin( radians(latitude) ) ) ) <= $distance")
					->orderBy('distance')
					->get();
       
       
       if(count($data) !==0){
        //   foreach($data as $k=>$v){
               
        //       $data[$k]['distance'] =5;
        //   }
       return response()->json(['status'=>1,'data'=>$data,'msg'=>'Available service types list']);
      }
      else{
         return response()->json(['status'=>0,'msg'=>' service types list not Available']);
           }
}



 public function courierInfo(Request $request){
        
    
      $this->validate($request, [
          
                'item_height' => 'required',
                'item_width' => 'required',  
                'item_weight' => 'required',  
                'item_quatity' => 'required',  
                'service_type_id' => 'required',   
                's_location' => 'required',   
                's_latitude' => 'required',   
                's_longitude' => 'required', 
                'd_location' => 'required',   
                'd_latitude' => 'required',   
                'd_longitude' => 'required',
                'pickup_info' => 'required',
                
                
               
            ]);
            
            $details = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=".$request->s_latitude.",".$request->s_longitude."&destinations=".$request->d_latitude.",".$request->d_longitude."&mode=driving&sensor=false&key=".env('GOOGLE_MAP_KEY');
                
                          $json = curl($details);
                          $details = json_decode($json, TRUE);
                
                           $meter   = $details['rows'][0]['elements'][0]['distance']['value'];

                           $kilometer = round($meter/1000, 2);
       
        $request['user_id'] = Auth::user()->id;
        $request['distance'] = $kilometer;
        
        $data = CourierDetail::Create($request->all());
        
        if($data){
            
            
            
            
            
        }
      
     return response()->json(['status'=>1,'data'=>$data]);
       
       
     
}




 public function estimated_fare_courier(Request $request){
        // \Log::info('Estimate', $request->all());
        // $this->validate($request,[
        //         's_latitude' => 'required|numeric',
        //         's_longitude' => 'required|numeric',
        //         'd_latitude' => 'required|numeric',
        //         'd_longitude' => 'required|numeric',
        //         'service_type' => 'required|numeric|exists:service_types,id',
        //     ]);

        try{
            
            $userCourier = CourierDetail::where('user_id',Auth::user()->id)->orderBy('id','desc')->first();

            

            $kilometer = $userCourier->distance;
            

            $tax_percentage = Setting::get('tax_percentage');
            $commission_percentage = Setting::get('commission_percentage');
            $service_type = ServiceType::findOrFail($userCourier->service_type_id);
            
            $price = $service_type->fixed;

            if($service_type->calculator == 'MIN') {
                $price += $service_type->minute * $minutes;
            } else if($service_type->calculator == 'HOUR') {
                $price += $service_type->minute * 60;
            } else if($service_type->calculator == 'DISTANCE') {
                $price += ($kilometer * $service_type->price);
            } else if($service_type->calculator == 'DISTANCEMIN') {
                $price += ($kilometer * $service_type->price) + ($service_type->minute * $minutes);
            } else if($service_type->calculator == 'DISTANCEHOUR') {
                $price += ($kilometer * $service_type->price) + ($service_type->minute * $minutes * 60);
            } else {
                $price += ($kilometer * $service_type->price);
            }

            $tax_price = ( $tax_percentage/100 ) * $price;
            $total = $price + $tax_price;

          


            return response()->json([
                    'estimated_fare' =>number_format($total, 2, '.', ''),
                    'distance' => $kilometer,
                   
                    'tax_price' => number_format($tax_price, 2, '.', ''),
                    'base_price' => $service_type->fixed,
                    'wallet_balance' => Auth::user()->wallet_balance
                ]);

        } catch(Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }
    }


public function createDefaultLocation(Request $request){

        try{

                  $count = UserLocationType::where('user_id',Auth::user()->id)->where('location_type',$request->location_type)->count();

          if($count == 0){

           $data = UserLocationType::Create($request->all());

            }else{

              UserLocationType::where('user_id',Auth::user()->id)->where('location_type',$request->location_type)->update($request->all());


               }
            if($request->ajax()) {
                return response()->json(['status' =>1,'msg'=>'successfully created']);
            }

        }catch (Exception $e) {
            if($request->ajax()) {
                return response()->json(['error' => trans('api.something_went_wrong')]);
            }
        }
    }
    
    
     public function review(Request $request)
    {
        
        try{

         $review = UserRequestRating::select('provider_rating','provider_comment','created_at')->where('user_id', Auth::user()->id)
                    ->orderBy('id', 'DESC')
                    ->get();

           

            return response()->json(['data'=>$review]);
           
            
        } catch(Exception $e) {
            return response()->json(['error' => "Something Went Wrong"]);
        }
    }




}
