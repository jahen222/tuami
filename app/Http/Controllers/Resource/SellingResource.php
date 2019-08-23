<?php

namespace App\Http\Controllers\Resource;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Setting;
use Exception;
use App\Helpers\Helper;

use App\ServiceType;
use App\SellingItem;

class SellingResource extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $services = SellingItem::join('store_users', 'selling_items.service_provider_id', '=', 'store_users.id')->get();
        if($request->ajax()) {
            return $services;
        } else {
            return view('admin.selling.index', compact('services'));
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.selling.create');
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
            'item_name' => 'required|max:255',
            'provider_name' => 'required|max:255',            
                
            'image' => 'mimes:ico,png'
        ]);


        try {
            $service = $request->all();

            if($request->hasFile('image')) {
                $image = Helper::upload_picture($request->image);
            }


               
           $data = [

                 "item_name"=>$request->item_name,
                 "item_price"=>$request->item_price,
                 "service_provider_id"=>$request->service_provider_id,
                 "quantity"=>$request->quantity,
                
                 "item_image"=>$image,

                       ];

             SellingItem::create($data);

                 

          

       

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
            $service = SellingItem::findOrFail($id);
            return view('admin.selling.edit',compact('service'));
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
            'item_name' => 'required|max:255',
         //   'provider_name' => 'required|max:255',
           
			'image' => 'mimes:ico,png,jpg,jpeg'
			
        ]);

        try {

            $service = SellingItem::findOrFail($id);

            if($request->hasFile('image')) {
                if($service->image) {
                    Helper::delete_picture($service->image);
                }
                $service->item_image = Helper::upload_picture($request->image);
            }

            $service->item_name = $request->item_name;
            
            $service->save();

            return redirect()->route('admin.selling.index')->with('flash_success', 'Service Type Updated Successfully');    
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