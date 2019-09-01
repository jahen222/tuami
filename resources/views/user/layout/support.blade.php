@extends('user.layout.app')


@section('content')

	<div class="container">

		<div class="row">

			<div class="col-md-12">

                          <div class="col-md-6">
<p style="font-size: 1.2em; width: 100%;margin-top: 90px;"><h3>Call [24/7] </h3></p>
<hr>
Call: +1-800-674-3729

<p style="font-size: 1.2em; width: 100%;margin-top: 38px;"><h3>Email [24/7] </h3></p>
<hr>
Email: support@tuami.com

<p style="font-size: 1.2em; width: 100%;margin-top: 38px;"><h3>Live Chat [24/7] </h3></p>
<hr>
Live Chat: <a href="#"  style="text-decoration: none" onclick="myFunction()">Click Here</a>

<p style="font-size: 1.2em; width: 100%;margin-top: 38px;"><h3>View Your Ticket Update</h3></p>
<hr>
Click Here



                          </div>


                          <div class="col-md-6">
<img src="{{url('img/support.png')}}" alt="support" />
					
</div>

			</div>

		</div>

	</div>

	<script>
function myFunction() {
    var myWindow = window.open("https://tawk.to/chat/5bc5a6eb08387933e5bb7716/default", "", "width=1100,height=800");
}
</script>

@endsection