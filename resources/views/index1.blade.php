@extends('user.layout.app')

@section('content')
        <div class="get_there">
	<div class="container">
<div class="row">
<div class="col-md-12">
<div class="col-md-6">
<div>
<p style="font-size: 4em; width: 100%;margin-top: 160px;"><b>Get Instant Delivery On Your Door Steps</b></p>
<p style="font-size: 1.8em;">Fulfill your dreams while changing lives</p>
<div class="driver_signup">
    <a  href="" class="btn btn-default">Download App Now
        <figure><img src="img/btn_arrow.png" alt="img"/></figure>
    </a>
</div>
</div>
</div>
<div class="col-md-6">
<div>
<p><img src="{{asset('firstimage.png')}}" alt="User Request" style="width: 100%;"/></p></div>
</div>


</div>

</div>
        </div>
        <div class="clearfix"></div>
		<div class="col-md-12">
		<h2 <h2 style="text-align: center;">Top Services</h2>
		</div>
        <div class="reasons">
            <div class="container">
                 <div class="row">
                    <div class="col-md-3">
                    <div class="easiest">
                        <figure><img src="{{ url('groccery a.png') }}" alt="img" style=""/></figure>
                        <!--<h4>Easiest way around</h4>-->
                        <h4 style="font-size: 15px; font-weight: bold; color: #337ab7;">
                            Grocery
                        </h4>
                    </div>
                </div>
                    <div class="col-md-3">
                    <div class="easiest">
                        <figure><img src="{{ url('food a.png') }}" alt="img" style=""/></figure>
                        <h4 style="font-size: 15px; font-weight: bold; color: #337ab7;">Food</h4>
                    </div>
                </div>
                    <div class="col-md-3">
                    <div class="easiest">
                        <figure><img src="{{ url('Medical a.png') }}" alt="img" style=""/></figure>
                        <h4 style="font-size: 15px; font-weight: bold; color: #337ab7;">Medical</h4>
                    </div>
                </div>
                    <div class="col-md-3">
                    <div class="easiest">
                        <figure><img src="{{ url('medician a.png') }}" alt="img" style=""/></figure>
                        <h4 style="font-size: 15px; font-weight: bold; color: #337ab7;">Pharmacy</h4>
                    </div>
                </div>

                </div>


                 <div class="row">
                    <div class="col-md-3">
                    <div class="easiest">
                        <figure><img src="{{ url('food and drinks a.png') }}" alt="img" style=""/></figure>
                        <!--<h4>Easiest way around</h4>-->
                        <h4 style="font-size: 15px; font-weight: bold; color: #337ab7;">Snack & Juice</h4>
                    </div>
                </div>
                    <div class="col-md-3">
                    <div class="easiest">
                        <figure><img src="{{ url('gift a.png') }}" alt="img" style=""/></figure>
                        <h4 style="font-size: 15px; font-weight: bold; color: #337ab7;">Gift</h4>
                    </div>
                </div>



                </div>

            </div>
        </div>
        <div class="community">
            <div class="container">
                <div class="community_text">
                    <h3>Our Expert</h3>
                    <p>Our Expert community of tuami comprises people , experience and interests. However, it’s their passion that tells the story of working with Tuami.</p>
                    <!--<div class="community_btn">
                        <a  href="{{ url('/our_expert') }}" class="btn btn-default">Read stories <figure><img src="img/btn_arrow.png" alt="img" /></figure></a>
                    </div>-->
                </div>
            </div>
        </div>
		<div class="pricing">
            <div class="container">
                <div class="row">
					  <div class="col-md-6">
                        <div class="img_wrapper">
							<img src="{{asset('img/mobilefirstscreen.png')}}" class="img-responsive"  alt="location">
						</div>
                    </div>
					<!--<div class="col-md-4">
					</div>-->
					<div class="col-md-6">
                        <div class="pricing_left">
                           <h5>Searching drivers...</h5>
                            <h4>Download App Now</h4>
                             <div class="care_img_wrapper">
								<a href="#" class="download_lnk">
									<img class="img-responsive" src="{{asset('img/googleplay.png')}}" alt="img"/>
								</a>
								<a href="#" class="download_lnk">
									<img  class="img-responsive" src="{{asset('img/applestore.png')}}" alt="img"/>
								</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="therd_banner">
            <div class="container">
                <div class="therd_banner_text">
                    <h3>Delivery when you want</h3>
                    <small>Make what you need</small>
                    <p>Tuami is flexible and rewarding by users get the care they need while allowing drivers to meet their financial goals. </p>
                    <!--<div class="community_btn">
                        <a  href="{{ url('/carecrew_driver') }}"  class="btn btn-default">Read stories <figure><img src="img/btn_arrow.png" alt="img" /></figure></a>
                    </div>-->
                </div>
            </div>
        </div>
		<div class="pricing">
            <div class="container">
                <div class="row">

					<div class="col-md-6">
                        <div class="pricing_left">
                           <h5>Looking for a job?</h5>
                            <h4>Download App Now</h4>
                             <div class="care_img_wrapper">
								<a href="#" class="download_lnk">
									<img class="img-responsive" src="{{asset('img/googleplay.png')}}" alt="img"/>
								</a>
								<a href="#" class="download_lnk">
									<img  class="img-responsive" src="{{asset('img/applestore.png')}}" alt="img"/>
								</a>
                            </div>
                        </div>
                    </div>
					<!--<div class="col-md-4">
					</div>-->
					  <div class="col-md-6">
                        <div class="img_wrapper">
							<img src="img/mobilesecondscreen.png" class="img-responsive" alt="location">
						</div>
                    </div>
                </div>
            </div>
        </div>

        <!--div class="video">
            <iframe src="https://www.youtube.com/embed/pAjL4Y9It6I" frameborder="0" allowfullscreen></iframe>
        </div-->
        <div class="find_city">
            <div class="container">
                <div class="city_text">
                    <h3>Get Latest Update</h3>
                </div>
                <div class="city-form">
                    <input type="text" class="form-control" placeholder="Enter Your Email" style="background: none;border: 0.5px solid aliceblue;">
                    <a href="#"><img src="{{asset('img/destination.png')}}" alt="arrow"/></a>
                </div>
            </div>
        </div>




@endsection
