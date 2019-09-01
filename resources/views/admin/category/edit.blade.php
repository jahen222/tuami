@extends('admin.layout.base')

@section('title', 'Update Category')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <a href="{{ route('admin.category.index') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

            <h5 style="margin-bottom: 2em;">Update Category</h5>

            <form class="form-horizontal" action="{{route('admin.category.update', $category->id )}}" method="POST" enctype="multipart/form-data" role="form">
                {{csrf_field()}}
				


                <input type="hidden" name="_method" value="PATCH">
                <div class="form-group row">
                    <label for="name" class="col-xs-2 col-form-label">Category Name</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ $category->name }}" name="name" required id="name" placeholder="Category Name">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <a href="{{route('admin.category.index')}}" class="btn btn-danger btn-block">Cancel</a>
                    </div>
                    <div class="col-xs-12 col-sm-6 offset-md-6 col-md-3">
                        <button type="submit" class="btn btn-primary btn-block">Update Category</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection