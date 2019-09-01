<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\SendPushNotification;

use Stripe\Charge;
use Stripe\Stripe;
use Stripe\StripeInvalidRequestError;

use Auth;
use Setting;
use Exception;

use App\Card;
use App\User;
use App\UserRequests;
use App\UserRequestPayment;
use App\Provider;
use App\Insurances;
use App\Settings;

use App\BankAccount;
use App\WithdrawalMoney;


class PaymentController extends Controller
{
       /**
     * payment for user.
     *
     * @return \Illuminate\Http\Response
     */

    public function testPay(){

     Stripe::setApiKey(Setting::get('stripe_secret_key'));

$charge = Charge::create([
    'amount' => 621*100,
    'currency' => 'usd',
    'source' => 'tok_visa',
    'receipt_email' => 'rakesh@97pixels.com',
]);

return $charge;
     }

    public function payment(Request $request)
    {
        $this->validate($request, [
                'request_id' => 'required|exists:user_request_payments,request_id|exists:user_requests,id,paid,0,user_id,'.Auth::user()->id
            ]);


        $UserRequest = UserRequests::find($request->request_id);

        if($UserRequest->payment_mode == 'CARD') {

            $RequestPayment = UserRequestPayment::where('request_id',$request->request_id)->first(); 

            $StripeCharge = $RequestPayment->total * 100;

            try {

                $Card = Card::where('user_id',Auth::user()->id)->where('is_default',1)->first();

                Stripe::setApiKey(Setting::get('stripe_secret_key'));

                $Charge = Charge::create(array(
                      "amount" => $StripeCharge,
                      "currency" => "usd",
                      "customer" => Auth::user()->stripe_cust_id,
                      "card" => $Card->card_id,
                      "description" => "Payment Charge for ".Auth::user()->email,
                      "receipt_email" => Auth::user()->email
                    ));

                $RequestPayment->payment_id = $Charge["id"];
                $RequestPayment->payment_mode = 'CARD';
                $RequestPayment->save();

                $UserRequest->paid = 1;
                $UserRequest->status = 'COMPLETED';
                $UserRequest->save();

                if($request->ajax()) {
                   return response()->json(['message' => trans('api.paid')]); 
                } else {
                    return redirect('dashboard')->with('flash_success','Paid');
                }

            } catch(StripeInvalidRequestError $e){
                if($request->ajax()){
                    return response()->json(['error' => $e->getMessage()], 500);
                } else {
                    return back()->with('flash_error', $e->getMessage());
                }
            } catch(Exception $e) {
                if($request->ajax()){
                    return response()->json(['error' => $e->getMessage()], 500);
                } else {
                    return back()->with('flash_error', $e->getMessage());
                }
            }
        }
    }

   public function makeCard_default(Request $request){

    $this->validate($request, [
                'card_id' => 'required',
            ]);
   $r = Card::where('user_id',Auth::user()->id)->where('is_default',1)->get();
  
  if(count($r)!=0){
  Card::where('id',$r[0]->id)->update(['is_default'=>0]);
  }
  
  Card::where('id',$request->card_id)->update(['is_default'=>1]);
 
     return response()->json(['status'=>1,'msg'=>' default card']);  
     }


   public function payment_before_request(Request $request) {
	   
		$this->validate($request, [
                'total_amount'	=> 'required',
				'req_id'		=> 'required|numeric',
            ]);
		
		
		try {
			
			if( Auth::user()->status == 0) {
	
				$User	= Auth::user();
				$User->status = 1;
				$User->save();
				
				$msg = 'You have succefully paid money for this request';
				$status = 1;
				
			} else {
				
				$msg = 'You have already paid money for this request';
				$status = 0;
			}

			if( $request->has('req_id') && $request->req_id > 0 ) {
		
				$UserRequest = UserRequests::where('id', $request->req_id)->first();
					
				if( $UserRequest->status == 'AWAITING' ) {
					$UserRequest->status = 'STARTED';
					$UserRequest->save();
				
					(new SendPushNotification)->RideConfirmedToProvider($UserRequest);
				}
			}
	
			return response()->json(['status'=>$status,'message' => $msg]); 

		} catch(Exception $e) {
		
			return response()->json(['error' => $e->getMessage()], 500);

		}
    }

   public function payment_before_request_COPY(Request $request)
    {


             $this->validate($request, [
                'total_amount' => 'required',
            ]);
        
             Stripe::setApiKey(Setting::get('stripe_secret_key'));

             $StripeCharge = $request->total_amount*100; //100 make like 621*100 = 621.00
       

            try {

                $Card = Card::where('user_id',Auth::user()->id)->where('is_default',1)->first();

                Stripe::setApiKey(Setting::get('stripe_secret_key'));

                 $Charge = Charge::create(array(
                      "amount" => $StripeCharge,
                      "currency" => "usd",
                      "customer" => Auth::user()->stripe_cust_id,
                      "card" => $Card->card_id,
                      "description" => "Payment Charge for ".Auth::user()->email,
                      "receipt_email" => Auth::user()->email
                    ));

    // We are updating total_amount Price in wallet balance due to before request process after completed take same price from wallet

                //status 0 means user not paid for ride

               $totalBalance = Auth::user()->wallet_balance;
               


                $totalBalance += $request->total_amount;

          $data = [ "wallet_balance" => $totalBalance ,'status'=>1]; //payment added to in wallet status=2
           
              
              User::where('id',Auth::user()->id)->update($data);



                if($request->ajax()) {
                   return response()->json(['status'=>1,'message' => trans('api.paid')]); 
                } else {
                    return redirect('dashboard')->with('flash_success','Paid');
                }

              
            


            } catch(StripeInvalidRequestError $e){
                if($request->ajax()){
                    return response()->json(['error' => $e->getMessage()], 500);
                } else {
                    return back()->with('flash_error', $e->getMessage());
                }
            } 
        
    }


    /**
     * add wallet money for user.
     *
     * @return \Illuminate\Http\Response
     */
    public function add_money(Request $request){

        $this->validate($request, [
                'amount' => 'required|integer',
                'card_id' => 'required|exists:cards,card_id,user_id,'.Auth::user()->id
            ]);

        try{
            
            $StripeWalletCharge = $request->amount * 100;

            Stripe::setApiKey(Setting::get('stripe_secret_key'));

            $Charge = Charge::create(array(
                  "amount" => $StripeWalletCharge,
                  "currency" => "usd",
                  "customer" => Auth::user()->stripe_cust_id,
                  "card" => $request->card_id,
                  "description" => "Adding Money for ".Auth::user()->email,
                  "receipt_email" => Auth::user()->email
                ));

            $update_user = User::find(Auth::user()->id);
            $update_user->wallet_balance += $request->amount;
            $update_user->save();

            Card::where('user_id',Auth::user()->id)->update(['is_default' => 0]);
            Card::where('card_id',$request->card_id)->update(['is_default' => 1]);

            //sending push on adding wallet money
            (new SendPushNotification)->WalletMoney(Auth::user()->id,currency($request->amount));

            if($request->ajax()){
                return response()->json(['message' => currency($request->amount).trans('api.added_to_your_wallet'), 'user' => $update_user]); 
            } else {
                return redirect('wallet')->with('flash_success',currency($request->amount).' added to your wallet');
            }

        } catch(StripeInvalidRequestError $e) {
            if($request->ajax()){
                 return response()->json(['error' => $e->getMessage()], 500);
            }else{
                return back()->with('flash_error',$e->getMessage());
            }
        } 
    }


public function confirm_payment(Request $request){

    //request_id 
        
         $this->validate($request, [
                'request_id' => 'required',
                'total_payment' => 'required'
            ]);



      $UserRequest = UserRequests::where('id',$request->request_id)->first();
      $provider = Provider::where('id',$UserRequest->provider_id)->first();
     
      $settings = Settings::where('key','tax_percentage')->first();
       $uEarn = User::where('id',$UserRequest->user_id)->first();

       if($UserRequest->provider_service_type == 'CARETAKER'){

      if(Auth::user()->status == 1){
        
        $insurance = Insurances::where('insurance_id',$UserRequest->insurance_id)->first();

        $earning_money = $UserRequest->service_hour;

       $uEarn->earning_money += $earning_money;  

       User::where('id',$UserRequest->user_id)->update(['earning_money'=>$uEarn->earning_money]);
      


       $deduct_balance = ($uEarn->wallet_balance - $request->total_payment);
       User::where('id',$UserRequest->user_id)->update(['wallet_balance'=>$deduct_balance,'status'=>0]);
       UserRequests::where('id',$request->request_id)->update(['status'=>'COMPLETED','paid'=>1]);

        $msg = 'successfully payment taken from your wallet';
          $status = 1;
         } else {   $msg = 'already payment taken from your wallet';
          $status = 0; }
      }


     if($UserRequest->provider_service_type != 'CARETAKER'){


     if(Auth::user()->status == 1){
        
    

       $deduct_balance = ($uEarn->wallet_balance - $request->total_payment);
       User::where('id',$UserRequest->user_id)->update(['wallet_balance'=>$deduct_balance,'status'=>0]);
       UserRequests::where('id',$request->request_id)->update(['status'=>'COMPLETED','paid'=>1]);

        $msg = 'successfully payment taken from your wallet';
          $status = 1;
         } else {   $msg = 'already payment taken from your wallet';
          $status = 0; }
     

     }
 
     
       
     

       return response()->json(['status'=>$status,'msg'=>$msg]);

     }

     public function transferMoney(Request $request){

      $this->validate($request, [
                'provider_id' => 'required|int',
                'amount' => 'required',
                'b_token' => 'required',  //bank token btok_we32e3
                'bank_account' => 'required|int'
            ]);


    Stripe::setApiKey(Setting::get('stripe_secret_key'));




// $payout = \Stripe\Payout::create(array(
//   "amount" => 10, // amount in cents
//   "currency" => "usd",
//   "recipient" => $recipient_id,
//   "bank_account" => $bank_account_id,
//   "statement_descriptor" => "JULY SALES")
// );

// return $payout;

return response()->json(['status'=>1,'msg'=>'withdrawal is pending .we ll send you confirmation mail within 48 hours','data'=>$request->all()]);


// $customer = \Stripe\Customer::retrieve("cus_DltjDFRhKRBoBk");
// return $customer->sources->create(array("source" => "btok_1DKLwUBwvg13sjFq0oydeVGA"));



     }

public function addBankAccount(Request $request){

   $this->validate($request, [
               'provider_id' => 'required|int',
                'account_name' => 'required',
                'account_number' => 'required|int',  //bank token btok_we32e3
                'routing_number' => 'required|int',
                'country' => 'required',
                'currency' => 'required',
                'bank_name' => 'required',
            ]);


  $find = BankAccount::where('provider_id',$request->provider_id)->count();
  if($find == 0){

   $r = BankAccount::Create($request->all()); 
   
    $status = 1;
  }else{

   $status = 0; $r = 0; }

   
   
   return response()->json(['status'=>$status,'data'=>$r]);
  
}


public function BankList(Request $request){

  

  

  $find = BankAccount::where('provider_id',Auth::user()->id)->count();
  if($find != 0){

    $r = BankAccount::where('provider_id',Auth::user()->id)->get(); 
    $status = 1;
  }else{

   $status = 0; $r = 0; }

   
   
   return response()->json(['status'=>$status,'data'=>$r]);
  
}


 

}
