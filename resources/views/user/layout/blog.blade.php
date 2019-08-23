@extends('user.layout.app')


@section('content')

	<div class="container">

		<div class="row">

			<div class="col-md-12">
<h2>Blog</h2>
<hr>


@foreach($blog as $k=>$v)

			<div class="col-md-6">
                        <a href="description?id={{$v->id}}"><img src="{{$v->image}}" style="width: 97%; margin-top:20px;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);"/></a>
<h4><a href="description?id={{$v->id}}" style="margin-top:20px;">{{$v->title}}</a> {{ date("d-M-Y", strtotime($v->created_at)) }}</h4>
                        </div>	
                        
                      @endforeach

			</div>

		</div>

	</div>

@endsection