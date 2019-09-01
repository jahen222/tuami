@extends('admin.layout.base')

@section('title', 'Service Types ')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <h5 class="mb-1">Membership Plan</h5>

     <div class="container" style="font-size: 23px;position: absolute;z-index: 99;left: 22%;width: 42%;">
  
  
   
  
</div>
            <a href="{{ route('admin.membership.create') }}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New Plan</a>

           
  <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                         <th>Plan Name</th>
                        <th>Plan Price</th>
                        <th>Plan Type</th>
                        <th>Plan Features</th>
                        <th>Created_at</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($services as $index => $service)
                   
                
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>{{ $service->plan_name }}</td>
                        <td>{{ $service->plan_price }}</td>
                        <td>{{ $service->plan_type }}</td>
                        <td>{{ $service->plan_features }}</td>
                        <td>{{ $service->created_at }}</td>
                    
                        
                       
                        <td>
                            <form action="{{ route('admin.membership.destroy', $service->id) }}" method="POST">
                                {{ csrf_field() }}
                                {{ method_field('DELETE') }}
                                <a href="{{ route('admin.membership.edit', $service->id) }}" class="btn btn-info btn-block">
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