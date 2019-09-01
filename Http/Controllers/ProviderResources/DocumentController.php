<?php

namespace App\Http\Controllers\ProviderResources;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\ModelNotFoundException;

use Auth;
use App\Document;
use App\ProviderDocument;
use App\UserRequests;

class DocumentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $VehicleDocuments = Document::vehicle()->get();
        $DriverDocuments = Document::driver()->get();

        $Provider = \Auth::guard('provider')->user();

        $fully = UserRequests::where('provider_id',\Auth::guard('provider')->user()->id)
                ->with('payment','service_type')
                ->get();

        return view('provider.document.index', compact('DriverDocuments', 'VehicleDocuments', 'Provider','fully'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
                'document' => 'mimes:jpg,jpeg,png,pdf',
            ]);

        try {
            
            $Document = ProviderDocument::where('provider_id', \Auth::guard('provider')->user()->id)
                ->where('document_id', $id)
                ->firstOrFail();

            $Document->update([
                    'url' => $request->document->store('provider/documents'),
                    'status' => 'ASSESSING',
                ]);

            return back();

        } catch (ModelNotFoundException $e) {

            ProviderDocument::create([
                    'url' => $request->document->store('provider/documents'),
                    'provider_id' => \Auth::guard('provider')->user()->id,
                    'document_id' => $id,
                    'status' => 'ASSESSING',
                ]);
            
        }

        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

     public function checkDocument(Request $request) {
        
        try {
            
            $documents = ProviderDocument::where('provider_id', Auth::user()->id)->count();
                         
                        if($documents != 0){
            
            return response()->json(['status'=> 1,'msg'=>'document found']);

                        }else{
                        
                        return response()->json(['status'=> 0,'msg'=>'no document found']);
                        }
                
                
            
        } catch(Exception $e) {
            
            return response()->json(['error' => trans('api.something_went_wrong')], 500);
        }
        
    }
}
