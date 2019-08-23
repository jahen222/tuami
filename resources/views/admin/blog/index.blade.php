@extends('admin.layout.base')

@section('title', 'Blog')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <h5 class="mb-1">Blog Post List  -<a href="/blog" target="_blank">see blog </a> </h5>
            <a href="{{ route('admin.blog.create') }}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New</a>
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th style="width: 300px;">Post title </th>
                        
                        <th style="width: 800px;">Description</th>
                       
                        <th >Post Image</th>
                        <th >Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($blog as $index => $service)
					
				
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>{{ $service->title }}</td>
                        <td>{{ $service->description }}</td>
                       
                        <td>
                            @if($service->image) 
                                <img src="{{$service->image}}" style="height: 50px" >
                            @else
                                N/A
                            @endif
                        </td>
                        <td>
                            <form action="{{ route('admin.blog.destroy', $service->id) }}" method="POST">
                                {{ csrf_field() }}
                                {{ method_field('DELETE') }}
                                <a href="{{ route('admin.blog.edit', $service->id) }}" class="btn btn-info btn-block">
                                    <i class="fa fa-pencil"></i> Edit
                                </a>
                                <button class="btn btn-danger btn-block" onclick="return confirm('Are you sure?')">
                                    <i class="fa fa-trash"></i> Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                @endforeach
                </tbody>
               
            </table>
        </div>
    </div>
</div>
@endsection