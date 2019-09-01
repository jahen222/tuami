<?php

namespace App\Http\Controllers\Resource;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Setting;
use Exception;
use App\Helpers\Helper;

use App\ServiceType;

class ServiceResource extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        if($request->has('type')){
         
          $services = ServiceType::where('provider_name',$request->type)->get();
        
        }else{
        $services = ServiceType::all();

     }
        if($request->ajax()) {
            return $services;
        } else {
            return view('admin.service.index', compact('services'));
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.service.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


     $this->validate($request, [
            'name' => 'required|max:255',
            'provider_name' => 'required|max:255',            
            'location' => 'required|max:255',            
            'image' => 'mimes:ico,png'
        ]);


        try {
            $service = $request->all();

            if($request->hasFile('image')) {
                $image = Helper::upload_picture($request->image);
            }


               
           $data = [

                 "name"=>$request->name,
                 "provider_name"=>$request->provider_name,
                 "location"=>$request->location,
                 "latitude"=>$request->s_latitude,
                 "longitude"=>$request->s_longitude,
                 "image"=>$image,

                       ];

             ServiceType::create($data);

                 

          

       

            return back()->with('flash_success','Service Type Saved Successfully');
        } catch (Exception $e) {
            dd("Exception", $e);
            return back()->with('flash_error', 'Service Type Not Found');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\ServiceType  $serviceType
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            return ServiceType::findOrFail($id);
        } catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Service Type Not Found');
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\ServiceType  $serviceType
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        try {
            $service = ServiceType::findOrFail($id);
            return view('admin.service.edit',compact('service'));
        } catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Service Type Not Found');
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\ServiceType  $serviceType
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if(Setting::get('demo_mode', 0) == 1) {
            return back()->with('flash_error','Disabled for demo purposes! Please contact us at info@appoets.com');
        }

        $this->validate($request, [
            'name' => 'required|max:255',
         //   'provider_name' => 'required|max:255',
           
			'image' => 'mimes:ico,png'
			
        ]);

        try {

            $service = ServiceType::findOrFail($id);

            if($request->hasFile('image')) {
                if($service->image) {
                    Helper::delete_picture($service->image);
                }
                $service->image = Helper::upload_picture($request->image);
            }

            $service->name = $request->name;
            
            $service->save();

            return redirect()->route('admin.service.index')->with('flash_success', 'Service Type Updated Successfully');    
        } 

        catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Service Type Not Found');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\ServiceType  $serviceType
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if(Setting::get('demo_mode', 0) == 1) {
            return back()->with('flash_error','Disabled for demo purposes! Please contact us at info@appoets.com');
        }
        
        try {
            ServiceType::find($id)->delete();
            return back()->with('message', 'Service Type deleted successfully');
        } catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Service Type Not Found');
        } catch (Exception $e) {
            return back()->with('flash_error', 'Service Type Not Found');
        }
    }

    public function getSubCategories(Request $request){
    
    return ServiceType::where('provider_name',$request->provider_name)->get();
    
    }

    public function getSubCategoriesTwo(Request $request){

    return ServiceType::where('provider_name',$request->provider_name)->get();

    }
}