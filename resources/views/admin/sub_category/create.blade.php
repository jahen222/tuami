@extends('admin.layout.base')
@section('title', 'Add Sub Category')
@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <a href="{{ route('admin.sub_category.index') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

            <h5 style="margin-bottom: 2em;">Add Sub Category</h5>

			<form class="form-horizontal" action="{{route('admin.sub_category.store')}}" method="POST" enctype="multipart/form-data" role="form">
				{{ csrf_field() }}
                <div class="form-group row">
                    <label for="name" class="col-xs-12 col-form-label"> Name</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ old('name') }}" name="name"  id="name" placeholder="Sub Category Name">
                    </div>
                </div>
				<div class="form-group row">
                    <label for="sub_category" class="col-xs-12 col-form-label">Category</label>
                    <div class="col-xs-10">
						<select class="form-control" name="category">
							<option class="form-control" value="" Category</option>
							@foreach($category_list as $category)
							<option class="form-control" value="{{$category->id}},{{$category->name}}">{{$category->name}}</option>
							@endforeach
						</select>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-xs-10">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-3">
                                <a href="{{ route('admin.sub_category.index') }}" class="btn btn-danger btn-block">Cancel</a>
                            </div>
                            <div class="col-xs-12 col-sm-6 offset-md-6 col-md-3">
                                <button type="submit" class="btn btn-primary btn-block">Add Sub Category</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div> 
<script type="text/javascript" src="https://www.wedrive.ch/asset/js/map.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&libraries=places&callback=initMap" async defer></script>
@endsection
