@extends('admin.layout.base')

@section('title', 'Add Insurance ')

@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">
            <a href="{{ route('admin.insurance.index') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

			<h5 style="margin-bottom: 2em;">Add Insurance</h5>

            <form class="form-horizontal" action="{{route('admin.insurance.store')}}" method="POST" enctype="multipart/form-data" role="form">
            	{{csrf_field()}}
				<div class="form-group row">
					<label for="first_name" class="col-xs-12 col-form-label">Insurance Name</label>
					<div class="col-xs-10">
						<input class="form-control" type="text" value="{{ old('name') }}" name="name" required id="first_name" placeholder="Insurance Name">
					</div>
				</div>

				<div class="form-group row">
					<label for="last_name" class="col-xs-12 col-form-label">Insurance Price</label>
					<div class="col-xs-10">
						<input class="form-control" type="text" value="{{ old('price') }}" name="price" required id="last_name" placeholder="Insurance Name">
					</div>
				</div>

				


				<div class="form-group row">
					<label for="zipcode" class="col-xs-12 col-form-label"></label>
					<div class="col-xs-10">
						<button type="submit" class="btn btn-primary">Add Insurance</button>
						<a href="{{route('admin.insurance.index')}}" class="btn btn-default">Cancel</a>
					</div>
				</div>
			</form>
		</div>
    </div>
</div>

@endsection
