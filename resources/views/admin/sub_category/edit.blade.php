@extends('admin.layout.base')

@section('title', 'Update Sub Category')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <a href="{{ route('admin.sub_category.index') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

            <h5 style="margin-bottom: 2em;">Update Sub Category</h5>
            <form class="form-horizontal" action="{{route('admin.sub_category.store')}}" method="POST" enctype="multipart/form-data" role="form"> {{ csrf_field() }}
				<input type="hidden" value="{{ $sub_category->id }}" name="updated_id" />
                <div class="form-group row">
                    <label for="name" class="col-xs-12 col-form-label"> Name</label>
                    <div class="col-xs-10">
						<input class="form-control" type="text" value="{{ $sub_category->name }}" name="name" id="name" placeholder="Sub Category Name"> 
					</div>
                </div>
                <div class="form-group row">
                    <label for="sub_category" class="col-xs-12 col-form-label">Category</label>
                    <div class="col-xs-10">
                        <select class="form-control" name="category">
                            <option class="form-control" value="">Category</option>
							@foreach($category_list as $category)
							@if($category->id == $sub_category->category_id)
								<option class="form-control" value="{{$category->id}},{{$category->name}}" selected>{{$category->name}}</option>
							@else
								<option class="form-control" value="{{$category->id}},{{$category->name}}">{{$category->name}}</option>
							@endif
							@endforeach
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-xs-10">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-3"> <a href="{{ route('admin.sub_category.index') }}" class="btn btn-danger btn-block">Cancel</a> </div>
                            <div class="col-xs-12 col-sm-6 offset-md-6 col-md-3">
                                <button type="submit" class="btn btn-primary btn-block">Update Sub Category</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection