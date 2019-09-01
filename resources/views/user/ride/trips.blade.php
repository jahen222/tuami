@extends('user.layout.base')

@section('title', 'My Request ')

@section('content')

<div class="col-md-12" style="margin-bottom: 20px;">

    <div class="dash-content">
        <div class="row no-margin">
            <div class="col-md-12">
                <h4 class="page-title">Request Care Taker</h4>
            </div>
        </div>
        @include('common.notify')
        <div class="row no-margin">
            <div class="col-md-6">
                <form action="{{url('confirm/ride')}}" method="GET" onkeypress="return disableEnterKey(event);">
                    <div class="input-group dash-form">
                        <input type="text" class="form-control" id="origin-input" name="s_address"  placeholder="Enter pickup location">
                    </div>

                    <div class="input-group dash-form">
                        <input type="text" class="form-control" id="destination-input" name="d_address"  placeholder="Enter drop location" >
                    </div>

                    <input type="hidden" name="s_latitude" id="origin_latitude">
                    <input type="hidden" name="s_longitude" id="origin_longitude">
                    <input type="hidden" name="d_latitude" id="destination_latitude">
                    <input type="hidden" name="d_longitude" id="destination_longitude">
                    <input type="hidden" name="current_longitude" id="long">
                    <input type="hidden" name="current_latitude" id="lat">

                    <div class="car-detail">

                        @foreach($services as $service)
                        <div class="car-radio">
                            <input type="radio" 
                                name="service_type"
                                value="{{$service->id}}"
                                id="service_{{$service->id}}"
                                @if ($loop->first) checked="checked" @endif>
                            <label for="service_{{$service->id}}">
                                <div class="car-radio-inner">
                                    
                                    <div class="img"><img src="{{image($service->image)}}"></div>
                                    <div class="name"><span>{{$service->name}}</span></div>
                                </div>
                            </label>
                        </div>
                        @endforeach


                    </div>

                    <button type="submit"  class="full-primary-btn fare-btn">Request care Taker</button>

                </form>
            </div>

            <div class="col-md-6">
                <div class="map-responsive">
                    <div id="map" style="width: 100%; height: 450px;"></div>
                </div> 
            </div>
        </div>
    </div>

    <div class="dash-content" style="margin-top: 20px;">
        <div class="row no-margin">
            <div class="col-md-12">
                <h4 class="page-title">Recent Request</h4>
            </div>
        </div>

        <div class="row no-margin ride-detail">
            <div class="col-md-12">
            @if($trips->count() > 0)

                <table class="table table-condensed" style="border-collapse:collapse;">
                    <thead>
                        <tr>
                            <!--th>&nbsp;</th-->
                            <th>@lang('user.booking_id')</th>
                            <th>@lang('user.date')</th>
                            <th>@lang('user.profile.name')</th>
                            <th>@lang('user.amount')</th>
                            <th>Care Taker</th>
                            <th>@lang('user.payment')</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                    @foreach($trips as $trip)

                        <tr data-toggle="collapse" data-target="#trip_{{$trip->id}}" class="accordion-toggle collapsed">
                            <!--td><span class="arrow-icon fa fa-chevron-right"></span></td-->
                            <td>{{ $trip->booking_id }}</td>
                            <td>{{date('d-m-Y',strtotime($trip->assigned_at))}}</td>
                            @if($trip->provider)
                                <td>{{$trip->provider->first_name}} {{$trip->provider->last_name}}</td>
                            @else
                                <td>-</td>
                            @endif
                            @if($trip->payment)
                                <td>{{currency($trip->payment->total)}}</td>
                            @else
                                <td>-</td>
                            @endif
                            @if($trip->service_type)
                                <td>{{$trip->service_type->name}}</td>
                            @else
                                <td>-</td>
                            @endif
                            <td>@lang('user.paid_via') {{$trip->payment_mode}}</td>
                            <td>
                                <form action ="{{url('/mytrips/detail')}}">
                                    <input type="hidden" value="{{$trip->id}}" name="request_id">
                                    <button type="submit" style="margin-top: 0px;" class="full-primary-btn fare-btn">Detail</button>
                                </form>
                            </td>
                        </tr>
                       
                        @endforeach


                    </tbody>
                </table>
                @else
                    <hr>
                    <p style="text-align: center;">No Request Available</p>
                @endif
            </div>
        </div>

    </div>
</div>
@endsection

@section('scripts')    
<script type="text/javascript">
    var current_latitude = 43.653908;
    var current_longitude = -79.384293;
</script>

<script type="text/javascript">
    if( navigator.geolocation ) {
       navigator.geolocation.getCurrentPosition( success, fail );
    } else {
        console.log('Sorry, your browser does not support geolocation services');
        initMap();
    }

    function success(position)
    {
        document.getElementById('long').value = position.coords.longitude;
        document.getElementById('lat').value = position.coords.latitude

        if(position.coords.longitude != "" && position.coords.latitude != ""){
            current_longitude = position.coords.longitude;
            current_latitude = position.coords.latitude;
        }
        initMap();
    }

    function fail()
    {
        // Could not obtain location
        console.log('unable to get your location');
        initMap();
    }
</script> 

<script type="text/javascript" src="{{ asset('asset/js/map.js') }}"></script>
<script src="https://maps.googleapis.com/maps/api/js?key={{ env('GOOGLE_MAP_KEY') }}&libraries=places&callback=initMap" async defer></script>

<script type="text/javascript">
    function disableEnterKey(e)
    {
        var key;
        if(window.e)
            key = window.e.keyCode; // IE
        else
            key = e.which; // Firefox

        if(key == 13)
            return e.preventDefault();
    }
</script>

@endsection