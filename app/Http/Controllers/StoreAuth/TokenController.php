<?php

namespace App\Http\Controllers\ProviderAuth;

use Illuminate\Http\Request;
use Illuminate\Database\QueryException;
use App\Http\Controllers\Controller;

use Tymon\JWTAuth\Exceptions\JWTException;
use App\Notifications\ResetPasswordOTP;

use Auth;
use Config;
use JWTAuth;
use Setting;
use Notification;
use Validator;
use Socialite;
use Storage;
use Carbon\Carbon;

use App\Provider;
use App\ProviderDevice;
use App\ProviderService;
use App\ServiceType;
use App\AccountSwitch;
use App\StoreUser;

class TokenController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function register(Request $request)
    {

        $this->validate($request, [
                'device_id' => 'required',
                'device_type' => 'required|in:android,ios',
                'device_token' => 'required', 
                'first_name' => 'required|max:255',
                'last_name' => 'required|max:255', 
               // 'email' => 'required',
                'mobile' => 'required|unique:providers',
                'password' => 'required|min:6|confirmed',
              
            ]);

        try{

			
            $Provider = $request->all();
            
			$Provider['password'] = bcrypt($request->password);
 
 
            $Provider = Provider::create($Provider);


            if(Setting::get('demo_mode', 0) == 1) {
                $Provider->update(['status' => 'approved']);
                ProviderService::create([
                    'provider_id' => $Provider->id,
                  //  'service_type_id' => $request->service_type_id,
                    'status' => 'active',
                    'service_number' => '4pp03ets',
                    'service_model' => 'Audi R8',
                ]);
            }

            ProviderDevice::create([
                    'provider_id' => $Provider->id,
                    'udid' => $request->device_id,
                    'token' => $request->device_token,
                    'type' => $request->device_type,
                ]);

            return $Provider;


        } catch (QueryException $e) {
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json(['error' => 'Something went wrong, Please try again later!'], 500);
            }
            return abort(500);
        }
        
    }
    
    
     public function store_register(Request $request)
    {

        $this->validate($request, [
                'device_id' => 'required',
                'device_type' => 'required|in:android,ios',
                'device_token' => 'required', 
                'name' => 'required|max:255',
                'store_name' => 'required|max:255', 
                'store_type' => 'required|max:255', 
                'email' => 'required|unique:store_users',
                'password' => 'required|min:6|confirmed',
                'image' => 'mimes:jpeg,bmp,png',
              
            ]);

        try{

			
           $Provider = $request->all();
            
			$Provider['password'] = bcrypt($request->password);
			
			
 
 
            $Provider = StoreUser::create($Provider);

             if ($request->image != "") {
                // Storage::delete($user->picture);
               
               StoreUser::where('id',$Provider->id)->update(['image'=>$request->image->store('user/profile')]);
            }
            
            if ($request->banner_image != "") {
                // Storage::delete($user->picture);
               
               StoreUser::where('id',$Provider->id)->update(['banner_image'=>$request->banner_image->store('user/profile')]);
            }

            return response()->json(['status'=>1,'msg'=>'You have successfully registered']);


        } catch (QueryException $e) {
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json(['error' => 'Something went wrong, Please try again later!'], 500);
            }
            return abort(500);
        }
        
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function authenticate(Request $request)
    {
        $this->validate($request, [
                'device_id' => 'required',
                'device_type' => 'required|in:android,ios',
                'device_token' => 'required',
                //'email' => 'required',
				'mobile'	=> 'required',
                'password' => 'required|min:6',
            ]);

        Config::set('auth.providers.users.model', 'App\Provider');

        //$credentials = $request->only('mobile', 'password');
		
		
        try {
			
			$provider =  Provider::where('mobile', $request->mobile)->first();
			
			 if( ! $provider ) {
				
				 return response()->json(['error' => 'The Mobile no1. or password you entered is incorrect.'], 401);
			 }
            
			//if (! $token = JWTAuth::attempt($provider)) {
			if (! $token = JWTAuth::fromUser($provider) ) {
                return response()->json(['error' => 'The Mobile no. or password you entered is incorrect.'], 401);
            }
        } catch (JWTException $e) {
            return response()->json(['error' => 'Something went wrong, Please try again later!'], 500);
        }

        $User = Provider::with('service', 'device')->find($provider->id);

        $User->access_token = $token;
        $User->currency = Setting::get('currency', '$');
        $User->sos = Setting::get('sos_number', '911');

        if($User->device) {
            ProviderDevice::where('id',$User->device->id)->update([
        
                'udid' => $request->device_id,
                'token' => $request->device_token,
                'type' => $request->device_type,
            ]);
            
        } else {
            ProviderDevice::create([
                    'provider_id' => $User->id,
                    'udid' => $request->device_id,
                    'token' => $request->device_token,
                    'type' => $request->device_type,
                ]);
        }

        return response()->json($User);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function logout(Request $request)
    {
        try {
            ProviderDevice::where('provider_id', $request->id)->update(['udid'=> '', 'token' => '']);
            ProviderService::where('provider_id',$request->id)->update(['status' => 'offline']);
            return response()->json(['message' => trans('api.logout_success')]);
        } catch (Exception $e) {
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
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
            
            $provider = Provider::where('mobile',$request->mobile)->first();
            if(count($provider)>0)
            {
                $otp = mt_rand(100000, 999999);
                $provider->otp = $otp;
                $provider->save();
                
                Notification::send($provider, new ResetPasswordOTP($otp));
                return response()->json([
                    'message' => 'OTP sent to your mobile!',
                    'provider' => $provider
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
                'id' => 'required|numeric|exists:providers,id'
            ]);

        try{

            $Provider = Provider::findOrFail($request->id);
            $Provider->password = bcrypt($request->password);
            $Provider->save();

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
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function facebookViaAPI(Request $request) { 

        $validator = Validator::make(
            $request->all(),
            [
                'device_type' => 'required|in:android,ios',
                'device_token' => 'required',
                'accessToken'=>'required',
                'device_id' => 'required',
                'login_by' => 'required|in:manual,facebook,google'
            ]
        );
        

        if($validator->fails()) {
            return response()->json(['status'=>false,'message' => $validator->messages()->all()]);
        }
        // $user = Socialite::driver('facebook')->stateless();
        // $FacebookDrive = $user->userFromToken( $request->accessToken);
       
        try{
            $FacebookSql = Provider::where('social_unique_id',$request->id);
            if($request->email !=""){
                $FacebookSql->orWhere('email',$request->email);
            }
            $AuthUser = $FacebookSql->first();
            if($AuthUser){ 
                $AuthUser->social_unique_id=$request->id;
                $AuthUser->login_by="facebook";
                $AuthUser->save();  
            }else{   
                $AuthUser["email"]=$request->email;
                $name = explode(' ', $request->name, 2);
                $AuthUser["first_name"]=$request->first_name;
                $AuthUser["last_name"]=$request->last_name;
                $AuthUser["password"]=bcrypt($request->id);
                $AuthUser["social_unique_id"]=$request->id;
                $AuthUser["avatar"]=$request->avatar;
                $AuthUser["login_by"]="facebook";
                $AuthUser = Provider::create($AuthUser);

                if(Setting::get('demo_mode', 0) == 1) {
                    $AuthUser->update(['status' => 'approved']);
                    ProviderService::create([
                        'provider_id' => $AuthUser->id,
                        'service_type_id' => '1',
                        'status' => 'active',
                        'service_number' => '4pp03ets',
                        'service_model' => 'Audi R8',
                    ]);
                }
            }    
            if($AuthUser){ 
                $userToken = JWTAuth::fromUser($AuthUser);
                $User = Provider::with('service', 'device')->find($AuthUser->id);
                if($User->device) {
                    ProviderDevice::where('id',$User->device->id)->update([
                        
                        'udid' => $request->device_id,
                        'token' => $request->device_token,
                        'type' => $request->device_type,
                    ]);
                    
                } else {
                    ProviderDevice::create([
                        'provider_id' => $User->id,
                        'udid' => $request->device_id,
                        'token' => $request->device_token,
                        'type' => $request->device_type,
                    ]);
                }
                return response()->json([
                            "status" => true,
                            "token_type" => "Bearer",
                            "access_token" => $userToken,
                            'currency' => Setting::get('currency', '$'),
                            'sos' => Setting::get('sos_number', '912')
                        ]);
            }else{
                return response()->json(['status'=>false,'message' => "Invalid credentials!"]);
            }  
        } catch (Exception $e) {
            return response()->json(['status'=>false,'message' => trans('api.something_went_wrong')]);
        }
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function googleViaAPI(Request $request) { 

        $validator = Validator::make(
            $request->all(),
            [
                'device_type' => 'required|in:android,ios',
                'device_token' => 'required',
                'accessToken'=>'required',
                'device_id' => 'required',
                'login_by' => 'required|in:manual,facebook,google'
            ]
        );
        
        if($validator->fails()) {
            return response()->json(['status'=>false,'message' => $validator->messages()->all()]);
        }
        // $user = Socialite::driver('google')->stateless();
        // $GoogleDrive = $user->userFromToken( $request->accessToken);
       
        try{
            $GoogleSql = Provider::where('social_unique_id',$request->id);
            if($request->email !=""){
                $GoogleSql->orWhere('email',$request->email);
            }
            $AuthUser = $GoogleSql->first();
            if($AuthUser){
                $AuthUser->social_unique_id=$request->id;  
                $AuthUser->login_by="google";
                $AuthUser->save();
            }else{   
                $AuthUser["email"]=$request->email;
                $name = explode(' ', $request->name, 2);
                $AuthUser["first_name"]=$request->first_name;
                $AuthUser["last_name"]=$request->last_name;
                $AuthUser["password"]=($request->id);
                $AuthUser["social_unique_id"]=$request->id;
                $AuthUser["avatar"]=$request->avatar;
                $AuthUser["login_by"]="google";
                $AuthUser = Provider::create($AuthUser);

                if(Setting::get('demo_mode', 0) == 1) {
                    $AuthUser->update(['status' => 'approved']);
                    ProviderService::create([
                        'provider_id' => $AuthUser->id,
                        'service_type_id' => '1',
                        'status' => 'active',
                        'service_number' => '4pp03ets',
                        'service_model' => 'Audi R8',
                    ]);
                }
            }    
            if($AuthUser){
                $userToken = JWTAuth::fromUser($AuthUser);
                $User = Provider::with('service', 'device')->find($AuthUser->id);
                if($User->device) {
                    ProviderDevice::where('id',$User->device->id)->update([
                        
                        'udid' => $request->device_id,
                        'token' => $request->device_token,
                        'type' => $request->device_type,
                    ]);
                    
                } else {
                    ProviderDevice::create([
                        'provider_id' => $User->id,
                        'udid' => $request->device_id,
                        'token' => $request->device_token,
                        'type' => $request->device_type,
                    ]);
                }
                return response()->json([
                            "status" => true,
                            "token_type" => "Bearer",
                            "access_token" => $userToken,
                            'currency' => Setting::get('currency', '$'),
                            'sos' => Setting::get('sos_number', '911')
                        ]);
            }else{
                return response()->json(['status'=>false,'message' => "Invalid credentials!"]);
            }  
        } catch (Exception $e) {
            return response()->json(['status'=>false,'message' => trans('api.something_went_wrong')]);
        }
    }


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function refresh_token(Request $request)
    {

        Config::set('auth.providers.users.model', 'App\Provider');

        $Provider = Provider::with('service', 'device')->find(Auth::user()->id);

        try {
            if (!$token = JWTAuth::fromUser($Provider)) {
                return response()->json(['error' => 'Unauthenticated'], 401);
            }
        } catch (JWTException $e) {
            return response()->json(['error' => 'Something went wrong'], 500);
        }

        $Provider->access_token = $token;

        return response()->json($Provider);
    }
    
    
    public function store_login(Request $request){
        //dd('hiii');
        /*$this->validate($request, [
            'device_id'=>'required',
            'device_token'=>'required',
            'device_type'=>'required|in:android,ios',           
            'email' => 'required|email|max:255',           
            'password' => 'required|min:6',
            
        ]);*/

    try{  

        $user = StoreUser::where('email',$request->email)->first();
        if(!$user){             
            return response()->json([
                'message' => 'please enter valid credentials'
            ], 422);             
        }

        StoreUser::where('id',$user->id)->update(['device_id' => $request->device_id,'device_type' =>$request->device_type,'device_token' =>$request->device_token]);
        

        $tokenResult = $user->createToken('Personal Access Token');
        $token = $tokenResult->token;

        $userToken = $tokenResult->accessToken;

        if ($request->remember_me)
        $token->expires_at = Carbon::now()->addWeeks(1);

        $token->save();

        return response()->json([
            'access_token' => $tokenResult->accessToken,
            'token_type' => 'Bearer',
            'store_user_id'=>$user->id,
            'expires_at' => Carbon::parse(
                $tokenResult->token->expires_at
            )->toDateTimeString(),
         'msg'=>'Successfully Login'
        ]);



     }catch (Exception $e) {
                return response()->json(['error' => trans('api.something_went_wrong')]);
            }

        }


    public function login(Request $request){

         $this->validate($request, [
                'device_id' => 'required',
                'device_type' => 'required|in:android,ios',
                'device_token' => 'required',
                'mobile' => 'required',
                'password' => 'required|min:6',
            ]);

        Config::set('auth.providers.users.model', 'App\Provider');

            $credentials = $request->only('mobile', 'password');
        
        try {
            $User = Provider::where('mobile',$request->mobile)
            ->orWhere('mobile','like','%'.$request->mobile)
            ->first();
            if ($User && \Hash::check($request->password, $User->password))
            {
                $token = JWTAuth::fromUser($User);
                Auth::login($User);
            }else{
                return response()->json(['error' => 'The mobile or password you entered is incorrect.'], 401);
            }
            
            } catch (JWTException $e) {
                return response()->json(['error' => 'Something went wrong, Please try again later!'], 500);
            }

        $User = Provider::with('service', 'device')->find(Auth::user()->id);

        
        $User->access_token = $token;
        
        $User->currency = Setting::get('currency', '$');
        $User->sos = Setting::get('sos_number', '911');

        if($User->device) {
            ProviderDevice::where('id',$User->device->id)->update([
        
                'udid' => $request->device_id,
                'token' => $request->device_token,
                'type' => $request->device_type,
            ]);
            
        } else {
            ProviderDevice::create([
                    'provider_id' => $User->id,
                    'udid' => $request->device_id,
                    'token' => $request->device_token,
                    'type' => $request->device_type,
                ]);
        }

        return response()->json($User);
    }
}
