@extends('user.layout.base')

@section('title', 'Dashboard ')

@section('styles')
    <link rel="stylesheet" href="{{asset('main/vendor/jvectormap/jquery-jvectormap-2.0.3.css')}}">
    
@endsection

@section('content')

<div class="content-area py-1">
<div class="container-fluid">
    <div class="row row-md">
        <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="box box-block bg-white tile tile-1 mb-2">
                <!--div class="t-icon right"><span class="bg-danger"></span><i class="ti-rocket"></i></div-->
                <div class="t-content">
                    <h4 class="text-uppercase mb-1">Total Request</h4>
                    <h1 class="mb-1">{{$rides->count()}}</h1>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="box box-block bg-white tile tile-1 mb-2">
                <!--div class="t-icon right"><span class="bg-success"></span><i class="ti-bar-chart"></i></div-->
                <div class="t-content">
                    <h4 class="text-uppercase mb-1">Cancel Request</h4>
                    <h1 class="mb-1">{{$cancel_rides}}</h1>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="box box-block bg-white tile tile-1 mb-2">
                <!--div class="t-icon right"><span class="bg-primary"></span><i class="ti-view-grid"></i></div-->
                <div class="t-content">
                    <h4 class="text-uppercase mb-1">Schedule Request</h4>
                    <h1 class="mb-1">{{$scheduled_rides}}</h1>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-xs-12">
        
        </div>
    </div>

    <div class="dash-content">
        <div class="row no-margin">
            <div class="col-md-12">
                <h4 class="page-title">Recent Request</h4>
                <hr/>
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
                            <th>@lang('Fee')</th>
                            <th>@lang('Care Taker')</th>
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
                                    <button type="submit" style="margin-top: 0px;" class="full-primary-btn fare-btn">Details <i class="ti-arrow-right float-xs-right" style="color: white;"></i></button>
                                </form>
                            </td>
                        </tr>

                        @endforeach


                    </tbody>
                </table>
                @else
                    <hr>
                    <p style="text-align: center;">No Orderss Available</p>
                @endif
            </div>
        </div>

    </div>
</div>
</div>

@endsection