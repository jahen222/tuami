@extends('admin.layout.base')

@section('title', 'Insurance ')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <h5 class="mb-1">
                
Insurances                @if(Setting::get('demo_mode', 0) == 1)
                <span class="pull-right">(*personal information hidden in demo)</span>
                @endif
            </h5>
            <a href="{{ route('admin.insurance.create') }}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New Insurances</a>
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Insurance Name</th>
                        <th>Insurance price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($InsurancesData as $index => $insurance)
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>{{ $insurance->name }}</td>
                        <td>{{ $insurance->price }}</td>
                        <td>
                            <form action="{{ route('admin.insurance.destroy', $insurance->insurance_id) }}" method="POST">
                                {{ csrf_field() }}
                                <input type="hidden" name="_method" value="DELETE">
                                
                                <a href="{{ route('admin.insurance.edit', $insurance->insurance_id) }}" class="btn btn-info"><i class="fa fa-pencil"></i> Edit</a>
                                <button class="btn btn-danger" onclick="return confirm('Are you sure?')"><i class="fa fa-trash"></i> Delete</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
				<tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Insurance Name</th>
                        <th>Insurance price</th>
                        <th>Action</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
@endsection