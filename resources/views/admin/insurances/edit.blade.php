@extends('admin.layout.base')

@section('title', 'Update Insurance')

@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">
    	    <a href="{{ route('admin.insurance.index') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

			<h5 style="margin-bottom: 2em;">Update Insurance</h5>

            <form class="form-horizontal" action="{{route('admin.insurance.update', $insuranced->insurance_id )}}" method="POST" enctype="multipart/form-data" role="form">
            	{{csrf_field()}}
            	<input type="hidden" name="_method" value="PATCH">
				<div class="form-group row">
					<label for="first_name" class="col-xs-2 col-form-label">First Name</label>
					<div class="col-xs-10">
						<input class="form-control" type="text" value="{{ $insuranced->name }}" name="name" required id="first_name" placeholder="Insurance name">
					</div>
				</div>

				<div class="form-group row">
					<label for="last_name" class="col-xs-2 col-form-label">Last Name</label>
					<div class="col-xs-10">
						<input class="form-control" type="text" value="{{ $insuranced->price }}" name="price" required id="name" placeholder="price">
					</div>
				</div>


				

				<div class="form-group row">
					<label for="zipcode" class="col-xs-2 col-form-label"></label>
					<div class="col-xs-10">
						<button type="submit" class="btn btn-primary">Update Insurance</button>
						<a href="{{route('admin.insurance.index')}}" class="btn btn-default">Cancel</a>
					</div>
				</div>
			</form>
		</div>
    </div>
</div>

@endsection
