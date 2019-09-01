@extends('provider.layout.auth')

<!-- Main Content -->
@section('content')

<div style="background-color:#ccc">
	<div class="container">
		<div class="signin_page">
			<div class="text-center">
				<a class="log-blk-btn" href="{{url('/provider/login')}}">ALREADY HAVE AN ACCOUNT?</a>
				<h4>Reset Password</h4>
			</div>
			@if (session('status'))
				<div class="alert alert-success">
					{{ session('status') }}
				</div>
			@endif
			<div style="margin-bottom: 20px;">
				<div class="clearfix"></div>
				<form role="form" method="POST" action="{{ url('/provider/password/email') }}">
					{{ csrf_field() }}

					<div class="col-md-12" style="margin-top: 30px;">
						<input type="email" class="form-control" name="email" placeholder="Email Address" value="{{ old('email') }}">

						@if ($errors->has('email'))
							<span class="help-block">
								<strong>{{ $errors->first('email') }}</strong>
							</span>
						@endif                        
					

						<div class="facebook_btn">
							<button value="submit" class="btn btn-default btn-arrow-left" style="width: 471px;">SEND PASSWORD RESET LINK </button>
							<figure><img src="{{url('img/btn_arrow.png')}}" alt="img"/></figure>
						</div>  
					</div>  
				</form>  
				<div class="clearfix"></div>
			</div>
		</div>
	 </div>
 </div>

@endsection


