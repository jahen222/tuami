@extends('store.layout.base')

@section('title', 'Add Items')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <a href="{{ route('store.selling.index') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

            <h5 style="margin-bottom: 1em;">Add Items</h5>

 <form class="form-horizontal" action="{{route('store.selling.store')}}" method="POST" enctype="multipart/form-data" role="form">

     {{ csrf_field() }}

    <!-- <div class="form-group row">
        <label for="sel1" class="col-xs-12 col-form-label">Select list:</label>
        <div class="col-xs-10">
            <select class="form-control" id="sel1" onchange="MainService(this);" name="provider_name" >
             <option value="" >Select Service type</option> 
            <option value="Restaurants" selected="selected">Restaurants</option>
            <option value="Pharmacy">Pharmacy</option>
            <option value="FlowerShop">Flower Shop</option>
            <option value="Tailer">Tailer</option>
            <option value="CoffeeShop">Coffee Shop</option>
            <option value="SuperMarkets">Super Markets</option>
            <option value="Malls">Malls</option>
            <option value="ClothingStore">Clothing Store</option>
            <option value="Library">Library</option>
            </select>
        </div> 
    </div> -->


    <!-- <div class="form-group row" id="carif">        
        <label for="sel1"  class="col-xs-12 col-form-label">Shop Name:</label>
        <div class="col-xs-10">
            <select class="form-control" id="select" onchange="subService(this);" name="service_provider_id">
            </select>
        </div> 

    </div> -->


<!-- <div class="form-group">
                 <div class="col-xs-10">
  <label for="sel1">Select sub categories:</label>
  <select class="form-control" id="selectLevelTwo" > 

   </select>
</div>  

</div>
-->
<!-- <input type="submit" name="g" value="Submit" id="g"> -->


           
               
                <div class="form-group row">
                    <label for="name" class="col-xs-12 col-form-label">Item Name</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ old('name') }}" name="item_name"  id="name" placeholder="Item Name">
                    </div>
                </div>
                
                
                 <div class="form-group row">
                    <label for="name" class="col-xs-12 col-form-label">Item Price</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ old('name') }}" name="item_price"  id="price" placeholder="4">
                    </div>
                </div>
                
                 <div class="form-group row">
                    <label for="name" class="col-xs-12 col-form-label">Quantity</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ old('name') }}" name="quantity"  id="name" placeholder="2">
                    </div>
                </div>
                <!--   <div class="form-group row">
                    <label for="provider_name" class="col-xs-12 col-form-label">Provider Name</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ old('provider_name') }}" name="provider_name"  id="provider_name" placeholder="Provider Name">
                    </div>
                </div> -->

                <div class="form-group row">
                    <label for="picture" class="col-xs-12 col-form-label">Items Image</label>
                    <div class="col-xs-10">
                        <input type="file" accept="image/*" name="image" class="dropify form-control-file" id="picture" aria-describedby="fileHelp">
                    </div>
                </div>
                <div id="notCaretaker">
                <div class="form-group row">
                    <label for="fixed" class="col-xs-12 col-form-label">Base Price ({{ currency() }})</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ old('fixed') }}" name="fixed"  id="fixed" placeholder="Base Price">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="distance" class="col-xs-12 col-form-label">Base Distance (Miles)</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ old('distance')*1.6 }}" name="distance"  id="distance" placeholder="Base Distance">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="minute" class="col-xs-12 col-form-label">Unit Time Pricing ({{ currency() }})</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ old('minute') }}" name="minute"  id="minute" placeholder="Unit Time Pricing">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="price" class="col-xs-12 col-form-label">Unit Distance Price (Miles)</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="text" value="{{ old('price')*1.6 }}" name="price"  id="price" placeholder="Unit Distance Price">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="capacity" class="col-xs-12 col-form-label">Seat Capacity</label>
                    <div class="col-xs-10">
                        <input class="form-control" type="number" value="{{ old('capacity') }}" name="capacity"  id="capacity" placeholder="Capacity">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="calculator" class="col-xs-12 col-form-label">Pricing Logic</label>
                    <div class="col-xs-10">
                        <select class="form-control" id="calculator" name="calculator">
                            <option value="MIN">@lang('servicetypes.MIN')</option>
                            <option value="HOUR">@lang('servicetypes.HOUR')</option>
                            <option value="DISTANCE">@lang('servicetypes.DISTANCE')</option>
                            <option value="DISTANCEMIN">@lang('servicetypes.DISTANCEMIN')</option>
                            <option value="DISTANCEHOUR">@lang('servicetypes.DISTANCEHOUR')</option>
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="description" class="col-xs-12 col-form-label">Description</label>
                    <div class="col-xs-10">
                        <textarea class="form-control" type="number" value="{{ old('description') }}" name="description"  id="description" placeholder="Description" rows="4"></textarea>
                    </div>
                </div>
</div>
                <div class="form-group row">
                    <div class="col-xs-10">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-3">
                                <a href="{{ route('store.selling.index') }}" class="btn btn-danger btn-block">Cancel</a>
                            </div>
                            <div class="col-xs-12 col-sm-6 offset-md-6 col-md-3">
                                <button type="submit" class="btn btn-primary btn-block">Add Item</button>

</form>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
   // var current_latitude = 46.9546486;
  //  var current_longitude = 7.3248304;
    

    var ip_details = {"geoplugin_request":"112.196.186.53","geoplugin_status":200,"geoplugin_delay":"2ms","geoplugin_credit":"Some of the returned data includes GeoLite data created by MaxMind, available from <a href='http:\/\/www.maxmind.com'>http:\/\/www.maxmind.com<\/a>.","geoplugin_city":"Saharanpur","geoplugin_region":"Uttar Pradesh","geoplugin_regionCode":"UP","geoplugin_regionName":"Uttar Pradesh","geoplugin_areaCode":"","geoplugin_dmaCode":"","geoplugin_countryCode":"IN","geoplugin_countryName":"India","geoplugin_inEU":0,"geoplugin_euVATrate":false,"geoplugin_continentCode":"AS","geoplugin_continentName":"Asia","geoplugin_latitude":"29.9667","geoplugin_longitude":"77.55","geoplugin_locationAccuracyRadius":"100","geoplugin_timezone":"Asia\/Kolkata","geoplugin_currencyCode":"INR","geoplugin_currencySymbol":"\u20b9","geoplugin_currencySymbol_UTF8":"\u20b9","geoplugin_currencyConverter":73.8349999999999937472239253111183643341064453125};
    var current_latitude = parseFloat(ip_details.geoplugin_latitude);
    var current_longitude = parseFloat(ip_details.geoplugin_longitude);
    
    
    if( navigator.geolocation ) {
       navigator.geolocation.getCurrentPosition( success, fail );
    } else {
        console.log('Sorry, your browser does not support geolocation services');
        initMap();
    }

    function success(position)
    {

        document.getElementById('long').value = position.coords.longitude;
        document.getElementById('lat').value = position.coords.latitude

        if(position.coords.longitude != "" && position.coords.latitude != ""){
            current_longitude = position.coords.longitude;
            current_latitude = position.coords.latitude;
        }
        initMap();
    }

    function fail()
    {
        // Could not obtain location
        console.log('unable to get your location');
        //initMap();
    }
  
</script> 

 
<script type="text/javascript" src="https://www.wedrive.ch/asset/js/map.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&libraries=places&callback=initMap" async defer></script>
@endsection
