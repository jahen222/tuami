@extends('admin.layout.base')

@section('title', $page)

@section('content')

    <div class="content-area py-1">
        <div class="container-fluid">
            <div class="box box-block bg-white">
            	<h3>Care Statement</h3>

            	<div style="text-align: center;padding: 20px;color: blue;font-size: 24px;">
            		<p><strong>
            			<span>Over All Earning : {{currency($revenue[0]->overall)}}</span>
            			<br>
            			<span>Over All Commission : {{currency($revenue[0]->commission)}}</span>
            		</strong></p>
            	</div>

            	<div class="row">

	            	<div class="col-lg-4 col-md-6 col-xs-12">
						<div class="box box-block bg-success mb-2">
							
							<div class="t-content">
								<h6 class="text-uppercase mb-1">Total No. of Care</h6>
								<h1 class="mb-1">{{$rides->count()}}</h1>
								<span class="font-90">% down from cancelled care</span>
							</div>
						</div>
					</div>


					<div class="col-lg-4 col-md-6 col-xs-12">
						<div class="box box-block bg-success mb-2">
							
							<div class="t-content">
								<h6 class="text-uppercase mb-1">Revenue</h6>
								<h1 class="mb-1">{{currency($revenue[0]->overall)}}</h1>
								<span>from {{$rides->count()}} Care</span>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-xs-12">
						<div class="box box-block bg-success mb-2">
							
							<div class="t-content">
								<h6 class="text-uppercase mb-1">Cancelled Care</h6>
								<h1 class="mb-1">{{$cancel_rides}}</h1>
								<span>for @if($cancel_rides == 0) 0.00 @else {{round($cancel_rides/$rides->count(),2)}}% @endif Care</span>
							</div>
						</div>
					</div>

						<div class="row row-md mb-2" style="padding: 15px;">
							<div class="col-md-12">
									<div class="box bg-white">
										<div class="box-block clearfix">
											<h5 class="float-xs-left">Earnings</h5>
											<div class="float-xs-right">
											</div>
										</div>

										@if(count($rides) != 0)
								            <table class="table table-striped table-bordered dataTable" id="table-2">
								                <thead>
								                   <tr>
														<td>Booking ID</td>
														<td>Driver Location</td>
														<td>User Location</td>
														<td>Care Details</td>
														<td>Commission</td>
														<td>Dated on</td>
														<td>Status</td>
														<td>Earned</td>
													</tr>
								                </thead>
								                <tbody>
								                <?php $diff = ['-success','-info','-warning','-danger']; ?>
														@foreach($rides as $index => $ride)
															<tr>
																<td>{{$ride->booking_id}}</td>
																<td>
																	@if($ride->s_address != '')
																		{{$ride->s_address}}
																	@else
																		Not Provided
																	@endif
																</td>
																<td>
																	@if($ride->d_address != '')
																		{{$ride->d_address}}
																	@else
																		Not Provided
																	@endif
																</td>
																<td>
																	@if($ride->status != "CANCELLED")
																		<a class="text-primary" href="{{route('admin.requests.show',$ride->id)}}"><span class="underline">View Care Details</span></a>
																	@else
																		<span>No Details Found </span>
																	@endif									
																</td>
																<td>{{currency($ride->payment['commision'])}}</td>
																<td>
																	<span class="text-muted">{{date('d M Y',strtotime($ride->created_at))}}</span>
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
																<td>{{currency($ride->payment['fixed'] + $ride->payment['distance'])}}</td>

															</tr>
														@endforeach
															
								                <tfoot>
								                    <tr>
														<td>Booking ID</td>
														<td>Driver Location</td>
														<td>User Location</td>
														<td>Request Details</td>
														<td>Commission</td>
														<td>Dated on</td>
														<td>Status</td>
														<td>Earned</td>
													</tr>
								                </tfoot>
								            </table>
								            @else
								            <h6 class="no-result">No results found</h6>
								            @endif 

									</div>
								</div>

							</div>

            	</div>

            </div>
        </div>
    </div>

@endsection
