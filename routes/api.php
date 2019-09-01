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

Route::post('/login', 'UserApiController@login');

Route::post('/store/login', 'ProviderAuth\TokenController@store_login');

Route::post('/signup' , 'UserApiController@signup');
Route::post('/store/signup' , 'ProviderAuth\TokenController@store_register');
Route::post('/logout' , 'UserApiController@logout');

Route::post('/auth/facebook', 'Auth\SocialLoginController@facebookViaAPI');
Route::post('/auth/google', 'Auth\SocialLoginController@googleViaAPI');

Route::post('/forgot/password',     'UserApiController@forgot_password');
Route::post('/reset/password',      'UserApiController@reset_password');
Route::get('/request/careTaker_fare' , 'UserApiController@careTaker_fare');	

Route::get('/providerFullDetails','UserApiController@providerFullDetails');

Route::get('/testPay','PaymentController@testPay');

Route::get('/getInvoice/{id}','UserApiController@getInvoice');

Route::get('/test','UserApiController@test');


Route::get('/paypal/auth','UserApiController@paypalAuth');

Route::get('/paypal/payment','UserApiController@paypalPayment');

Route::get('/paypal/list','UserApiController@paypalListPayment');

Route::get('/paypal/showPaymentdetails','UserApiController@paypalShowPayment');

Route::get('/paypal/ApprovePayment','UserApiController@paypalApprovePayment');

Route::group(['middleware' => ['auth:api']], function () {	
	//Bookmarks 
	
	Route::get('/getCareTaker/list' ,'UserApiController@getCaretakerList');
	Route::get('/getBookmark/list' ,'UserApiController@getBookmarkList');
	Route::post('/postBookmark' ,'UserApiController@postBookmark');
	// user profile

	Route::post('/change/password' , 'UserApiController@change_password');

	Route::post('/update/location' , 'UserApiController@update_location');

	Route::get('/details' , 'UserApiController@details');

	Route::post('/update/profile' , 'UserApiController@update_profile');
	// services 

	Route::get('/services' , 'UserApiController@services');
        Route::get('/getProviderDetails' , 'UserApiController@getProviderDetails');

	// provider

	Route::post('/rate/provider' , 'UserApiController@rate_provider');
	// request

	Route::post('/send/request' , 'UserApiController@send_request');
    Route::post('/send/request_for_careTaker' , 'UserApiController@request_for_careTaker');

	Route::post('/cancel/request' , 'UserApiController@cancel_request');
	
	Route::get('/request/check' , 'UserApiController@request_status_check');
	Route::get('/request/check/data' , 'UserApiController@request_status_check_data');

	Route::get('/show/providers' , 'UserApiController@show_providers');          
       //gps
       
    Route::post('/getGpsLocation' , 'UserApiController@gpsLocation');
	// history

	Route::get('/trips' , 'UserApiController@trips');
	Route::get('upcoming/trips' , 'UserApiController@upcoming_trips');

	Route::get('/current_trips' , 'UserApiController@Currenttrips');	
	
	Route::get('/trip/details' , 'UserApiController@trip_details');
	Route::get('upcoming/trip/details' , 'UserApiController@upcoming_trip_details');
	// payment

	//Route::post('/payment' , 'PaymentController@payment');

    Route::post('/payment' , 'PaymentController@confirm_payment');
	Route::post('/add/money' , 'PaymentController@add_money');
	// estimated

	Route::get('/estimated/fare' , 'UserApiController@estimated_fare');
    Route::get('/estimated/time' , 'UserApiController@estimated_time');
	// help

	Route::get('/help' , 'UserApiController@help_details');
	// promocode

	Route::get('/promocodes' , 'UserApiController@promocodes');
	Route::post('/promocode/add' , 'UserApiController@add_promocode');
	// card payment

    Route::resource('card', 'Resource\CardResource');
    Route::post('/trips/sendsms' , 'ProviderResources\TripController@sendSMSToProvider');
    Route::post('/trips/getsms' , 'ProviderResources\TripController@get_all_sms_user');
    Route::post('/trips/getsms/recent' , 'ProviderResources\TripController@get_recent_sms_user');

    Route::post('/insurance' , 'UserApiController@insertInsurance');

    Route::get('/insurance/{insuranceId?}' , 'UserApiController@getAllInsurance');
    Route::get('/getInsurance/list' , 'UserApiController@getInsuranceList');
    Route::get('/getSubServices','UserApiController@majoRservicesSubList');    
    Route::get('/item/list','UserApiController@item_list');
   	//chat

	Route::get('/firebase/getChat' , 'FirebaseController@getChat');

	Route::get('/firebase/chatHistory' , 'FirebaseController@chatHistory');
	Route::get('/getChatTest','FirebaseController@getChatTest');

	Route::get('/services/list','UserApiController@majoRservices');

	Route::get('/video/call' , 'UserApiController@videoCall_user');

	Route::get('/requests/stopWork' , 'UserApiController@stopWork');

	Route::get('/makeCard_default','PaymentController@makeCard_default');

	Route::get('/payment/now','PaymentController@payment_before_request');

	Route::get('/getTimer','UserApiController@trackTimer');

	Route::get('/ur_offer','UserApiController@ur_offer');

	Route::get('/lang/select' , 'UserApiController@getLang');

	Route::get('/cart/item' , 'UserApiController@addCart');

	Route::get('/cart/view' , 'UserApiController@viewCart');

	//   Route::get('/artist/live' , 'UserApiController@artistLive');

	Route::get('/most_searchable' , 'UserApiController@mostSearchable');

	Route::get('/search/item' , 'UserApiController@search_item');

	Route::post('/courierInfo' , 'UserApiController@courierInfo');

	Route::get('/courier_estimate_fare' , 'UserApiController@estimated_fare_courier');
	//STORE USER ////////////////

	Route::post('/createDefaultLocation' , 'UserApiController@createDefaultLocation');

	Route::get('/review' , 'UserApiController@review');
  
});


 Route::group(['prefix' => 'storeUser'], function () {

	Route::get('/details' , 'StoreController@details');
	Route::post('/addItem' , 'StoreController@addItem');
	Route::post('/editItem' , 'StoreController@editItem');
	Route::get('/itemList' , 'StoreController@itemList');
	Route::get('/liveRequest' , 'StoreController@liveRequest');
	Route::get('/cancelItemRequest' , 'StoreController@cancelItemRequest');
	Route::get('/acceptItemRequest' , 'StoreController@acceptItemRequest');
	Route::get('/item/category' , 'StoreController@item_category');	
	
	Route::post('/update/profile' , 'StoreController@update_profile');
	Route::post('/update/businessdetails' , 'StoreController@updateBusinessDetails');
	Route::get('/businessdetails' , 'StoreController@getBusinessDetails');
	Route::get('/revenue' , 'StoreController@revenue');	
	
	// Store History
	Route::get('/history/orderhistory', 'StoreController@orderHistory'); 
	Route::get('/history/ordertodayhistory', 'StoreController@orderTodayHistory');
	Route::get('/help' , 'UserApiController@help_details');
	Route::get('/saleSummary' , 'StoreController@saleSummary');	
	
});



