@extends('user.layout.base')

@section('styles')
    <link rel="stylesheet" href="{{asset('main/vendor/jvectormap/jquery-jvectormap-2.0.3.css')}}">
    
@endsection

@section('content')

<div class="content-area py-1">
<div class="container-fluid">
    <div class="dash-content">
        <div class="row no-margin">
            <div class="col-md-12">
                <h4 class="page-title">MY Request</h4>
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
                    <p style="text-align: center;">No trips Available</p>
                @endif
            </div>
        </div>

    </div>
</div>
</div>

@endsection