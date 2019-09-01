<?php

namespace App\Http\Controllers\ProviderAuth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Auth;

use Setting;
use Validator;

use App\Provider;
use App\ProviderService;
use App\AccountSwitch;
use App\ServiceType;
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
    protected $redirectTo = '/provider/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
	
	private $client_detail = array();
	 
    public function __construct()
    {
        $this->middleware('provider.guest');
		
		$ip = \Request::ip();
		
		$this->client_detail =   unserialize( file_get_contents("http://www.geoplugin.net/php.gp?ip={$ip}") );
		

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
            'last_name' => 'required|max:255',
            'phone_number' => 'required',
            'email' => 'required|email|max:255|unique:providers',
            'password' => 'required|min:6|confirmed',
            'provider_type' => 'required',
            'available_for_emergency' => 'required',
			'available_to' => 'required',
			'service_type' => 'required',
        ];
		
		if( isset($data['provider_type']) && $data['provider_type'] == 'CARETAKER' ) {
			$validate_argument['base_amount'] = 'required';
			$validate_argument['sub_service_type'] = 'required';
			
		}
		
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
		
		$service_type = ServiceType::select('provider_name','id')->where('id', $data['service_type'] )->where('provider_name', $data['provider_type'] )->first();
		$service_type_id = $service_type->id;
		
		
		if( $data['provider_type'] == 'CAR/TRANSFER') {
            $provider_service_name = 'CAR';
		} else {
			$provider_service_name = $data['provider_type'];
		}
		
		if( $this->client_detail ) {
			
			if( strtoupper($this->client_detail['geoplugin_countryName']) == 'INDIA' ) {
			$country = 'India';
			} else if( strtoupper($this->client_detail['geoplugin_countryName']) == 'CANADA' ) {
				$country = 'Canada';
			} else {
				$country = 'USA';
			}
			
			$latitude 	=	$this->client_detail['geoplugin_latitude'];
			$longitude	=	$this->	client_detail['geoplugin_longitude'];
			
		} else {
			
			$country = 'USA';
			$latitude 	=	0;
			$longitude	=	0;
			
		}
		
		$service_implode = $service_type_id;
		if( $data['provider_type'] == 'CARETAKER' ) {
			if(  isset( $data['sub_service_type'] ) &&  count( $data['sub_service_type'] ) ) {
				
				$service_implode = implode(' ,', $data['sub_service_type'] );
				
				
			}
		}

		$country_detail = Settings::where('key', $country)->first();
		$currency_id = ((array)$country_detail ) ?  $country_detail->id :  '35';
		
		
		
		
		$Provider = $data;
		$Provider['password'] = bcrypt($data['password']);
		$Provider['provider_service_type'] = $provider_service_name;
		$Provider['major_service_type_id'] = $service_type_id;
		$Provider['service_type_id'] = $service_implode;
		$Provider['mobile'] = $data['phone_number'];
		$Provider['status'] = 'onboarding';
		$Provider['latitude'] = $latitude;
		$Provider['longitude'] = $longitude;
		$Provider['login_by'] = 'manual';
		$Provider['currency_id'] =	$currency_id;
		
		
		$Provider = Provider::create($Provider);
		
		
		$dataSwitchList = [
			"provider_id" => $Provider->id,
			"provider_service_type" 	=>	$provider_service_name,
			"service_type_id"			=>	$service_implode,
			"major_service_type_id"		=>	$service_type_id,
			"available_to"				=>	$data['available_to'],
			"base_amount"				=>	isset($data['base_amount']) ? $data['base_amount'] : 0,
			"available_for_emergency"	=>	$data['available_for_emergency'],
			"currency_id"				=>	$currency_id,			
        ];
	
		
		
		$checkd = AccountSwitch::where('provider_service_type',$provider_service_name)->where('provider_id',$Provider->id)->first();
		
		if(count($checkd) == 0) {
            AccountSwitch::Create($dataSwitchList);
        }
		
		
		/*
        $provider_service = ProviderService::create([
            'provider_id' => $Provider->id,
            'service_type_id' => $data['service_type'],
            'service_number' => $data['service_number'],
            'service_model' => $data['service_model'],
        ]);
		*/
		
		/*
        if(Setting::get('demo_mode', 0) == 1) {
            $Provider->update(['status' => 'approved']);
            $provider_service->update([
                'status' => 'active',
            ]);
        }
        
		*/
	
		
        return $Provider;
    }

    /**
     * Show the application registration form.
     *
     * @return \Illuminate\Http\Response
     */
    public function showRegistrationForm()
    {
        return view('provider.auth.register');
    }

    /**
     * Get the guard to be used during registration.
     *
     * @return \Illuminate\Contracts\Auth\StatefulGuard
     */
    protected function guard()
    {
        return Auth::guard('provider');
    }
}
