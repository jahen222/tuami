<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Title -->
    <!--title>@yield('title'){{ Setting::get('site_title', 'Insta Cab') }}</title-->
    <title>{{ Setting::get('site_title') }}</title>
    <link rel="shortcut icon" type="image/png" href="{{ Setting::get('site_icon') }}">

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="{{asset('main/vendor/bootstrap4/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('main/vendor/themify-icons/themify-icons.css')}}">
    <link rel="stylesheet" href="{{asset('main/vendor/font-awesome/css/font-awesome.min.css')}}">
    <link rel="stylesheet" href="{{asset('main/vendor/animate.css/animate.min.css')}}">
    <link rel="stylesheet" href="{{asset('main/vendor/jscrollpane/jquery.jscrollpane.css')}}">
    <link rel="stylesheet" href="{{asset('main/vendor/waves/waves.min.css')}}">
    <link rel="stylesheet" href="{{asset('main/vendor/switchery/dist/switchery.min.css')}}">
    <link rel="stylesheet" href="{{asset('main/vendor/DataTables/css/dataTables.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('main/vendor/DataTables/Responsive/css/responsive.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('main/vendor/DataTables/Buttons/css/buttons.dataTables.min.css')}}">
    <link rel="stylesheet" href="{{asset('main/vendor/DataTables/Buttons/css/buttons.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css">
    <link rel="stylesheet" href="{{ asset('main/vendor/dropify/dist/css/dropify.min.css') }}">
    <link rel="stylesheet" href="{{ asset('main/assets/css/core.css') }}">

    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script>
        window.Laravel = <?php echo json_encode([
            'csrfToken' => csrf_token(),
        ]); ?>
    </script>
    <style type="text/css">
        .rating-outer span,
        .rating-symbol-background {
            color: #ffe000!important;
        }
        .rating-outer span,
        .rating-symbol-foreground {
            color: #ffe000!important;
        }
    </style>
    @yield('styles')
</head>
<body class="fixed-sidebar fixed-header content-appear skin-1">

    <div class="wrapper">
        <div class="preloader"></div>
        <div class="site-overlay"></div>

        @include('admin.include.nav')

        @include('admin.include.header')

        <div class="site-content">

            @include('common.notify')

            @yield('content')

            @include('admin.include.footer')

        </div>
    </div>

    <!-- Vendor JS -->
    <script type="text/javascript" src="{{asset('main/vendor/jquery/jquery-1.12.3.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/tether/js/tether.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/bootstrap4/js/bootstrap.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/detectmobilebrowser/detectmobilebrowser.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/jscrollpane/jquery.mousewheel.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/jscrollpane/mwheelIntent.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/jscrollpane/jquery.jscrollpane.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/jquery-fullscreen-plugin/jquery.fullscreen')}}-min.js"></script>
    <script type="text/javascript" src="{{asset('main/vendor/waves/waves.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/DataTables/js/jquery.dataTables.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/DataTables/js/dataTables.bootstrap4.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/DataTables/Responsive/js/dataTables.responsi')}}ve.min.js"></script>
    <script type="text/javascript" src="{{asset('main/vendor/DataTables/Responsive/js/responsive.bootstra')}}p4.min.js"></script>
    <script type="text/javascript" src="{{asset('main/vendor/DataTables/Buttons/js/dataTables.buttons')}}.min.js"></script>
    <script type="text/javascript" src="{{asset('main/vendor/DataTables/Buttons/js/buttons.bootstrap4')}}.min.js"></script>
    <script type="text/javascript" src="{{asset('main/vendor/DataTables/JSZip/jszip.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/DataTables/pdfmake/build/pdfmake.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/DataTables/pdfmake/build/vfs_fonts.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/DataTables/Buttons/js/buttons.html5.min.js')}}"></script>

    <script type="text/javascript" src="{{asset('main/vendor/DataTables/Buttons/js/buttons.print.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/DataTables/Buttons/js/buttons.colVis.min.js')}}"></script>

    <script type="text/javascript" src="{{asset('main/vendor/switchery/dist/switchery.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/vendor/dropify/dist/js/dropify.min.js')}}"></script>

    <!-- Neptune JS -->
    <script type="text/javascript" src="{{asset('main/assets/js/app.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/assets/js/demo.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/assets/js/tables-datatable.js')}}"></script>
    <script type="text/javascript" src="{{asset('main/assets/js/forms-upload.js')}}"></script>


    @yield('scripts')

    <script type="text/javascript" src="{{asset('asset/js/rating.js')}}"></script>    
    <script type="text/javascript">

    var MainServiceData = null;
    $('#notCaretaker').hide();
    $('#carif').hide();

    function MainService(data){
     
    var providerName = data.value;
    MainServiceData = data.value;

    if(providerName !== 'CARETAKER'){

        $('#notCaretaker').hide();
        $('#carif').show();
    }
    else{
        $('#notCaretaker').show();
        $('#carif').hide();
    }

        console.log(providerName);

        $.ajax({
            url: "/taumi/admin/getSubCategories?provider_name="+providerName,cache: false,
            beforeSend: function(xhr){xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');},
             success: function(result){                      
            console.log(result); 
             $('#select').empty();

              $('#select').append(
                        $('<option>').text('Select Shop').attr('value', '')
                        );

             $.each(result, function(i, obj){
               // console.log(obj);
                    $('#select').append(
                       $('<option>').text(obj.name).attr('value', obj.id)
                        );
            });  

            //  $('#select').append(
            //             $('<option>').text('Add New ..').attr('value', 'newsub')
            //             );

        },
          
          error: function(XMLHttpRequest, textStatus, errorThrown) { 
        console.log("Status: " + textStatus); console.log("Error: " + errorThrown); 
    }  
      });




     };
      $('#sel1').trigger("change");

     

     function subService(data){
     

     var subName = data.value;
     // console.log(subName);

     // alert(providerName);

      $.ajax({
            url: "/admin/getSubCategoriesTwo?provider_name="+subName,cache: false,
            beforeSend: function(xhr){xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');},
             success: function(resultData){                      
          //  console.log(result.name); 
             $('#selectLevelTwo').empty();

             $('#selectLevelTwo').append(
                        $('<option>').text('Select sub services type').attr('value', '')
                        );

             $.each(resultData, function(ai, aobj){
            //    console.log(obj);
                    $('#selectLevelTwo').append($('<option>').text(aobj.name).attr('value', aobj.id));
            });  

        }});

       // alert($('#selectLevelTwo').val()+'--'+$('#select').val()+'---'+MainServiceData);


     };


      
// $( "form" ).submit(function( event ) {
 


//   console.log( $('#select').val()+'---'+$('#selectLevelTwo').val()+'---'+MainServiceData);
//   event.preventDefault();
// });

       var wId = null;

       $('a').click(function(){
        
        var id = $(this).attr('data');


        $.ajax({
            url: "/admin/approved_account?id="+id,
            beforeSend: function(xhr){xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');},
             success: function(result){

            $("#msg").html('you have successfully approved');
           
            console.log(result);
            

        }});

    });


        $('button').click(function(){
        
        var id = $(this).attr('data');

        

        $('#myModal').modal('show');

        $.ajax({
            url: "/admin/new_withdraw?id="+id,
            beforeSend: function(xhr){xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');},
             success: function(result){
            $("#account_name").text(result[0].account_name);
            $("#bank_name").text(result[0].bank_name);
            $("#account_number").text(result[0].account_number);
            $("#routing_number").text(result[0].routing_number);
            $("#amount").text(result[0].withdraw_request_amount);
            $("#request_date").text(result[0].request_date);
            $("#country").text(result[0].country);
            $("#withdrawId").text(result[0].withdrawId);
             wId = result[0].withdrawId;
            console.log(result);

            

        }});
       

        });

         $('#ApprovedId').click(function(){

      $.ajax({
            url: "/admin/approved_withdraw?id="+wId,
            beforeSend: function(xhr){xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');},
             success: function(result){

            $("#msg").html('you have successfully approved');
           
            console.log(result);
            

        }});

        });

         

        $('.rating').rating();
        if(jQuery.browser.mobile == false) {
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
    }

    /* Scroll - if mobile */
    if(jQuery.browser.mobile == true) {
        $('.custom-scroll').css('overflow-y','scroll');
    }
    </script>
</body>
</html>