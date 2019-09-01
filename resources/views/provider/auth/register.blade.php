@extends('provider.layout.auth')

@section('content')

<div>
	<div class="container">
		<div class="signin_page">
			<div class="text-center">
				<a class="log-blk-btn" href="{{ url('/provider/login') }}">ALREADY REGISTERED?</a>
			</div>
			
			<form role="form" method="POST" id="register_form" style="margin-top: 20px;" action="{{ url('/provider/register') }}">
			   {{ csrf_field() }} 

				  <label>Name</label>
				  <input id="first_name" type="text" class="form-control" name="first_name" value="{{ old('first_name') }}" placeholder="Name" autofocus>

				  @if ($errors->has('first_name'))
					<span class="help-block">
						<strong>{{ $errors->first('first_name') }}</strong>
					</span>
				  @endif

				  <!-- <label>Last Name</label>
				  <input id="last_name" type="text" class="form-control" name="last_name" value="{{ old('last_name') }}" placeholder="Last Name">

				  @if ($errors->has('last_name'))
					  <span class="help-block">
						  <strong>{{ $errors->first('last_name') }}</strong>
					  </span>
				  @endif -->

				  <label>Phone Number</label>
				  
				  <input type="text" autofocus id="phone_number" class="form-control" placeholder="+1" name="phone_number" value="{{ old('phone_number') }}" />
				  
				  @if ($errors->has('phone_number'))
					  <span class="help-block">
						  <strong>{{ $errors->first('phone_number') }}</strong>
					  </span>
				  @endif

				  <label>E-Mail Address</label>
				  <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" placeholder="E-Mail Address">

				  @if ($errors->has('email'))
					  <span class="help-block">
						  <strong>{{ $errors->first('email') }}</strong>
					  </span>
				  @endif

				  <label>Password</label>
				  <input id="password" type="password" class="form-control" name="password" placeholder="Password">

				  @if ($errors->has('password'))
					  <span class="help-block">
						  <strong>{{ $errors->first('password') }}</strong>
					  </span>
				  @endif

				  <label>Confirm Password</label>
				  <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="Confirm Password">

				  @if ($errors->has('password_confirmation'))
					  <span class="help-block">
						  <strong>{{ $errors->first('password_confirmation') }}</strong>
					  </span>
				  @endif

				<div class="provider_type">
					<label>Vehicle Type</label>
					<select class="form-control" name="provider_type" id="service_type" required>												
					</select>
					 @if ($errors->has('provider_type'))
					  <span class="help-block">
						  <strong>{{ $errors->first('provider_type') }}</strong>
					  </span>
					@endif
				</div>
				
				<div class="vehicle_no">
					<label>Vehicle Plate No.</label>
					<input class="form-control" type="text" name="vehicle_no" value="{{ old('vehicle_no') }}"  placeholder="Enter Vehicle Plate No." required/>
				</div>
				
		      <div class="vehicle_model">
					<label>Vehicle Model</label>
					<input class="form-control" type="text" name="vehicle_model" value="{{ old('vehicle_model') }}"  placeholder="Enter Vehicle Model" required/>
				</div>
			
				<div class="acknoledge">
					<p><small>By clicking "Sign Up", you agree to Carecrew's <a href="{{ url('/terms') }}">Terms of Use</a> and acknowledge you have read the <a href="{{ url('/privacy') }}">Privacy Policy.</a></small></p>
				</div>
				 
				<div class="facebook_btn">
					<button type="submit" value="submit" class="btn btn-default btn-arrow-left">Register </button>
					<figure><img src="{{url('img/btn_arrow.png')}}" alt="img"/></figure>
				</div>    
			</form>                               
		</div>
	</div>
</div>
@endsection


@section('scripts')
 <script>
	
	var form = $('#register_form');
	
	$( window ).load(function() {

		var html = '';
			 
			$.ajax({
				headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
				url: "{{  url('ajax-handler/get_service') }}",
				type: 'POST',
				success: function ( json ) {
					
					var vehicle_type = json;
					html+='<option value="">Select Vehicle Type</option>';
					if(vehicle_type) {
						for( var i in vehicle_type ) {
						
							html += '<option value="'+vehicle_type[i].id+'">'+vehicle_type[i].name+'</option>';
						}
					}
					$('#service_type').empty().html(html);
				}
			});

			
		
		
	});
	

</script>


@endsection