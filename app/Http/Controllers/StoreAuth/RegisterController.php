<?php

namespace App\Http\Controllers\StoreAuth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Auth;

use Setting;
use Validator;

use App\StoreUser;
use App\Settings;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    // protected $redirectTo = '/store/';
       
    /**
     * Create a new controller instance.
     *
     * @return void
     */
	
	private $client_detail = array();
	 
    public function __construct()
    {
        /*$this->middleware('store.guest');
		
		$ip = \Request::ip();
		
		$this->client_detail =   unserialize( file_get_contents("http://www.geoplugin.net/php.gp?ip={$ip}") );*/
		

    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
		
		$validate_argument = ['first_name' => 'required|max:255',
            // 'last_name' => 'required|max:255',
            'phone_number' => 'required',
            'email' => 'required|email|max:255|unique:providers',
            'password' => 'required|min:6|confirmed',
            'store_type' =>'required'
        ];
		
        return Validator::make($data, $validate_argument);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return Provider
     */
    protected function create(array $data)
    {
		
		$store = $data;
		$store['password'] = bcrypt($data['password']);
		$store['mobile'] = $data['phone_number'];
		$store['name'] = $data['first_name'];
        $store['store_type'] = $data['store_type'];
		$store = StoreUser::create($store);
        //return $store;
        return redirect('store/login');

    }

    /**
     * Show the application registration form.
     *
     * @return \Illuminate\Http\Response
     */
    public function showRegistrationForm()
    {
        return view('store.auth.register');
    }

    /**
     * Get the guard to be used during registration.
     *
     * @return \Illuminate\Contracts\Auth\StatefulGuard
     */
    protected function guard()
    {
        return Auth::guard('store');
    }
}
