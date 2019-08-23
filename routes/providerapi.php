<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Authentication
Route::post('/register' , 'ProviderAuth\TokenController@register');
Route::post('/oauth/token' , 'ProviderAuth\TokenController@authenticate');
Route::post('/login' , 'ProviderAuth\TokenController@login');

Route::post('/logout' , 'ProviderAuth\TokenController@logout');

Route::post('/auth/facebook', 'ProviderAuth\TokenController@facebookViaAPI');
Route::post('/auth/google', 'ProviderAuth\TokenController@googleViaAPI');

Route::post('/forgot/password',     'ProviderAuth\TokenController@forgot_password');
Route::post('/reset/password',      'ProviderAuth\TokenController@reset_password');

Route::get('/services' , 'ProviderResources\TripController@services');
Route::get('/getSubServices' , 'ProviderResources\TripController@getSubServices');
Route::get('/vehicle_type' , 'ProviderResources\TripController@vehicle_type');

Route::get('/getSubCatServices' , 'ProviderResources\TripController@getSubCatServices');
Route::get('/getCountry' , 'ProviderResources\TripController@getCountry');
Route::get('/time/list' , 'ProviderResources\TripController@getAvailableTime');

Route::get('/getInvoice/{id}','ProviderResources\TripController@getInvoice');


Route::get('/money/transfer_to_in_bank' , 'PaymentController@transferMoney');

    Route::get('/rating_data' , 'ProviderResources\TripController@rating_level'); 
    Route::get('/membership/activation' , 'ProviderResources\TripController@getActivationMembership');
    Route::get('/membership/mail' , 'ProviderResources\TripController@sendEmailReminder');
    Route::group(['middleware' => ['provider.api']], function () {

    Route::post('/refresh/token' , 'ProviderAuth\TokenController@refresh_token');

    Route::group(['prefix' => 'profile'], function () {

        Route::get ('/' , 'ProviderResources\ProfileController@index');
        Route::post('/' , 'ProviderResources\ProfileController@update');
        Route::post('/password' , 'ProviderResources\ProfileController@password');
        Route::post('/location' , 'ProviderResources\ProfileController@location');
        Route::post('/available' , 'ProviderResources\ProfileController@available');

    });

    Route::get('/target' , 'ProviderResources\ProfileController@target');
    Route::resource('trip', 'ProviderResources\TripController');
    Route::post('cancel', 'ProviderResources\TripController@cancel');
    Route::post('summary', 'ProviderResources\TripController@summary');
    Route::get('help', 'ProviderResources\TripController@help_details');

    Route::group(['prefix' => 'trip'], function () {

        Route::post('{id}', 'ProviderResources\TripController@accept');
        Route::post('{id}/rate', 'ProviderResources\TripController@rate');
        Route::post('{id}/message' , 'ProviderResources\TripController@message');

    });

    Route::group(['prefix' => 'requests'], function () {

        Route::get('/upcoming' , 'ProviderResources\TripController@scheduled');
        Route::get('/history', 'ProviderResources\TripController@history');
        Route::get('/history/details', 'ProviderResources\TripController@history_details');
        Route::get('/upcoming/details', 'ProviderResources\TripController@upcoming_details');
        Route::post('/prescription' , 'ProviderResources\TripController@madeReview');
        Route::get('/stopWork' , 'ProviderResources\TripController@stopWork');

    });
    
    Route::post('/trips/sendsms' , 'ProviderResources\TripController@sendSMSToUser');
    Route::post('/trips/getsms' , 'ProviderResources\TripController@get_all_sms_provider');
    Route::post('/trips/getsms/recent' , 'ProviderResources\TripController@get_recent_sms_provider');

    Route::post('/trips/signature' , 'ProviderResources\TripController@set_signatureImg');
    Route::post('/trips/prescrition' , 'ProviderResources\TripController@set_prescrition');

    //chat

    Route::get('/firebase/getChat' , 'ProviderResources\TripController@getChat');
    
    Route::get('/firebase/chatHistory' , 'FirebaseController@chatHistoryProvider');

    Route::get('/account/new' , 'ProviderResources\TripController@new_account');
    
    Route::get('/account/switch' , 'ProviderResources\TripController@account_switch');

    Route::get('/video/call' , 'ProviderResources\TripController@videoCall_user');

   Route::get('/account/list' , 'ProviderResources\TripController@account_switch_list');
  
   Route::get('/addBank' , 'PaymentController@addBankAccount');
   Route::get('/BankList' , 'PaymentController@BankList');
   Route::get('/withdrawalRequest' , 'ProviderResources\TripController@withdrawalRequest');
   
   Route::get('/withdrawaList' , 'ProviderResources\TripController@withdrawRequestList');

  Route::get('/document/list' , 'ProviderResources\TripController@documentList');

  Route::post('/document/upload' , 'ProviderResources\TripController@uploadDocument');

  Route::get('/getTimer','ProviderResources\TripController@trackTimer');

  Route::post('/profileVideo' , 'ProviderResources\TripController@profile_video');

  Route::get('/document/checkDocument' , 'ProviderResources\DocumentController@checkDocument'); //check if document has

  Route::get('/membership/list' , 'ProviderResources\TripController@getMembershipList');
   
  Route::get('/membership/activation' , 'ProviderResources\TripController@getActivationMembership');
  
  Route::get('/lang/select' , 'ProviderResources\TripController@getLang');

  Route::get('/list/invitations' , 'ProviderResources\TripController@getInvitationsList');
  
  Route::post('/send/invitations' , 'ProviderResources\TripController@sendInvitations');

});