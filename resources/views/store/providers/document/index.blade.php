@extends('admin.layout.base')

@section('title', 'Provider Documents ')

@section('content')
<style>
    .ii {
        border: solid black;
        border-width: 0 3px 3px 0;
        display: inline-block;
        padding: 3px;
    }
    
    .iiright {
        transform: rotate(-45deg);
        -webkit-transform: rotate(-45deg);
    }
</style>
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <h5 class="mb-1">Provider Services</h5>
            <div class="row">
                <div class="col-xs-12">
                    @if($ProviderService->count() > 0)
                    <hr><h6>Allocated Services :  </h6>
                    <table class="table table-striped table-bordered dataTable">
                        <thead>
                            <tr>
                                <th>Service Name</th>
                                <th>Certification Name</th>
                                <th>Certification Number</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($ProviderService as $service)
                            <tr>
                                <td>{{ $service->service_type->name }}</td>
                                <td>{{ $service->service_number }}</td>
                                <td>{{ $service->service_model }}</td>
                                <td>
                                    <form action="{{ route('admin.provider.document.service', [$Provider->id, $service->id]) }}" method="POST">
                                        {{ csrf_field() }}
                                        {{ method_field('DELETE') }}
                                        <button class="btn btn-danger btn-large btn-block">Delete</a>
                                    </form>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <td>Service Name</td>
                                <td>Certification Name</td>
                                <td>Certification Number</td>
                                <td>Action</td>
                            </tr>
                        </tfoot>
                    </table>
                    @endif
                    <hr>
                </div>

                @if(@$countService==0)
                <form action="{{ route('admin.provider.document.store', $Provider->id) }}" method="POST">
                    {{ csrf_field() }}
                    <div class="col-xs-3">
                        <select class="form-control input" name="service_type" required>
                            @forelse($ServiceTypes as $Type)
                            <option value="{{ $Type->id }}" >{{ $Type->name }}</option>
                            @empty
                            <option>- Please Create a Service Type -</option>
                            @endforelse
                        </select> 
                    </div>
                    <div class="col-xs-3">
                        <input type="text" required name="service_number" class="form-control" placeholder="Certification Name">
                    </div>
                    <div class="col-xs-3">
                        <input type="text" required name="service_model" class="form-control" placeholder="Certification Number">
                    </div>
                    <div class="col-xs-3">
                        <button class="btn btn-primary btn-block" type="submit">Update</button>
                    </div>
                </form>
          @else

 <h4></b>{{ @$mainCat->provider_name }} <i>>></i> {{ @$mainCat->name }} </b> </h4>

           @foreach(@$ServiceTypesSelected as $getK=>$getV)

         <h4><b>{{ $getK+1 }} . <i style="color:blue">{{ $getV->name }}</i></h4> <br/>


           @endforeach

                <form action="{{ route('admin.provider.document.store', $Provider->id) }}" method="POST">
                    {{ csrf_field() }}
                     <input type="hidden" required name="service_type" class="form-control" value="{{ $mainCat->id }}">
                    
                    <div class="col-xs-3">
                        <input type="text" required name="service_number" class="form-control" placeholder="Certification Name">
                    </div>
                    <div class="col-xs-3">
                        <input type="text" required name="service_model" class="form-control" placeholder="Certification Number">
                    </div>

                    <div class="col-xs-3">
                        <button class="btn btn-primary btn-block" type="submit">Update</button>
                    </div>
                </form>

           @endif

 
            </div>
        </div>

        <div class="box box-block bg-white">
            <h5 class="mb-1">Provider Documents</h5>
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Document Type</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($Provider->documents as $Index => $Document)
                    <tr>
                        <td>{{ $Index + 1 }}</td>
                        <td>{{ $Document->document->name }}</td>
                        <td>{{ $Document->status }}</td>
                        <td>
                            <div class="input-group-btn">
                                <a href="{{ route('admin.provider.document.edit', [$Provider->id, $Document->id]) }}"><span class="btn btn-success btn-large">View</span></a>
                                <button class="btn btn-danger btn-large" form="form-delete">Delete</button>
                                <form action="{{ route('admin.provider.document.destroy', [$Provider->id, $Document->id]) }}" method="POST" id="form-delete">
                                    {{ csrf_field() }}
                                    {{ method_field('DELETE') }}
                                </form>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>Document Type</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
@endsection