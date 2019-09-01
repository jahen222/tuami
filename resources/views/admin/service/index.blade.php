@extends('admin.layout.base')
@section('title', 'Store')
@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <h5 class="mb-1">Store</h5>
            <div class="container" style="font-size: 23px;position: absolute;z-index: 99;left: 22%;width: 42%;">
            <select class="form-control form-control-sm" onchange="javascript:handleSelect(this)">
                <option value="service" selected="selected"> see categories </option>
                <option value="service?type=Food" selected="selected">Food</option>
                <option value="service?type=Pharmacy">Pharmacy</option>
                <option value="service?type=Gifts">Gifts</option>
                <option value="service?type=Snack & Juice">Snack & Juice</option>
                <option value="service?type=Super">Super</option>
            </select>
            </div>
            <a href="{{ route('admin.service.create') }}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New Store</a>

            @if(@$_GET['type'] == 'CAR/TRANSFER' || @$_GET['type'] == 'AMBULANCE')
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Store Name</th>
                        <th>Driver Name</th>
                        <th>Capacity</th>
                        <th>Base Price</th>
                        <th>Base Distance</th>
                        <th>Distance Price</th>
                        <th>Time Price</th>
                        <th>Price Calculation</th>
                        <th>Store Image</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($services as $index => $service)
					<?php 
						$dis=distance($service->distance);
						$dis=trim($dis,"Km"); 
					?>				
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td> {{ $service->name }}</td>
                        <td>{{ $service->provider_name }}</td>
                        <td>{{ $service->capacity }}</td>
                        <td>{{ currency($service->fixed) }}</td>
                        <td>{{$dis }}Miles</td>		
                        <td>{{ currency($service->price*1.6) }}</td>
                        <td>{{ currency($service->minute) }}</td>
                        <td>@lang('servicetypes.'.$service->calculator)</td>
                        <td>
                            @if($service->image) 
                                <img src="{{$service->image}}" style="height: 50px" >
                            @else
                                N/A
                            @endif
                        </td>
                        <td>
                            <form action="{{ route('admin.service.destroy', $service->id) }}" method="POST">
                                {{ csrf_field() }}
                                {{ method_field('DELETE') }}
                                <a href="{{ route('admin.service.edit', $service->id) }}" class="btn btn-info btn-block">
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
            @else
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Service Name</th>
                        <th>Driver Name</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th>Store Image</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($services as $index => $service)
                    <?php 
                        $dis=distance($service->distance);
                        $dis=trim($dis,"Km"); 
                    ?>                
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td><a href="service?type={{ $service->name }}"> {{ $service->name }}</a></td>
                        <td>{{ $service->provider_name }}</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>                        
                        <td></td>
                        <td></td>
                        <td>
                            @if($service->image) 
                                <img src="{{$service->image}}" style="height: 50px" >
                            @else
                                N/A
                            @endif
                        </td>
                        <td>
                            <form action="{{ route('admin.service.destroy', $service->id) }}" method="POST">
                                {{ csrf_field() }}
                                {{ method_field('DELETE') }}
                                <a href="{{ route('admin.service.edit', $service->id) }}" class="btn btn-info btn-block">
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
            @endif
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

