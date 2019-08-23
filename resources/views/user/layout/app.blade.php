<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
	<head>
		<meta charset="utf-8">

		<title>Tuami</title>
		<link rel="shortcut icon" type="image/png" href="{{ Setting::get('site_icon') }}">

		<meta name="description" content="">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/custom.css" rel="stylesheet">
		<link href="css/hamburgers.css" rel="stylesheet">
		<link href="css/owl.carousel.css" rel="stylesheet">
		<link href="css/owl.theme.css" rel="stylesheet">

	</head>
	<body>

		@include('user.layout.templateparts.website_header')

		@yield('content')

		@include('user.layout.templateparts.website_footer')



		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/owl.carousel.js"></script>
		<script>
			$("#left_menu_open").click(function(){
				$("#left_menu").addClass("open");
			});
			$(".close").click(function(){
				$("#left_menu").removeClass("open");
			});

			$(".hamburger").click(function(){
				$(".side_menu").toggleClass("open");
			});
		</script>
		<script>
		var forEach=function(t,o,r){if("[object Object]"===Object.prototype.toString.call(t))for(var c in t)Object.prototype.hasOwnProperty.call(t,c)&&o.call(r,t[c],c,t);else for(var e=0,l=t.length;l>e;e++)o.call(r,t[e],e,t)};

		var hamburgers = document.querySelectorAll(".hamburger");
		if (hamburgers.length > 0) {
		  forEach(hamburgers, function(hamburger) {
			hamburger.addEventListener("click", function() {
			  this.classList.toggle("is-active");
			}, false);
		  });
		}
	  </script>

	  <script>
		$(document).ready(function() {
		  $("#owl-demo2").owlCarousel({
			autoPlay: 3000,
			items :3,
			autoPlay:true,
			navigation:true,
			navigationText:true,
			pagination:true,
			itemsDesktop : [1350,3],
			itemsDesktop : [1199,2],
			itemsDesktopSmall : [991,1],
			itemsTablet: [767,1],
			itemsMobile : [560,1]
		  });

		});


	</script>

	 <!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script> -->
	 <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFVF5e-GYymNXLfS9567IcpHiAiuhfFzI&libraries=places&callback=init" async defer></script>

		<script type="text/javascript">
			// When the window has finished loading create our google map below
			//google.maps.event.addDomListener(window, 'load', init);

			function init() {
				// Basic options for a simple Google Map
				// For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
				var mapOptions = {
					// How zoomed in you want the map to start at (always required)
					zoom: 11,

					// The latitude and longitude to center the map (always required)
					center: new google.maps.LatLng(40.6700, -73.9400), // New York

					// How you would like to style the map.
					// This is where you would paste any style found on Snazzy Maps.
					styles: [{"featureType":"all","elementType":"all","stylers":[{"hue":"#e7ecf0"}]},{"featureType":"poi","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"poi","elementType":"labels.text","stylers":[{"visibility":"off"}]},{"featureType":"poi","elementType":"labels.icon","stylers":[{"visibility":"on"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#8ed863"}]},{"featureType":"road","elementType":"all","stylers":[{"saturation":-70}]},{"featureType":"transit","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"all","stylers":[{"visibility":"simplified"},{"saturation":-60}]},{"featureType":"water","elementType":"geometry.fill","stylers":[{"color":"#8abdec"}]},{"featureType":"water","elementType":"geometry.stroke","stylers":[{"color":"#9cbbf0"}]},{"featureType":"water","elementType":"labels.text","stylers":[{"visibility":"off"}]}]
				};

				// Get the HTML DOM element that will contain your map
				// We are using a div with id="map" seen below in the <body>
				var mapElement = document.getElementById('map');

				// Create the Google Map using our element and options defined above
				var map = new google.maps.Map(mapElement, mapOptions);

				// Let's also add a marker while we're at it
				var marker = new google.maps.Marker({
					position: new google.maps.LatLng(40.6700, -73.9400),
					map: map,
					title: 'Snazzy!'
				});
			}
		</script>



<!--Start of Tawk.to Script-->
<!-- <script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5bc5a6eb08387933e5bb7716/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script> -->
<!--End of Tawk.to Script-->

	</body>
</html>
