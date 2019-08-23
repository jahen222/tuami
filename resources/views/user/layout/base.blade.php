<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{ Setting::get('site_title') }}</title>
    <link rel="shortcut icon" type="image/png" href="{{ Setting::get('site_icon') }}">

    <link href="{{asset('asset/css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{asset('asset/font-awesome/css/font-awesome.min.css')}}" rel="stylesheet">
    <link href="{{asset('asset/css/slick.css')}}" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{{asset('asset/css/slick-theme.css')}}"/>
    <link href="{{asset('asset/css/bootstrap-datepicker.min.css')}}" rel="stylesheet">
    <link href="{{asset('asset/css/bootstrap-timepicker.css')}}" rel="stylesheet">

    <link href="{{asset('asset/css/dashboard-style.css')}}" rel="stylesheet">

<!-- from admin-->
    <link rel="stylesheet" href="{{ asset('main/assets/css/core.css') }}">
    <link rel="stylesheet" href="{{asset('main/vendor/DataTables/Responsive/css/responsive.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('main/vendor/themify-icons/themify-icons.css')}}">
    <link rel="stylesheet" href="{{asset('main/vendor/animate.css/animate.min.css')}}">
    <link rel="stylesheet" href="{{asset('main/vendor/jscrollpane/jquery.jscrollpane.css')}}">

    @yield('styles')
</head>

<body class="fixed-sidebar fixed-header content-appear skin-default">

    <div class="wrapper">
        <div class="preloader"></div>
        <div class="site-overlay"></div>
        @include('user.include.header')

        <div class="page-content dashboard-page">    
            <div class="site-content">
                
                @include('user.include.nav')
                <div style="margin-top: -70px">
                    @yield('content')
                </div>

                <!--@include('user.include.footer')-->
            </div>
        </div>
    </div>    

    <script src="{{asset('asset/js/jquery.min.js')}}"></script>
    <script src="{{asset('asset/js/bootstrap.min.js')}}"></script>       
    <script type="text/javascript" src="{{asset('asset/js/jquery.mousewheel.js')}}"></script>
    <script type="text/javascript" src="{{asset('asset/js/jquery-migrate-1.2.1.min.js')}}"></script> 
    <script type="text/javascript" src="{{asset('asset/js/slick.min.js')}}"></script>
    <script src="{{asset('asset/js/bootstrap-datepicker.min.js')}}"></script>
    <script src="{{asset('asset/js/bootstrap-timepicker.js')}}"></script>
    <script src="{{asset('asset/js/dashboard-scripts.js')}}"></script>

    <!-- Neptune JS -->
    <script type="text/javascript" src="{{asset('main/assets/js/app.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/assets/js/demo.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/assets/js/tables-datatable.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/assets/js/forms-upload.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/waves/waves.min.js')}}"></script>

    <!-- <script type="text/javascript" src="{{asset('main/vendor/jscrollpane/jquery.mousewheel.js')}}"></script> -->
    <!-- <script type="text/javascript" src="{{asset('main/vendor/jscrollpane/mwheelIntent.js')}}"></script> -->
    <script type="text/javascript" src="{{asset('main/vendor/jscrollpane/jquery.jscrollpane.min.js')}}"></script>

    <script type="text/javascript">
       

        //if(jQuery.browser.mobile == false) {
            
            function initScroll(){
                $('.custom-scroll').jScrollPane({
                    autoReinitialise: true,
                    autoReinitialiseDelay: 100
                });
            }

            initScroll();

            $(window).resize(function() {
                initScroll();
            });
        //}

        /* Scroll - if mobile */
        if(jQuery.browser.mobile == true) {
            $('.custom-scroll').css('overflow-y','scroll');
        }
    </script>

    @yield('scripts')
    
</body>
</html>