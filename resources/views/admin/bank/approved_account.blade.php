@extends('admin.layout.base')

@section('title', 'Bank')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <h5 class="mb-1">NeW Account  <a href="/blog" target="_blank"> </a> </h5>
           
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th ">Account Name </th>
                        
                        <th >Bank Name</th>
                       
                        <th >Account Number</th>
                        <th >Routing Number</th>
                        <th >status</th>
                        <th >Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($bank as $index => $service)
					
				
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>{{ $service->account_name }}</td>
                        <td>{{ $service->bank_name }}</td>
                        <td>{{ $service->account_number }}</td>
                        <td>{{ $service->routing_number }}</td>
                        <td>{{ $service->status }}</td>
                       
                    
                        <td>
                           <!--  <form action="{{ route('admin.bank.destroy', $service->id) }}" method="POST"> -->

                             <!-- <form action="#" method="POST"> -->
                                {{ csrf_field() }}
                                {{ method_field('DELETE') }}
                             <!--    <a href="{{ route('admin.bank.edit', $service->id) }}" class="btn btn-info btn-block">
                                    <i class="fa fa-pencil"></i> Edit
                                </a> -->
                                <button class="btn btn-danger btn-block" onclick="return confirm('Are you sure?')">
                                     Approved
                                </button>
                            <!-- </form> -->
                        </td>
                    </tr>
                @endforeach
                </tbody>
               
            </table>
        </div>
    </div>
</div>
@endsection