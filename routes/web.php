<?php

/*
|--------------------------------------------------------------------------
| User Authentication Routes
|--------------------------------------------------------------------------
*/

// Route::get('/privacy', function(){
//    return view('user.privacy');
// });

Route::get('/terms_app', 'JahenController@terms_app');
Route::get('/fees', 'JahenController@fees');
Route::get('/refund', 'JahenController@refund');
Route::get('/', 'JahenController@index1');
Route::get('/rideweb', 'JahenController@rideweb');

Auth::routes();

Route::get('auth/facebook', 'Auth\SocialLoginController@redirectToFaceBook');
Route::get('auth/facebook/callback', 'Auth\SocialLoginController@handleFacebookCallback');
Route::get('auth/google', 'Auth\SocialLoginController@redirectToGoogle');
Route::get('auth/google/callback', 'Auth\SocialLoginController@handleGoogleCallback');
Route::post('account/kit', 'Auth\SocialLoginController@account_kit')->name('account.kit');


/*
|--------------------------------------------------------------------------
| Provider Authentication Routes
|--------------------------------------------------------------------------
*/

Route::group(['prefix' => 'provider'], function () {

    Route::get('auth/facebook', 'Auth\SocialLoginController@providerToFaceBook');
    Route::get('auth/google', 'Auth\SocialLoginController@providerToGoogle');

    Route::get('/login', 'ProviderAuth\LoginController@showLoginForm');
    Route::post('/login', 'ProviderAuth\LoginController@login');
    Route::post('/logout', 'ProviderAuth\LoginController@logout');

    Route::get('/register', 'ProviderAuth\RegisterController@showRegistrationForm');
    Route::post('/register', 'ProviderAuth\RegisterController@register');

    Route::post('/password/email', 'ProviderAuth\ForgotPasswordController@sendResetLinkEmail');
    Route::post('/password/reset', 'ProviderAuth\ResetPasswordController@reset');
    Route::get('/password/reset', 'ProviderAuth\ForgotPasswordController@showLinkRequestForm');
    Route::get('/password/reset/{token}', 'ProviderAuth\ResetPasswordController@showResetForm');
});

Route::group(['prefix' => 'store'], function () {

    Route::get('auth/facebook', 'Auth\SocialLoginController@providerToFaceBook');
    Route::get('auth/google', 'Auth\SocialLoginController@providerToGoogle');

    Route::get('/login', 'StoreAuth\LoginController@showLoginForm');
    Route::post('/login', 'StoreAuth\LoginController@login');
    //Route::post('/logout', 'StoreAuth\LoginController@logout');

    Route::get('/register', 'StoreAuth\RegisterController@showRegistrationForm');
    Route::post('/register', 'StoreController@register');
    Route::post('/login', 'StoreController@login');

    Route::post('/password/email', 'StoreAuth\ForgotPasswordController@sendResetLinkEmail');
    Route::post('/password/reset', 'StoreAuth\ResetPasswordController@reset');
    Route::get('/password/reset', 'StoreAuth\ForgotPasswordController@showLinkRequestForm');
    Route::get('/password/reset/{token}', 'StoreAuth\ResetPasswordController@showResetForm');
    Route::get('/profile', 'StoreController@profile')->name('store.profile');
    Route::get('/password', 'StoreController@password')->name('store.password');
    Route::get('/help', 'StoreController@helps')->name('store.help');
    Route::post('/logout', 'StoreController@logout');
    Route::get('/dashboard', 'StoreController@dashboard')->name('store.dashboard');
    Route::get('/payment', 'StoreController@payment')->name('store.payment');
    Route::get('/statement', 'StoreController@statement')->name('store.statement');
    Route::get('/statement/provider', 'StoreController@statement_provider')->name('store.statement.provider');
    Route::get('/statement/today', 'StoreController@statement_today')->name('store.statement.today');
    Route::get('/statement/monthly', 'StoreController@statement_monthly')->name('store.statement.monthly');
    Route::get('/statement/yearly', 'StoreController@statement_yearly')->name('store.statement.yearly');
    Route::get('/requests', 'StoreController@request')->name('store.requests.index');
    Route::get('/show/{id}', 'StoreController@show')->name('store.requests.show');
    Route::delete('/destroy/{id}', 'StoreController@destroy')->name('store.requests.destroy');
    Route::get('/selling', 'StoreController@selling')->name('store.selling.index');
    Route::get('/create', 'StoreController@create')->name('store.selling.create');
    Route::delete('/selling_destroy/{id}', 'StoreController@selling_destroy')->name('store.selling.destroy');
    Route::get('/edit/{id}', 'StoreController@selling_edit')->name('store.selling.edit');
    Route::any('/update/{id}', 'StoreController@selling_update')->name('store.selling.update');
    Route::any('/store', 'StoreController@selling_store')->name('store.selling.store');
    Route::get('/selling', 'StoreController@selling')->name('store.selling.index');
    Route::get('/create', 'StoreController@create')->name('store.selling.create');
    Route::delete('/selling_destroy/{id}', 'StoreController@selling_destroy')->name('store.selling.destroy');
    Route::get('/edit/{id}', 'StoreController@selling_edit')->name('store.selling.edit');
    Route::any('/update/{id}', 'StoreController@selling_update')->name('store.selling.update');
    //Route::any('/document', 'StoreController@selling_store')->name('store.document.index');
});
/*
|--------------------------------------------------------------------------
| Admin Authentication Routes
|--------------------------------------------------------------------------
*/

Route::group(['prefix' => 'admin'], function () {
    Route::get('/login', 'AdminAuth\LoginController@showLoginForm');
    Route::post('/login', 'AdminAuth\LoginController@login');
    Route::post('/logout', 'AdminAuth\LoginController@logout');

    Route::post('/password/email', 'AdminAuth\ForgotPasswordController@sendResetLinkEmail');
    Route::post('/password/reset', 'AdminAuth\ResetPasswordController@reset');
    Route::get('/password/reset', 'AdminAuth\ForgotPasswordController@showLinkRequestForm');
    Route::get('/password/reset/{token}', 'AdminAuth\ResetPasswordController@showResetForm');
});

/*
|--------------------------------------------------------------------------
| Dispatcher Authentication Routes
|--------------------------------------------------------------------------
*/

Route::group(['prefix' => 'dispatcher'], function () {
  Route::get('/login', 'DispatcherAuth\LoginController@showLoginForm');
  Route::post('/login', 'DispatcherAuth\LoginController@login');
  Route::post('/logout', 'DispatcherAuth\LoginController@logout');

  Route::post('/password/email', 'DispatcherAuth\ForgotPasswordController@sendResetLinkEmail');
  Route::post('/password/reset', 'DispatcherAuth\ResetPasswordController@reset');
  Route::get('/password/reset', 'DispatcherAuth\ForgotPasswordController@showLinkRequestForm');
  Route::get('/password/reset/{token}', 'DispatcherAuth\ResetPasswordController@showResetForm');
});

/*
|--------------------------------------------------------------------------
| Fleet Authentication Routes
|--------------------------------------------------------------------------
*/


Route::group(['prefix' => 'fleet'], function () {
  Route::get('/login', 'FleetAuth\LoginController@showLoginForm');
  Route::post('/login', 'FleetAuth\LoginController@login');
  Route::post('/logout', 'FleetAuth\LoginController@logout');

  Route::post('/password/email', 'FleetAuth\ForgotPasswordController@sendResetLinkEmail');
  Route::post('/password/reset', 'FleetAuth\ResetPasswordController@reset');
  Route::get('/password/reset', 'FleetAuth\ForgotPasswordController@showLinkRequestForm');
  Route::get('/password/reset/{token}', 'FleetAuth\ResetPasswordController@showResetForm');
});

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/



/*
Route::get('/ride', function () {
    return view('ride');
});

Route::get('/drive', function () {
    return view('drive');
});

*/
// Route::get('privacy', function () {
//     $page = 'page_privacy';
//     $title = 'Privacy Policy';
//     return view('static', compact('page', 'title'));
// });





/*
|--------------------------------------------------------------------------
| User Routes
|--------------------------------------------------------------------------
*/

/*
|--------------------------------------------------------------------------
| My Files
|--------------------------------------------------------------------------
*/

//User sign in
Route::get('/carecrew_signin', 'SignInControlller@index');
Route::get('/user_sign', 'SignInControlller@passengerSignin');

Route::get('/faq', 'HomeController@faqs');
Route::get('/terms', 'HomeController@terms');

Route::get('/help', 'HomeController@helps');

Route::get('/dashboard', 'HomeController@index');
Route::get('/mytrips', 'HomeController@mytrips');
Route::get('/mytrips/detail', 'HomeController@mytrips_details');

// user profiles
Route::get('/profile', 'HomeController@profile');
Route::get('/edit/profile', 'HomeController@edit_profile');
Route::post('/profile', 'HomeController@update_profile');

// update password
Route::get('/change/password', 'HomeController@change_password');
Route::post('/change/password', 'HomeController@update_password');

// ride
Route::get('/confirm/ride', 'RideController@confirm_ride');
Route::post('/create/ride', 'RideController@create_ride');
Route::post('/cancel/ride', 'RideController@cancel_ride');
Route::get('/onride', 'RideController@onride');
Route::post('/payment', 'PaymentController@payment');
Route::post('/rate', 'RideController@rate');

// status check
Route::get('/status', 'RideController@status');

// trips
Route::get('/trips', 'HomeController@trips');
Route::get('/upcoming/trips', 'HomeController@upcoming_trips');
Route::get('/upcoming/trips/detail', 'HomeController@upcoming_trips_details');

// wallet
Route::get('/wallet', 'HomeController@wallet');
Route::post('/add/money', 'PaymentController@add_money');

// payment
Route::get('/payment', 'HomeController@payment');

// card
Route::resource('card', 'Resource\CardResource');

// promotions
Route::get('/promotions', 'HomeController@promotions_index')->name('promocodes.index');
Route::post('/promotions', 'HomeController@promotions_store')->name('promocodes.store');

Route::group(['prefix' => 'account'], function () {
  Route::get('/login', 'AccountAuth\LoginController@showLoginForm');
  Route::post('/login', 'AccountAuth\LoginController@login');
  Route::post('/logout', 'AccountAuth\LoginController@logout');

  Route::get('/register', 'AccountAuth\RegisterController@showRegistrationForm');
  Route::post('/register', 'AccountAuth\RegisterController@register');

  Route::post('/password/email', 'AccountAuth\ForgotPasswordController@sendResetLinkEmail');
  Route::post('/password/reset', 'AccountAuth\ResetPasswordController@reset');
  Route::get('/password/reset', 'AccountAuth\ForgotPasswordController@showLinkRequestForm');
  Route::get('/password/reset/{token}', 'AccountAuth\ResetPasswordController@showResetForm');
});

//Common paged
Route::get('/enter_location', 'CommonController@enter_location');
Route::post('/ajax-handler/get_services', 'CommonController@get_services_type');
Route::post('/ajax-handler/get_service', 'CommonController@get_vehicle_type');
Route::post('/ajax-handler/get_store', 'CommonController@get_store_type');


Route::get('/help', 'CommonController@help');
Route::get('/request', 'CommonController@ride');
Route::get('/delivery', 'CommonController@drive');
Route::get('/media', 'CommonController@media');
Route::get('/newsroom', 'CommonController@newsroom');
Route::get('/blog', 'CommonController@blog');
Route::get('/about', 'CommonController@about');
Route::get('/helping_cities', 'CommonController@helping_cities');
Route::get('/career', 'CommonController@career');
Route::get('/carecrew_caretaker', 'CommonController@carecrew_caretaker');
Route::get('/how_it_works', 'CommonController@how_it_works')->name('works');
Route::get('/cities', 'CommonController@cities');
Route::get('/fare_estimate', 'CommonController@fare_estimate');
Route::get('/terms', 'CommonController@terms');
Route::get('/our_expert', 'CommonController@our_expert');
Route::get('/privacy', 'CommonController@privacy');

Route::get('/request_overview', 'CommonController@request_overview')->name('overview');
Route::get('/download_app', 'CommonController@download_app');
Route::get('/care_overview', 'CommonController@care_overview')->name('coverview');
Route::get('/caretaker_app', 'CommonController@caretaker_app');
Route::get('/download_app', 'CommonController@download_app');
Route::get('/care_solution', 'CommonController@care_solution');
Route::get('/caretaker_guide', 'CommonController@caretaker_guide');
Route::get('/support', 'CommonController@support');
Route::get('/contact', 'CommonController@support');

Route::get('/respite_care', 'CommonController@respite_care');
Route::get('/personal_support', 'CommonController@personal_support');
Route::get('/companion_care', 'CommonController@companion_care');
Route::get('/nurse', 'CommonController@nurse');

Route::get('/doctor', 'CommonController@doctor');
Route::get('/car', 'CommonController@car');
Route::get('/ambulance', 'CommonController@ambulance');

Route::get('/description', 'CommonController@blog_page1');
Route::get('/why_caretaker_required', 'CommonController@blog_page2');
Route::get('/how_caretaker_help_your_parents_and_relative', 'CommonController@blog_page3');
