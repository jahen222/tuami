@extends('store.layout.base')

@section('title', 'Dashboard ')

@section('styles')
    <link rel="stylesheet" href="{{asset('main/vendor/jvectormap/jquery-jvectormap-2.0.3.css')}}">
@endsection

@section('content')

<div class="content-area py-1">
<div class="container-fluid">
    <div class="row row-md">
        <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="box box-block bg-success mb-2">
                <div class="t-content">
                    <h5 class="text-uppercase mb-1">Total Order</h5>
                    <h5 class="mb-1">0</h5>
                </div>
            </div>
        </div>
        
        <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="box box-block bg-warning mb-2">
                <div class="t-content">
                    <h5 class="text-uppercase mb-1">Complated Order</h5>
                    <h5 class="mb-1">0</h5>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="box box-block bg-danger mb-2">
                <div class="t-content">
                    <h5 class="text-uppercase mb-1">Pending Order</h5>
                    <h5 class="mb-1">0</h5>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="box box-block bg-success mb-2">
                <div class="t-content">
                    <h5 class="text-uppercase mb-1">Cancelled Order</h5>
                    <h5 class="mb-1">0</h5>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="box box-block bg-primary mb-2">
                <div class="t-content">
                    <h5 class="text-uppercase mb-1">Revenue</h5>
                    <h5 class="mb-1">0</h5>
                </div>
            </div>
        </div>
        
    </div>

  

    </div>

    
</div>
@endsection

@section('scripts')
    <script type="text/javascript">
  window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {
      title:{
        text: ""    
      },
      axisY: {
        title: "Earning"
      },
      legend: {
        verticalAlign: "bottom",
        horizontalAlign: "center"
      },
      data: [

      {        
        color: "#B0D0B0",
        type: "column",  
        showInLegend: true, 
        legendMarkerType: "none",
        legendText: "Timing",
        dataPoints: [      
        { x: 1, y: 14, label: "3:00 PM"},
        { x: 2, y: 12,  label: "3:30 PM" },
        { x: 3, y: 8,  label: "4:00 PM"},
        { x: 4, y: 10,  label: "4:30 PM"},
        { x: 5, y: 7,  label: "5:00 PM"},
        { x: 6, y: 6, label: "5:30 PM"},
        { x: 7, y: 19,  label: "6:00 PM"},        
        { x: 8, y: 20,  label: "6:30 PM"}
        ]
      }
      ]
    });

    chart.render();
  }
  </script>
  <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
@endsection