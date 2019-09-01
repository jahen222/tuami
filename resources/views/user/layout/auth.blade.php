<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>{{ Setting::get('site_title') }}</title>
    <link rel="shortcut icon" type="image/png" href="{{ Setting::get('site_icon') }}">

    <!-- Bootstrap -->

    <link href="{{url('/css/bootstrap.css')}}" rel="stylesheet">
    <link href="{{url('/css/custom.css')}}" rel="stylesheet">  
    <link href="{{url('/css/hamburgers.css')}}" rel="stylesheet">
    <link href="{{url('/css/owl.carousel.css')}}" rel="stylesheet">
<link href="{{url('/css/owl.theme.css')}}" rel="stylesheet">
  </head>
  <body>
		
		@include('user.layout.templateparts.website_header')
		
		@yield('content')
		
		@include('user.layout.templateparts.website_footer')
		
		
        <!--script src="{{asset('asset/js/jquery.min.js')}}"></script>
        <script src="{{asset('asset/js/bootstrap.min.js')}}"></script>
        <script src="{{asset('asset/js/scripts.js')}}"></script-->

        @yield('scripts')
    
</body>
</html>