<?php

namespace App\Http\Controllers\Resource;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Setting;
use Exception;
use App\Helpers\Helper;

use App\SubCategory;
use App\Category;

class SubCategoryResource extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sub_categories = SubCategory::all();
        if($request->ajax()) {
            return $sub_categories;
        } else {
            return view('admin.sub_category.index', compact('sub_categories'));
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
		$category_list = Category::all();
        return view('admin.sub_category.create', compact('category_list'));
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
            'name' => 'required|max:255'
        ]);
		$cat = explode(",", $request->category);
		$request->category_name = $cat[1];
		$request->category_id = $cat[0];
		//dd($request->category);
		
        try {
			if($request->has('updated_id')){
				$sub_category = SubCategory::findOrFail($request->updated_id);
			}else{
				$sub_category = new SubCategory();
			}
            
			$sub_category->name = $request->name;
			$sub_category->category_name = $request->category_name;
			$sub_category->category_id = $request->category_id;
            
			$sub_category->save();
			 
            return back()->with('flash_success','Sub Category Saved Successfully');
        } catch (Exception $e) {
            dd("Exception", $e);
            return back()->with('flash_error', 'Sub Category Not Found');
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
            return SubCategory::findOrFail($id);
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
			$category_list = Category::all();
            $sub_category = SubCategory::findOrFail($id);
            return view('admin.sub_category.edit',compact(['sub_category', 'category_list']));
        } catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Sub Category Type Not Found');
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
        dd('Hello');
        $this->validate($request, [
            'name' => 'required|max:255'
        ]);
		$cat = explode(",", $request->category);
		$request->category_name = $cat[1];
		$request->category_id = $cat[0];
        try {
            $sub_category = SubCategory::findOrFail($id);
            $sub_category->name = $request->name;
            $sub_category->category_name = $request->category_name;
            $sub_category->category_id = $request->category_id;
            
            $sub_category->save();

            return redirect()->route('admin.sub_category.index')->with('flash_success', 'Sub Category Type Updated Successfully');    
        } 

        catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Sub Category Type Not Found');
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
            SubCategory::find($id)->delete();
            return back()->with('message', 'Service Type deleted successfully');
        } catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Service Type Not Found');
        } catch (Exception $e) {
            return back()->with('flash_error', 'Service Type Not Found');
        }
    }
}