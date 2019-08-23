<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\ServiceType;
use App\AccountSwitch;
use App\Blog;

class CommonController extends Controller
{
    public function enter_location()
    {
        return view('user.layout.enter_location');

    }
	
	public function help()
    {
        return view('user.layout.help');

    }
	

    public function ride()
    {
        return view('user.layout.ride');

    }

    public function drive()
    {
        return view('user.layout.drive');

    }
	
	public function media()
	{        
		return view('user.layout.media');    
		
	}			
    
	public function newsroom()
	{        
		return view('user.layout.newsroom');    
		
	}
	
	public function blog()
	{        

		$blog = Blog::all();

		return view('user.layout.blog', compact('blog'));    
		
	}
	
	public function about()
	{        
		return view('user.layout.about');    
		
	}
	
	public function helping_cities()
	{        
		return view('user.layout.helping_cities');    
		
	}
	
	public function career()
	{        
		return view('user.layout.career');    
		
	}
	
	
	public function how_it_works()
	{        
		return view('user.layout.how_it_works');    
		
	}
	
	
	public function cities()
    {
        return view('user.layout.cities');

    }

    public function fare_estimate()
    {
        return view('user.layout.fare_estimate');

    }

    public function terms()
    {
        return view('user.layout.terms');

    }
	
	
	public function privacy()
    {
        return view('user.layout.privacy');

    }
	
	public function our_expert()
    {
        return view('user.layout.our_expert');

    }
	
	public function carecrew_caretaker()
    {
        return view('user.layout.carecrew_caretaker');

    }
	
	public function request_overview() 
	{
		
		return view('user.layout.request_overview');
		
	}
	
	public function download_app() 
	{
		
		return view('user.layout.download_app');
		
	}
	
	
	public function care_overview() 
	{
		
		return view('user.layout.care_overview');
		
	}
	
	
	public function caretaker_app() 
	{
		
		return view('user.layout.caretaker_app');
		
	}
	
	
	public function care_solution() 
	{
		
		return view('user.layout.care_solution');
		
	}
	
	public function caretaker_guide()
	{
		
		return view('user.layout.caretaker_guide');
		
	}
	
	public function support()
	{
		
		return view('user.layout.support');
		
	}
	
	public function respite_care()
	{
		
		return view('user.layout.respite_care');
		
	}
	
	
	public function personal_support()
	{
		
		return view('user.layout.personal_support');
		
	}
	
	
	public function companion_care()
	{
		
		return view('user.layout.companion_care');
		
	}
	
	public function nurse()
	{
		
		return view('user.layout.nurse');
		
	}

	public function doctor()
	{
		
		return view('user.layout.doctor');
		
	}

	public function ambulance()
	{
		
		return view('user.layout.ambulance');
		
	}

	public function car()
	{
		
		return view('user.layout.car');
		
	}
	
	public function blog_page1(Request $request) {
    
    $blog = Blog::where('id',$request->id)->get();

    		return view('blog.blog_page1', compact('blog'));
    	
	} 
	    
	public function blog_page2() {
	    
	   return view('blog.blog_page2');
	    	
	}
	    
	
	public function blog_page3() {

		return view('blog.blog_page3');
	
	}
	    
	    
	public function blog_page4() {

		return view('blog.blog_page4');
	
	}
	

	public function get_services_type(Request $request) {
		$json = array();
		$json['service_type'] = array();
		$type = ( $request->type ) ? $request->type : 'CARETAKER';
		
		
		$service_type = ServiceType::where('provider_name', $type)->get()->toArray();
		
		$json['request'] = $request->all();
		
		if( count( $service_type ) ) {
			$json['service_type'] = $service_type;
		}
		
		
		return response()->json( $json );
		
		
	}


}
