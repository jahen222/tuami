<?php

namespace App\Http\Controllers\ProviderResources;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\ModelNotFoundException;

use App\Http\Controllers\Controller;

use DB;
use App\Vehicle;
use Auth;
use Setting;
use Storage;
use Exception;
use Carbon\Carbon;

use App\ProviderProfile;
use App\UserRequests;
use App\ProviderService;
use App\Fleet;
use App\UserRequestRating;

class ProfileController extends Controller
{
    /**
     * Create a new user instance.
     *
     * @return void
     */

    public function __construct()
    {
        $this->middleware('provider.api', ['except' => ['show', 'store', 'available', 'location_edit', 'location_update']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {

            $resLevel = UserRequestRating::where('provider_id',Auth::user()->id)->where('user_rating','<>','null')->count();

              if($resLevel >= 10 && $resLevel <50){

              $level = '1st';
              }
             elseif($resLevel >= 50 && $resLevel < 100){

             $level = '2nd';
             }
             elseif($resLevel >= 100){

             $level = '3rd';
             }
             else{
                  $level = 0;
                 }


                 $avgRating = UserRequestRating::groupBy('user_rating')->select('user_rating', DB::raw('count(user_rating) as total'))->where('provider_id',Auth::user()->id)->get();

  if(count($avgRating) !=0){
$avgsum = [];
$avg = [];
  foreach ($avgRating as $rk => $rv) {
     
     $avgsum[] =$rv->user_rating*$rv->total;
     $avg[] = $rv->total;
  }

$avgRating = round(array_sum($avgsum)/array_sum($avg),1);
}
else{
 $avgRating = 0;   
}

$totaldrive = UserRequests::whereIn('status',['COMPLETED','CANCELLED'])->where('provider_id',Auth::user()->id)->count();

if($totaldrive != 0){

             $successdrive = UserRequests::whereIn('status',['COMPLETED'])->where('provider_id',Auth::user()->id)->count();

            
             $successRate = (($successdrive*100)/$totaldrive);

                    $totalCompletion = round(($successRate*(5/100)),1);
                  }
else{
                $totalCompletion = 0;
              }

            $provid = ProviderService::where('provider_id',Auth::user()->id)->first();
            Auth::user()->service = Vehicle::where('id',$provid->service_type_id)->first();
            Auth::user()->fleet = Fleet::find(Auth::user()->fleet);
            Auth::user()->currency = Setting::get('currency', '$');
            Auth::user()->sos = Setting::get('sos_number', '911');
            Auth::user()->level = $level;
            Auth::user()->completionRate = round($totalCompletion,2);
            Auth::user()->avgsRating = round($avgRating,2);

            return Auth::user();

        } catch (Exception $e) {
            return $e->getMessage();
        }
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
                'first_name' => 'required|max:255',
                'last_name' => 'required|max:255',
                'mobile' => 'required',
                'avatar' => 'mimes:jpeg,bmp,png',
                'language' => 'max:255',
                'address' => 'max:255',
                'address_secondary' => 'max:255',
                'city' => 'max:255',
                'country' => 'max:255',
                'postal_code' => 'max:255',
            ]);

        try {

            $Provider = Auth::user();

            if($request->has('first_name')) 
                $Provider->first_name = $request->first_name;

            if($request->has('last_name')) 
                $Provider->last_name = $request->last_name;

            if ($request->has('mobile'))
                $Provider->mobile = $request->mobile;

            if ($request->hasFile('avatar')) {
                Storage::delete($Provider->avatar);
                $Provider->avatar = $request->avatar->store('provider/profile');
            }

            if($request->has('service_type')) {
                if($Provider->service) {
                    if($Provider->service->service_type_id != $request->service_type) {
                        $Provider->status = 'banned';
                    }
                    //$ProviderService = ProviderService::find(Auth::user()->id);
                    $ProviderService = ProviderService::find($Provider->service->id);
                    $ProviderService->service_type_id = $request->service_type;
                    $ProviderService->service_number = $request->service_number;
                    $ProviderService->service_model = $request->service_model;
                    $ProviderService->save();

                } else {
                    ProviderService::create([
                        'provider_id' => $Provider->id,
                        'service_type_id' => $request->service_type,
                        'service_number' => $request->service_number,
                        'service_model' => $request->service_model,
                    ]);
                    $Provider->status = 'banned';
                }
            }

            if($Provider->profile) {
                $Provider->profile->update([
                        'language' => $request->language ? : $Provider->profile->language,
                        'address' => $request->address ? : $Provider->profile->address,
                        'address_secondary' => $request->address_secondary ? : $Provider->profile->address_secondary,
                        'city' => $request->city ? : $Provider->profile->city,
                        'country' => $request->country ? : $Provider->profile->country,
                        'postal_code' => $request->postal_code ? : $Provider->profile->postal_code,
                    ]);
            } else {
                ProviderProfile::create([
                        'provider_id' => $Provider->id,
                        'language' => $request->language,
                        'address' => $request->address,
                        'address_secondary' => $request->address_secondary,
                        'city' => $request->city,
                        'country' => $request->country,
                        'postal_code' => $request->postal_code,
                    ]);
            }


            $Provider->save();

            return redirect(route('provider.profile.index'));
        }

        catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Provider Not Found!'], 404);
        }
    }

    /**
     * Display the specified resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        $fully = UserRequests::where('provider_id',\Auth::guard('provider')->user()->id)
                    ->with('payment','service_type')
                    ->get();

        return view('provider.profile.profile',compact('fully'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $this->validate($request, [
                'first_name' => 'required|max:255',
                'last_name' => 'required|max:255',
                'mobile' => 'required',
                'avatar' => 'mimes:jpeg,bmp,png',
                'language' => 'max:255',
                'address' => 'max:255',
                'address_secondary' => 'max:255',
                'city' => 'max:255',
                'country' => 'max:255',
                'postal_code' => 'max:255',
            ]);

        try {

            $Provider = Auth::user();

            if($request->has('first_name')) 
                $Provider->first_name = $request->first_name;

            if($request->has('last_name')) 
                $Provider->last_name = $request->last_name;

            if ($request->has('mobile'))
                $Provider->mobile = $request->mobile;

            if ($request->hasFile('avatar')) {
                Storage::delete($Provider->avatar);
                $Provider->avatar = $request->avatar->store('provider/profile');
            }

            if($Provider->profile) {
                $Provider->profile->update([
                        'language' => $request->language ? : $Provider->profile->language,
                        'address' => $request->address ? : $Provider->profile->address,
                        'address_secondary' => $request->address_secondary ? : $Provider->profile->address_secondary,
                        'city' => $request->city ? : $Provider->profile->city,
                        'country' => $request->country ? : $Provider->profile->country,
                        'postal_code' => $request->postal_code ? : $Provider->profile->postal_code,
                    ]);
            } else {
                ProviderProfile::create([
                        'provider_id' => $Provider->id,
                        'language' => $request->language,
                        'address' => $request->address,
                        'address_secondary' => $request->address_secondary,
                        'city' => $request->city,
                        'country' => $request->country,
                        'postal_code' => $request->postal_code,
                    ]);
            }


            $Provider->save();

            return $Provider;
            
        }

        catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Provider Not Found!'], 404);
        }
    }

    /**
     * Update latitude and longitude of the user.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function location(Request $request)
    {
        $this->validate($request, [
                'latitude' => 'required|numeric',
                'longitude' => 'required|numeric',
            ]);

        if($Provider = Auth::user()){

            $Provider->latitude = $request->latitude;
            $Provider->longitude = $request->longitude;
            $Provider->save();

            return response()->json(['message' => 'Location Updated successfully!']);

        } else {
            return response()->json(['error' => 'Provider Not Found!']);
        }
    }

    /**
     * Toggle service availability of the provider.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function available(Request $request)
    {
        $this->validate($request, [
                'service_status' => 'required|in:active,offline',
            ]);

        $Provider = Auth::user();
        
        if($Provider->service) {
            $Provider->service->update(['status' => $request->service_status]);
        } else {
            return response()->json(['error' => 'You account has not been approved for driving']);
        }

        return $Provider;
    }

    /**
     * Update password of the provider.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function password(Request $request)
    {
        $this->validate($request, [
                'password' => 'required|confirmed',
                'password_old' => 'required',
            ]);

        $Provider = Auth::user();

        if(password_verify($request->password_old, $Provider->password))
        {
            $Provider->password = bcrypt($request->password);
            $Provider->save();

            return response()->json(['message' => 'Password changed successfully!']);
        } else {
            return response()->json(['error' => 'Please enter correct password'], 422);
        }
    }

    /**
     * Show providers daily target.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function target(Request $request)
    {
        try {
            
            $Rides = UserRequests::where('provider_id', Auth::user()->id)
                    ->where('status', 'COMPLETED')
                   # ->where('created_at', '>=', Carbon::today())
                     ->orderBy('id','desc')
                    ->with('payment', 'service_type')
                    ->get();

            return response()->json([
                    'rides' => $Rides,
                    'rides_count' => $Rides->count(),
                    'target' => Setting::get('daily_target','0'),
                    
                ]);

        } catch(Exception $e) {
            return response()->json(['error' => "Something Went Wrong"]);
        }
    }
}
