@extends('user.layout.app')@section('content')	
<div class="container">		
<div class="row">			
<div class="col-md-12">	
<div class="col-md-6">
<div>					
<p style="font-size: 4em; width: 100%;margin-top: 150px;"><b>Start Deliver  Your Goods From One Place To Another Place</b></p>
<p style="font-size: 1.8em;">Deliver your goods without any hassle.</p>
<div class="driver_signup">
<a  href="{{ url('/user_sign') }}" class="btn btn-default">sign in <figure><img src="img/btn_arrow.png" alt="img"/></figure></a>
</div>
</div>
</div>	

<div class="col-md-6">
<div>					
<p style="font-size: 1.2em; width: 100%;"><img src="{{asset('public/firstimage.png')}}" alt="User Request" style="width: 100%;" /></p></div>
</div>			

		
</div>	

</div>
</div>

@endsection