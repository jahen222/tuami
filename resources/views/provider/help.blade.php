@extends('provider.layout.app')

@section('title', 'Help ')

@section('content')

<div class="content-area py-1">
    <div class="container-fluid">

        <div class="box box-block bg-white">
            <div class="row no-margin ride-detail">
               <div class="col-md-12"> 
                @if($helps->count() > 0)

                    <table class="table table-condensed" style="border-collapse:collapse;">

                        <thead>
                            <tr>
                                <th colspan="2"><h5>Helps</h5></th>
                            </tr>
                        </thead>

                        <tbody>
                        @foreach($helps as $help)

                            <tr data-toggle="collapse" data-target="#help_{{$help->help_id}}" class="accordion-toggle collapsed">
                                <td class="col-md-11">{{ strip_tags($help->description) }}</td>
            
                            </tr>

                        @endforeach

                        </tbody>
                    </table>
                    @else
                        <hr>
                        <p style="text-align: center;">No Helps Available</p>
                    @endif
                </div>
            </div>
        </div>    

    </div>
</div>
@endsection