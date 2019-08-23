@extends('admin.layout.base')

@section('title', 'Provider Documents ')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        
        <div class="box box-block bg-white">
            <h5 class="mb-1">Provider Name: {{ $Document->provider->first_name }} {{ $Document->provider->last_name }}</h5>
            <h5 class="mb-1">Document: {{ $Document->document->name }}</h5>
            
			<div class="row">
				<div class="col-sm-8">
					<div class="img_outer" style="    border: 1px solid #ddd; height: 500px;overflow: hidden; margin-bottom: 20px;">
						<img src="{{ asset('storage/app/public/'.$Document->url) }}" style="width: 100% height: 100% display: block;" />
					</div>
				</div>
			</div>
			
            <div class="row">
                <div class="col-xs-6">
                    <form action="{{ route('admin.provider.document.update', [$Document->provider->id, $Document->id]) }}" method="POST">
                        {{ csrf_field() }}
                        {{ method_field('PATCH') }}
                        <button class="btn btn-block btn-primary" type="submit">Approve</button>
                    </form>
                </div>

                <div class="col-xs-6">
                    <form action="{{ route('admin.provider.document.destroy', [$Document->provider->id, $Document->id]) }}" method="POST">
                        {{ csrf_field() }}
                        {{ method_field('DELETE') }}
                        <button class="btn btn-block btn-danger" type="submit">Delete</button>
                    </form>
                </div>
            </div>
        </div>
        
    </div>
</div>
@endsection