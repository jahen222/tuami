@extends('admin.layout.base')

@section('title', 'Dashboard ')

@section('styles')
	<link rel="stylesheet" href="{{asset('main/vendor/jvectormap/jquery-jvectormap-2.0.3.css')}}">
@endsection

@section('content')
<div class="content-area py-1">
<div class="container-fluid">
    <div class="row row-md">
		<div class="col-lg-4 col-md-6 col-xs-12">
			<div class="box box-block bg-success mb-2">
				<div class="t-content">
					<h5 class="text-uppercase mb-1">Total Request</h5>
					<h5 class="mb-1">{{$rides->count()}}</h5>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-6 col-xs-12">
			<div class="box box-block bg-primary mb-2">
				<div class="t-content">
					<h5 class="text-uppercase mb-1">Revenue</h5>
					<h5 class="mb-1">{{currency($revenue)}}</h5>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-6 col-xs-12">
			<div class="box box-block bg-warning mb-2">
				<div class="t-content">
					<h5 class="text-uppercase mb-1">Total Provider</h5>
					<h5 class="mb-1">{{$service}}</h5>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-6 col-xs-12">
			<div class="box box-block bg-danger mb-2">
				<div class="t-content">
					<h5 class="text-uppercase mb-1">Cancelled Request</h5>
					<h5 class="mb-1">{{$cancel_rides}}</h5>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-6 col-xs-12">
			<div class="box box-block bg-success mb-2">
				<div class="t-content">
					<h5 class="text-uppercase mb-1">Cancelled Request (User)</h5>
					<h5 class="mb-1">{{$user_cancelled}}</h5>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-6 col-xs-12">
			<div class="box box-block bg-primary mb-2">
				<div class="t-content">
					<h5 class="text-uppercase mb-1">Cancelled Request (Provider)</h5>
					<h5 class="mb-1">{{$provider_cancelled}}</h5>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-6 col-xs-12">
			<div class="box box-block bg-warning mb-2">
				<div class="t-content">
					<h5 class="text-uppercase mb-1">Card Payment</h5>
					<h5 class="mb-1">{{$fleet}}</h5>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-6 col-xs-12">
			<div class="box box-block bg-danger mb-2">
				<div class="t-content">
					<h5 class="text-uppercase mb-1">Scheduled Request</h5>
					<h5 class="mb-1">{{$scheduled_rides}}</h5>
				</div>
			</div>
		</div>
                <div class="col-lg-4 col-md-6 col-xs-12">
			<div class="box box-block bg-success mb-2">
				<div class="t-content">
					<h5 class="text-uppercase mb-1">Cash Payment</h5>
					<h5 class="mb-1">{{$scheduled_rides}}</h5>
				</div>
			</div>
		</div>
	</div>

	<div class="row row-md mb-2">
		<div class="col-md-12">
				<div class="box bg-white">
					<div class="box-block clearfix">
						<h5 class="float-xs-left">Recent Request</h5>
						<div class="float-xs-right">
							<button class="btn btn-link btn-sm text-muted" type="button"><i class="ti-close"></i></button>
						</div>
					</div>
					<table class="table mb-md-0">
						<tbody>
						<?php $diff = ['-success','-info','-warning','-danger']; ?>
						@foreach($rides as $index => $ride)
							<tr>
								<th scope="row">{{$index + 1}}</th>
								<td>{{$ride->user->first_name}} {{$ride->user->last_name}}</td>
								<td>
									@if($ride->status != "CANCELLED")
										<a class="text-primary" href="{{route('admin.requests.show',$ride->id)}}"><span class="underline">View Request Details</span></a>
									@else
										<span>No Details Found </span>
									@endif									
								</td>
								<td>
									<span class="text-muted">{{$ride->created_at->diffForHumans()}}</span>
								</td>
								<td>
									@if($ride->status == "COMPLETED")
										<span class="tag tag-success">{{$ride->status}}</span>
									@elseif($ride->status == "CANCELLED")
										<span class="tag tag-danger">{{$ride->status}}</span>
									@else
										<span class="tag tag-info">{{$ride->status}}</span>
									@endif
								</td>
							</tr>
							<?php if($index==10) break; ?>
						@endforeach
							
						</tbody>
					</table>
				</div>
			</div>

		</div>

	</div>

 	
</div>
@endsection

@section('scripts')
    <script type="text/javascript">
  window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {
      title:{
        text: ""    
      },
      axisY: {
        title: "Earning"
      },
      legend: {
        verticalAlign: "bottom",
        horizontalAlign: "center"
      },
      data: [

      {        
        color: "#B0D0B0",
        type: "column",  
        showInLegend: true, 
        legendMarkerType: "none",
        legendText: "Timing",
        dataPoints: [      
        { x: 1, y: 14, label: "3:00 PM"},
        { x: 2, y: 12,  label: "3:30 PM" },
        { x: 3, y: 8,  label: "4:00 PM"},
        { x: 4, y: 10,  label: "4:30 PM"},
        { x: 5, y: 7,  label: "5:00 PM"},
        { x: 6, y: 6, label: "5:30 PM"},
        { x: 7, y: 19,  label: "6:00 PM"},        
        { x: 8, y: 20,  label: "6:30 PM"}
        ]
      }
      ]
    });

    chart.render();
  }
  </script>
  <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
@endsection