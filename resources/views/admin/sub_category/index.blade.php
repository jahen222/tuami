@extends('admin.layout.base')
@section('title', 'Sub Category ')
@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <h5 class="mb-1">Sub Categories</h5>
            <a href="{{ route('admin.sub_category.create') }}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add Sub Category</a>
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Category Name</th>
                        <th>Sub-Category Name</th>
                        <th>Created Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($sub_categories as $index => $service)				
                    <tr>
                        <td>{{ $index + 1 }}</td>                        
                        <td>{{ $service->category_name }}</td>
                        <td>{{ $service->name }}</td>
                        <td>{{ $service->created_at }}</td>
                        <td>
                            <form action="{{ route('admin.sub_category.destroy', $service->id) }}" method="POST">
                                {{ csrf_field() }}
                                {{ method_field('DELETE') }}
                                <a href="{{ route('admin.sub_category.edit', $service->id) }}" class="btn btn-info btn-block">
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
<script type="text/javascript">
function handleSelect(elm)
{
    window.location = elm.value;
}
</script>
@endsection

