@extends('admin.layout.base')

@section('title', 'Add Airport Rates')

@section('content')

    <div class="content-area py-1">
        <div class="container-fluid">
            <div class="box box-block bg-white">


                <h5 style="margin-bottom: 2em;">Add Airport Rates</h5>

                <form class="form-horizontal" >
                    {{csrf_field()}}



                    <div class="form-group row">
                        <label for="rates" class="col-xs-2 col-form-label">Extra Rate</label>
                        <div class="col-xs-2">
                            <input class="form-control" type="number" value="" name="rate" required id="expiration" placeholder="Enter rate">
                        </div>
                    </div>


                    <div class="form-group row">
                        <label for="zipcode" class="col-xs-2 col-form-label"></label>
                        <div class="col-xs-10">
                            <button type="submit" class="btn btn-primary">Add Rate</button>
                            <a href="" class="btn btn-default">Cancel</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection
