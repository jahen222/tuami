@extends('admin.layout.base')

@section('title', 'Category ')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <h5 class="mb-1">Categories</h5>
            <div class="container" style="font-size: 23px;position: absolute;z-index: 99;left: 22%;width: 42%;"> 
            </div>
            <a href="{{ route('admin.category.create') }}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New Category</a>

            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Category Name</th>
                        <th>Created date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($category as $index => $service)
					<?php 
						$dis=distance($service->distance);
						$dis=trim($dis,"Km"); 
					?>
				
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td> {{ $service->name }}</td>
                        <td> {{ $service->created_at }}</td>
                        <td>
                            <form action="{{ route('admin.category.destroy', $service->id) }}" method="POST">
                                {{ csrf_field() }}
                                {{ method_field('DELETE') }}
                                <a href="{{ route('admin.category.edit', $service->id) }}" class="btn btn-info btn-block" style="width:100px;">
                                    <i class="fa fa-pencil"></i> Edit
                                </a>
                                <button class="btn btn-danger btn-block" onclick="return confirm('Are you sure?')" style="width:100px;">
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



<script type="text/javascript">
function handleSelect(elm)
{
window.location = elm.value;
}
</script>

@endsection

