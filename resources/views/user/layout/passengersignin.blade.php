@extends('user.layout.app')

@section('content')
	<div style="background-color:#ccc">
		<div class="container">
			<div class="signin_page">
				<h4 class="text-center">Sign In</h4> 				
				<form role="form" method="POST" action="{{ url('/login') }}">
					{{ csrf_field() }}  
					<label>Email</label>
					<input id="email" name="email" class="form-control" type="text" placeholder="Email" value="{{ old('email') }}" required > 

					@if ($errors->has('email'))
						<span class="help-block">
							<strong>{{ $errors->first('email') }}</strong>
						</span>
					@endif

					<label>Password</label> 
					<input id="password" name="password" class="form-control" type="password" placeholder="Password" required>

					@if ($errors->has('password'))
						<span class="help-block">
							<strong>{{ $errors->first('password') }}</strong>
						</span>
					@endif

					<div class="facebook_btn">
						<a href="{{ url('provider/auth/facebook') }}"><button value="submit" class="btn btn-default btn-arrow-left">next </button>
						<figure><img src="img/btn_arrow.png" alt="img"/></figure></a>
					</div>    
					<p>Don't have an account? <a href="{{ url('/register') }}">sign up</a></p>
					<p class="helper"><a href="{{ url('/password/reset') }}">Forgot Your Password?</a></p>

				</form>                               
			</div>
		</div>
	</div>
@endsection