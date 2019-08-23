<?php

namespace App\Http\Controllers\Resource;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Setting;
use Exception;
use App\Helpers\Helper;

use App\Category;

class CategoryResource extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $category = Category::all();
		
        if($request->ajax()) {
            return $category;
        } else {
            return view('admin.category.index', compact('category'));
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.category.create');
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


        try {
            /* $category = $request->all();
			$data = ["name"=>$request->name];
            Category::create($data); */
			
			$category = new Category();

            $category->name = $request->name;
            
            $category->save();

            return back()->with('flash_success','Category Saved Successfully');
        } catch (Exception $e) {
            return back()->with('flash_error', 'Somthing went wrong');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            return Category::findOrFail($id);
        } catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Category Not Found');
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Category  $Category
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        try {
            $category = Category::findOrFail($id);
            return view('admin.category.edit',compact('category'));
        } catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Category Not Found');
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
            'name' => 'required|max:255']);

        try {

            $category = Category::findOrFail($id);

            $category->name = $request->name;
            
            $category->save();

            return redirect()->route('admin.category.index')->with('flash_success', 'Category Updated Successfully');    
        } 

        catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Category Not Found');
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
            Category::find($id)->delete();
            return back()->with('message', 'Category deleted successfully');
        } catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Category Not Found');
        } catch (Exception $e) {
            return back()->with('flash_error', 'Category Not Found');
        }
    }

}