@extends('admin.layout.base')

@section('title', 'Update Service Type ')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <a href="{{ route('admin.service.index') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

            <h5 style="margin-bottom: 2em;">Update User</h5>

            <form class="form-horizontal" action="{{route('admin.membership.update', $service->id )}}" method="POST" enctype="multipart/form-data" role="form">
                {{csrf_field()}}
				
           

                <input type="hidden" name="_method" value="PATCH">

                <div class="form-group row">
                    <label for="name" class="col-xs-2 col-form-label">Plan Name</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ $service->plan_name }}" name="plan_name" required id="name" placeholder="Service Name">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="provider_name" class="col-xs-2 col-form-label">Plan Price</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ $service->plan_price }}" name="plan_price" required id="plan_price" placeholder="plan_price">
                    </div>
                </div>


              
             
                 <div class="form-group row">
                    <label for="name" class="col-xs-12 col-form-label">Plan type</label>
                    <div class="col-xs-10">
                        <select class="form-control" name="plan_type" >

                            
                            <option value="free" >Free</option>
                            <option value="basic">Basic</option>
                            <option value="advanced">Advanced</option>

                        </select>
                    </div>
                </div>

              
                <div class="form-group row">
                    <label for="description" class="col-xs-12 col-form-label">Features</label>
                    <div class="col-xs-10">
                        <textarea class="form-control" id="myeditor"  type="number"  name="plan_features" required  placeholder="Features" rows="4">{{ $service->plan_features }}</textarea>
                    </div>
                </div>

             

                <div class="form-group row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <a href="{{route('admin.service.index')}}" class="btn btn-danger btn-block">Cancel</a>
                    </div>
                    <div class="col-xs-12 col-sm-6 offset-md-6 col-md-3">
                        <button type="submit" class="btn btn-primary btn-block">Update</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@section('scripts')
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
<script type="text/javascript">
    CKEDITOR.replace('myeditor');
</script>
@endsection