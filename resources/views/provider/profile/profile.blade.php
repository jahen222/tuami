@extends('provider.layout.app')

@section('content')

<div class="col-md-12" style="margin-bottom: 20px;">
    <div class="dash-content">
        <div class="row no-margin">
            <div class="col-md-12">
                <h4 class="page-title">General Information</h4>
            </div>
        </div>
            @include('common.notify')

        <div class="container-fluid">
            <div class="profile-head white-bg row no-margin">
                <div class="prof-head-left col-lg-2 col-md-2 col-sm-3 col-xs-12" style="margin-top: -20px;">
                    <div class="profile-img-blk">
                        <div class="img_outer">
                            <img class="profile_preview" id="profile_image_preview" src="{{ Auth::guard('provider')->user()->avatar ? asset('storage/app/public/'.Auth::guard('provider')->user()->avatar) : asset('asset/img/provider.jpg') }}" alt="your image"/>
                        </div>
                    </div>
                </div> 
            </div>
        </div>

        <div class="row no-margin">
            <form>
                <div class="col-md-6 pro-form">
                    <h5 class="col-md-6 no-padding"><strong>First Name</strong></h5>
                    <p class="col-md-6 no-padding">{{ Auth::guard('provider')->user()->first_name }}</p>                       
                </div>
                <div class="col-md-6 pro-form">
                    <h5 class="col-md-6 no-padding"><strong>Last Name</strong></h5>
                    <p class="col-md-6 no-padding">{{ Auth::guard('provider')->user()->last_name }}</p>                       
                </div>
                <div class="col-md-6 pro-form">
                    <h5 class="col-md-6 no-padding"><strong>Phone</strong></h5>
                    <p class="col-md-6 no-padding">{{ Auth::guard('provider')->user()->mobile }}</p>
                </div>

                <div class="col-md-6 pro-form">
                    <h5 class="col-md-6 no-padding"><strong>Language</strong></h5>
                    <p class="col-md-6 no-padding">English</p>
                </div>

                <div class="col-md-6 pro-form">
                    <h5 class="col-md-6 no-padding"><strong>Address</strong></h5>
                    <p class="col-md-6 no-padding">{{ Auth::guard('provider')->user()->profile ? Auth::guard('provider')->user()->profile->address : "" }}</p>
                </div>

                <div class="col-md-6 pro-form">
                    <p class="col-md-6 no-padding">{{ Auth::guard('provider')->user()->profile ? Auth::guard('provider')->user()->profile->address_secondary : "" }}</p>
                    <h5 class="col-md-6 no-padding"><strong></strong></h5>
                </div>

                <div class="col-md-6 pro-form">
                    <h5 class="col-md-6 no-padding"><strong>City</strong></h5>
                    <p class="col-md-6 no-padding">{{ Auth::guard('provider')->user()->profile ? Auth::guard('provider')->user()->profile->city : "" }}</p>
                </div>

                <div class="col-md-6 pro-form">
                    <h5 class="col-md-6 no-padding"><strong>Country</strong></h5>
                    <p class="col-md-6 no-padding">United States</p>
                </div>

                <div class="col-md-6 pro-form">
                    <h5 class="col-md-6 no-padding"><strong>Postal Code</strong></h5>
                    <p class="col-md-6 no-padding">{{ Auth::guard('provider')->user()->profile ? Auth::guard('provider')->user()->profile->postal_code : "" }}</p>
                </div>

                <div class="col-md-6 pro-form">
                    <h5 class="col-md-6 no-padding"><strong>Service</strong></h5>
                    <p class="col-md-6 no-padding">{{ Auth::guard('provider')->user()->service->service_type->name }}</p>
                </div>

                <div class="col-md-6 pro-form">
                    <h5 class="col-md-6 no-padding"><strong>Car Number</strong></h5>
                    <p class="col-md-6 no-padding">{{ Auth::guard('provider')->user()->service->service_number ? Auth::guard('provider')->user()->service->service_number : "" }}</p>
                </div>

                <div class="col-md-6 pro-form">
                    <h5 class="col-md-6 no-padding"><strong>Car Model</strong></h5>
                    <p class="col-md-6 no-padding">{{ Auth::guard('provider')->user()->service->service_model ? Auth::guard('provider')->user()->service->service_model : "" }}</p>
                </div>

                <div class="col-md-6 pro-form">
                    <a class="form-sub-btn" href="{{url('provider/edit/profile')}}">Edit</a>
                </div>

            </form>
        </div>

    </div>
</div>

@endsection