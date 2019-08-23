@extends('admin.layout.base')

@section('title', 'Add Service Type ')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <a href="{{ route('admin.membership.index') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

            <h5 style="margin-bottom: 2em;">Add Membership Plan</h5>

 <form class="form-horizontal" action="{{route('admin.membership.store')}}" method="POST" enctype="multipart/form-data" role="form">

     {{ csrf_field() }}

           



           
               
                <div class="form-group row">
                    <label for="name" class="col-xs-12 col-form-label">Plan Name</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ old('plan_name') }}" name="plan_name"  id="name" placeholder="Plan Name">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="name" class="col-xs-12 col-form-label">Plan Price</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ old('plan_price') }}" name="plan_price"  id="plan_price" placeholder="Plan Price">
                    </div>
                </div>


                 <div class="form-group row">
                    <label for="name" class="col-xs-12 col-form-label">Plan type</label>
                    <div class="col-xs-10">
                        <select class="form-control" name="plan_type" >

                            <option>select plan type</option>
                            <option value="free">Free</option>
                            <option value="basic">Basic</option>
                            <option value="advanced">Advanced</option>

                        </select>
                    </div>
                </div>



                <div class="form-group row">
                    <label for="description" class="col-xs-12 col-form-label">Features</label>
                    <div class="col-xs-10">
                        <textarea class="form-control" id="myeditor"  type="number"  name="plan_features" required  placeholder="Features" rows="4">{{ old('plan_features') }}</textarea>
                    </div>
                </div>

  
                <div class="form-group row">
                    <div class="col-xs-10">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-3">
                                <a href="{{ route('admin.membership.index') }}" class="btn btn-danger btn-block">Cancel</a>
                            </div>
                            <div class="col-xs-12 col-sm-6 offset-md-6 col-md-3">
                                <button type="submit" class="btn btn-primary btn-block">Submit</button>

</form>
                            </div>
                        </div>
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