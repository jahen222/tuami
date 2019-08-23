<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount;
use App\Http\Controllers\SendPushNotification;
use App\Chat;
use Auth;
use App\User;
use App\UserRequests;
use App\Provider;
use DB;
class FirebaseController extends Controller
{
    public function msg()
    {
        // This assumes that you have placed the Firebase credentials in the same directory
// as this PHP file.
$serviceAccount = ServiceAccount::fromJsonFile(__DIR__.'/firebase.json');

$firebase = (new Factory)
    ->withServiceAccount($serviceAccount)
    // The following line is optional if the project id in your credentials file
    // is identical to the subdomain of your Firebase project. If you need it,
    // make sure to replace the URL with the URL of your project.
    ->withDatabaseUri('https://laravel-420a9.firebaseio.com/')
    ->create();

   $database = $firebase->getDatabase();

   $newPost = $database
    ->getReference('chats')
    ->set([
        'client_msg' => 'Post title',
    ]);


	
		
	
	 }


 public function getChatTest(Request $request){

        $this->validate($request, [
                'request_id' => 'required',              
            ]);

         
          $UserRequest = UserRequests::with('user')->findOrFail($request->request_id);

                if($request->has('message') && $request->has('provider_id') && $request->has('user_id') && $request->has('type')){

                  //push notification
              #(new SendPushNotification)->chatNotifyProvider($UserRequest->provider_id,$request->message,$request->request_id);

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
     
	 public function getChat(Request $request){

        $this->validate($request, [
                'request_id' => 'required',              
            ]);

      
       //   $UserRequest = UserRequests::with('user')->findOrFail($request->request_id);

        $userName = Auth::user()->first_name.' '.Auth::user()->last_name;

                if($request->has('message') && $request->has('provider_id') && $request->has('user_id') && $request->has('type')){

                  //push notification
              (new SendPushNotification)->chatNotifyProvider($request->provider_id,$request->message,$request->request_id,$userName);

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


	      public function chatHistory(Request $request){
             
               $sub = Chat::orderBy('id','DESC');
	      $r = Chat::where('user_id',\Auth::id())->groupBy('request_id')->orderby('id', 'desc')->get();
         

             
/*
               $r = DB::table(DB::raw("({$sub->toSql()}) as sub"))
              ->where('user_id',\Auth::id())
              ->groupBy('request_id')
               ->get();             
                     
               return  $r;
           */ 
              
/*
$sql = 'SELECT * FROM (SELECT * FROM chats ORDER BY id DESC) as sub GROUP BY request_id';

 $result= DB::SELECT($sql);

return (array)$result;
*/


                  foreach($r as $key=>$value){
                     
                      $r[$key]['provider'] =  Provider::select('first_name','last_name','avatar')->where('id',$value->provider_id)->get();
                                    }

	   	return response()->json(['status'=>1,"data"=>$r]);

	 }

          
         public function chatHistoryProvider(Request $request){

	 	$r = Chat::where('provider_id',\Auth::id())->groupBy('request_id')->get();
                  foreach($r as $key=>$value){
                      
                      $r[$key]['provider'] = User::select('first_name','last_name','picture')->where('id',$value->user_id)->get();
                                    }

	   	return response()->json(['status'=>1,"data"=>$r]);

	 }


}
