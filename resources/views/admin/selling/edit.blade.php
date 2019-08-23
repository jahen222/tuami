@extends('admin.layout.base')

@section('title', 'Update Items ')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <a href="{{ route('admin.selling.index') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

            <h5 style="margin-bottom: 2em;">Update User</h5>

            <form class="form-horizontal" action="{{route('admin.selling.update', $service->id )}}" method="POST" enctype="multipart/form-data" role="form">
                {{csrf_field()}}
				


                <input type="hidden" name="_method" value="PATCH">
                <div class="form-group row">
                    <label for="name" class="col-xs-2 col-form-label">Items Name</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ $service->item_name }}" name="item_name" required id="name" placeholder="Items Name">
                    </div>
                </div>

                <!--<div class="form-group row">-->
                <!--    <label for="provider_name" class="col-xs-2 col-form-label">Provider Name</label>-->
                <!--    <div class="col-xs-10">-->
                <!--        <input class="form-control" type="text" value="{{ $service->provider_name }}" name="provider_name" required id="provider_name" placeholder="Provider Name" disabled="disabled">-->
                <!--    </div>-->
                <!--</div>-->

                <div class="form-group row">
                    
                    <label for="image" class="col-xs-2 col-form-label">Picture</label>
                    <div class="col-xs-10">
                        @if(isset($service->image))
                        <img style="height: 90px; margin-bottom: 15px; border-radius:2em;" src="{{ $service->image }}">
                        @endif
                        <input type="file" accept="image/*" name="image" class="dropify form-control-file" id="image" aria-describedby="fileHelp">
                    </div>
                </div>

              

                <div class="form-group row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <a href="{{route('admin.selling.index')}}" class="btn btn-danger btn-block">Cancel</a>
                    </div>
                    <div class="col-xs-12 col-sm-6 offset-md-6 col-md-3">
                        <button type="submit" class="btn btn-primary btn-block">Update Items</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection