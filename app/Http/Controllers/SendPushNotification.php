<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\ProviderDevice;
use Exception;

class SendPushNotification extends Controller
{
	/**
     * New Ride Accepted by a Driver.
     *
     * @return void
     */
    public function RideAccepted($request, $amount) {

    	return $this->sendPushToUser($request->user_id, trans('api.push.request_accepted', ['amount' => $amount ]));
    }
	
	
	public function RideConfirmedToProvider($request) {

    	   return $this->sendPushToProvider($request->provider_id, trans('api.push.user_confirmed'));
    }
	
	
	
    public function chatNotify($userID,$msg,$request_id,$username){      //push notification to user
       
        return $this->sendPushToUser($userID,$msg,'chat',$request_id,$username);
    }

    public function chatNotifyProvider($providerID,$msg,$request_id,$username){    //push notification to provider
       
        return $this->sendPushToProvider($providerID,$msg,'chat',$request_id,$username);
    }

   
  public function videoNotify($userID,$msg,$request_id){      //push notification to user
       
        return $this->sendPushToUser($userID,$msg,'Videochat',$request_id);
    }

    
   public function videoNotifyProvider($providerID,$msg,$request_id){    //push notification to provider
       
        return $this->sendPushToProvider($providerID,$msg,'Videochat',$request_id);
    }



    /**
     * Driver Arrived at your location.
     *
     * @return void
     */
    public function user_schedule($user){

        return $this->sendPushToUser($user, trans('api.push.schedule_start'));
    }

    /**
     * New Incoming request
     *
     * @return void
     */
    public function provider_schedule($provider){

        return $this->sendPushToProvider($provider, trans('api.push.schedule_start'));

    }

    /**
     * New Ride Accepted by a Driver.
     *
     * @return void
     */
    public function UserCancellRide($request){

        return $this->sendPushToProvider($request->provider_id, trans('api.push.user_cancelled'));
    }


    /**
     * New Ride Accepted by a Driver.
     *
     * @return void
     */
    public function ProviderCancellRide($request){

        return $this->sendPushToUser($request->user_id, trans('api.push.provider_cancelled'));
    }

    /**
     * Driver Arrived at your location.
     *
     * @return void
     */
    public function Arrived($request){

        return $this->sendPushToUser($request->user_id, trans('api.push.arrived'));
    }

     public function Pickedup($request){

        return $this->sendPushToUser($request->user_id, trans('api.push.pickedup'));
    }

    
    public function Stopped($request){

        return $this->sendPushToUser($request->user_id, trans('api.push.stopped'));
    }

    public function Signature($request){

        return $this->sendPushToUser($request->user_id, trans('api.push.signature'));
    }



    /**
     * Money added to user wallet.
     *
     * @return void
     */
    public function ProviderNotAvailable($user_id){

        return $this->sendPushToUser($user_id,trans('api.push.provider_not_available'));
    }

    /**
     * New Incoming request
     *
     * @return void
     */
    public function IncomingRequest($provider){
      
        return $this->sendPushToProvider($provider, trans('api.push.incoming_request'));

    }
    
    /**
     * SMS send to provider
     *
     * @return void
     */
    public function smsSendToProvider($message){
      
        return $this->sendPushToProvider($message->provider_id,$message->message,'chat');

    }

    /**
     * SMS send to user
     *
     * @return void
     */
    public function smsSendToUser($user){
      
        return $this->sendPushToUser($user->user_id,$user->message,'chat');

    }

    /**
     * Driver Documents verfied.
     *
     * @return void
     */
    public function DocumentsVerfied($provider_id){

        return $this->sendPushToProvider($provider_id, trans('api.push.document_verfied'));
    }


    /**
     * Money added to user wallet.
     *
     * @return void
     */
    public function WalletMoney($user_id, $money){

        return $this->sendPushToUser($user_id, $money.' '.trans('api.push.added_money_to_wallet'));
    }

    /**
     * Money charged from user wallet.
     *
     * @return void
     */
    public function ChargedWalletMoney($user_id, $money){

        return $this->sendPushToUser($user_id, $money.' '.trans('api.push.charged_from_wallet'));
    }

      

    /**
     * Sending Push to a user Device.
     *
     * @return void
     */
    public function sendPushToUser($user_id, $push_message,$msg_type = "",$request_id="",$username=""){

    	try{

	    	$user = User::findOrFail($user_id);

            
            if($user->device_token != ""){

    	    	if($user->device_type == 'ios'){

    	    		return \PushNotification::app('IOSUser')
    		            ->to($user->device_token)
    		            ->send($push_message,array('custom'=>array('request_id'=>$request_id,'msg_type'=>$msg_type,'provider_id'=>$provider_id,'user_name'=>$username)));

    	    	}elseif($user->device_type == 'android'){
    	    		
    	    		return \PushNotification::app('AndroidUser')
    		            ->to($user->device_token)
    		           ->send($push_message,array('msg_type' => $msg_type,'request_id'=>$request_id,'user_name'=>$username));

    	    	}
            }

    	} catch(Exception $e){
    		return $e;
    	}

    }

    /**
     * Sending Push to a user Device.
     *
     * @return void
     */
    public function sendPushToProvider($provider_id, $push_message,$msg_type = "",$request_id="",$username=""){

    	try{
            $provider = ProviderDevice::where('provider_id',$provider_id)->first();

            if($provider->token != ""){

            	if($provider->type == 'ios'){
            	
            		return \PushNotification::app('IOSProvider')
        	            ->to($provider->token)
        	            ->send($push_message,array('custom'=>array('request_id'=>$request_id,'msg_type'=>$msg_type,'provider_id'=>$provider_id,'user_name'=>$username)));

            	}elseif($provider->type == 'android'){
            		
            		return \PushNotification::app('AndroidProvider')
        	            ->to($provider->token)
        	            ->send($push_message,array('msg_type' => $msg_type,'request_id'=>$request_id,'user_name'=>$username));

            	}
            }

    	} catch(Exception $e){
    		return $e;
    	}

    }

}
