@extends('user.layout.app')

@section('content')
<div class="container">
	
	@foreach($blog as $k=>$v)
		
		<div class="row">
			<div class="col-md-12">
				<h2 style="margin-left: 10px;">{{$v->title}}</h2>
				<hr style="margin-left: 10px;"/>
			</div>
			<div class="col-md-12">
				<img src="{{$v->image}}" style="width: 97%; margin-left: 10px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);"/>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				{!!  $v->description  !!}
			</div>
		</div>
	
	@endforeach
</div>

@endsection