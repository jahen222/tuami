<?php

namespace App\Http\Controllers\Resource;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Setting;
use Exception;
use App\Helpers\Helper;

use App\ServiceType;
use App\Blog;
use App\BankAccount;
use App\WithdrawalMoney;

class BankResource extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function new_account(Request $request)
    {
        $bank = BankAccount::where('status','WAITING')->get();
        if($request->ajax()) {
            return $bank;
        } else {
            return view('admin.bank.new_account', compact('bank'));
        }
    }


    public function approved_account(Request $request)
    {

        if($request->ajax()) {

    return BankAccount::where('id',$request->id)->update(['status'=>'APPROVED']);
    
        }
        else{
        $bank = BankAccount::where('status','APPROVED')->get();
       
            return view('admin.bank.approved_account', compact('bank'));

        }
        
    }



     public function approved_withdraw(Request $request){

     if($request->ajax()) {

     return WithdrawalMoney::where('id',$request->id)->update(['status'=>'APPROVED']);
     }
     else{

    $bank = WithdrawalMoney::where('status','APPROVED')->get();
     return view('admin.bank.approved_withdraw', compact('bank'));

     }
     }

      public function new_withdraw(Request $request)
    {
        $bank = WithdrawalMoney::where('status','WAITING')->get();
       

        if($request->ajax()) {

       $withdraw = WithdrawalMoney::where('id',$request->id)->first();
       $bankDetail = BankAccount::where('id',$withdraw->bank_account_id)->first();

       $arr = [];

       $arr[0]['account_name'] = $bankDetail->account_name;
       $arr[0]['bank_name'] = $bankDetail->bank_name;
       $arr[0]['account_number'] = $bankDetail->account_number;
       $arr[0]['routing_number'] = $bankDetail->routing_number;
       $arr[0]['withdraw_request_amount'] = $withdraw->amount;
       $arr[0]['request_date'] = $bankDetail->created_at;
       $arr[0]['country'] = $bankDetail->country;
       $arr[0]['withdrawId'] = $withdraw->id;

       return $arr;
            
        } else {
            return view('admin.bank.new_withdraw', compact('bank'));
        }
            
        
    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.blog.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if(Setting::get('demo_mode', 0) == 1) {
            return back()->with('flash_error','Disabled for demo purposes! Please contact us at info@appoets.com');
        }

        $this->validate($request, [
            'title' => 'required',
            'description' => 'required',
            'image' => 'mimes:ico,png,jpeg,jpg'
        ]);

        try {
            $service = $request->all();

            if($request->hasFile('image')) {
                $service['image'] = Helper::upload_picture($request->image);
            }

            $service = Blog::create($service);

            return back()->with('flash_success','New Blog post created Successfully');
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
            return view('admin.blog.edit',compact('service'));
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
            'provider_name' => 'required|max:255',
            'fixed' => 'required|numeric',
            'price' => 'required|numeric',
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
            $service->provider_name = $request->provider_name;
            $service->fixed = $request->fixed;
            $service->price = $request->price*0.6;
            $service->minute = $request->minute;
            $service->distance = $request->distance;
            $service->calculator = $request->calculator;
            $service->capacity = $request->capacity;
            $service->save();

            return redirect()->route('admin.blog.index')->with('flash_success', 'Service Type Updated Successfully');    
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
            BankAccount::find($id)->delete();
            return back()->with('message', 'Service Type deleted successfully');
        } catch (ModelNotFoundException $e) {
            return back()->with('flash_error', 'Service Type Not Found');
        } catch (Exception $e) {
            return back()->with('flash_error', 'Service Type Not Found');
        }
    }
}
