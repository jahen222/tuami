<div class="site-sidebar"> <!-- style="height: 100%;position: fixed;" -->
    <div class="custom-scroll custom-scroll-light">
         <div class="user-img">
            <?php $profile_image = img(Auth::user()->picture); ?>
            <div class="pro-img" style="background-image: url({{$profile_image}});margin-top: 15px;"></div>
            <h4 style="color: #ffffff;text-align: center;">{{Auth::user()->first_name}} {{Auth::user()->last_name}}</h4>
        </div>
        <div style="margin-top: 30px;">
            <ul class="sidebar-menu">
                <li>
                    <a href="{{url('dashboard')}}" class="waves-effect waves-light">
                        <span class="s-icon"><i class="ti-control-record user-sidebaricon"></i></span>
                        <span class="s-text user-dashboard">Dashbaord</span>
                    </a>
                </li>

                <li>
                    <a href="{{url('mytrips')}}" class="waves-effect waves-light">
                        <span class="s-icon"><i class="ti-location-arrow user-sidebaricon"></i></span>
                        <span class="s-text user-dashboard">My Request</span>
                    </a>
                </li>

                <!--<li>
                    <a href="{{url('trips')}}" class="waves-effect waves-light">
                        <span class="s-icon"><i class="ti-slice user-sidebaricon"></i></span>
                        <span class="s-text user-dashboard">New Request</span>
                    </a>
                </li>-->

                <!--<li>
                    <a href="{{url('upcoming/trips')}}" class="waves-effect waves-light">
                        <span class="s-icon"><i class="ti-time user-sidebaricon"></i></span>
                        <span class="s-text user-dashboard">Schedule Request</span>
                    </a>
                </li>-->

                <li>
                    <a href="{{url('profile')}}" class="waves-effect waves-light">
                        <span class="s-icon"><i class="ti-user user-sidebaricon"></i></span>
                        <span class="s-text user-dashboard">My Profile</span>
                    </a>
                </li>

                <li>
                    <a href="{{url('/payment')}}" class="waves-effect waves-light">
                        <span class="s-icon"><i class="ti-money user-sidebaricon"></i></span>
                        <span class="s-text user-dashboard">My Payment</span>
                    </a>
                </li>

                <li>
                    <a href="{{url('/promotions')}}" class="waves-effect waves-light">
                        <span class="s-icon"><i class="ti-crown user-sidebaricon"></i></span>
                        <!--span class="s-text user-dashboard">@lang('user.promotion')</span-->
                        <span class="s-text user-dashboard">Promocode</span>
                    </a>
                </li>

                <li>
                    <a href="{{url('/wallet')}}" class="waves-effect waves-light">
                        <span class="s-icon"><i class="ti-wallet user-sidebaricon"></i></span>
                        <span class="s-text user-dashboard">My Wallet</span>
                    </a>
                </li>

                <!--<li>
                    <a href="{{url('/faq')}}" class="waves-effect waves-light">
                        <span class="s-icon"><i class="ti-menu-alt user-sidebaricon"></i></span>
                        <span class="s-text user-dashboard">FAQ</span>
                    </a>
                </li>-->

                <!--<li>
                    <a href="{{url('/terms')}}" class="waves-effect waves-light">
                        <span class="s-icon"><i class="ti-info user-sidebaricon"></i></span>
                        <span class="s-text user-dashboard">Terms and Condition</span>
                    </a>
                </li>-->

                <!--<li>
                    <a href="{{url('/help')}}" class="waves-effect waves-light">
                        <span class="s-icon"><i class="ti-help user-sidebaricon"></i></span>
                        <span class="s-text user-dashboard">Help</span>
                    </a>
                </li>-->

                <li>
                    <a href="{{ url('/logout') }}"
                    onclick="event.preventDefault();
                    document.getElementById('logout-form').submit();" class="waves-effect waves-light">
                    <span class="s-icon"><i class="ti-power-off user-sidebaricon"></i></span>
                    <span class="s-text user-dashboard">@lang('user.profile.logout')</span>
                    </a>
                </li>
                    <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                        {{ csrf_field() }}
                    </form>
                <!--li><a href="{{url('dashboard')}}">@lang('user.dashboard')</a></li-->
                <!--li><a href="{{url('trips')}}">@lang('user.my_trips')</a></li-->
                <!--li><a href="{{url('upcoming/trips')}}">@lang('user.upcoming_trips')</a></li-->
                <!--li><a href="{{url('profile')}}">@lang('user.profile.profile')</a></li-->
                <!--li><a href="{{url('change/password')}}">@lang('user.profile.change_password')</a></li-->
                <!--li><a href="{{url('/payment')}}">@lang('user.payment')</a></li-->
                <!--li><a href="{{url('/promotions')}}">@lang('user.promotion')</a></li-->
                <!--li><a href="{{url('/wallet')}}">@lang('user.my_wallet') <span class="pull-right" style="color: #ffffff;">{{currency(Auth::user()->wallet_balance)}}</span></a></li-->
                <!--li><a href="{{ url('/logout') }}"
                        onclick="event.preventDefault();
                        document.getElementById('logout-form').submit();">@lang('user.profile.logout')</a></li>
                        <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                            {{ csrf_field() }}
                        </form-->
            </ul>
        </div>
    </div>
</div>


<!--div class="col-md-3">
    <div class="dash-left">
        <div class="user-img">
            <?php $profile_image = img(Auth::user()->picture); ?>
            <div class="pro-img" style="background-image: url({{$profile_image}});"></div>
            <h4>{{Auth::user()->first_name}} {{Auth::user()->last_name}}</h4>
        </div>
        <div class="side-menu">
             <ul>
                <li><a href="{{url('dashboard')}}">@lang('user.dashboard')</a></li>
                <li><a href="{{url('trips')}}">@lang('user.my_trips')</a></li>
                <li><a href="{{url('upcoming/trips')}}">@lang('user.upcoming_trips')</a></li>
                <li><a href="{{url('profile')}}">@lang('user.profile.profile')</a></li>
                <li><a href="{{url('change/password')}}">@lang('user.profile.change_password')</a></li>
                <li><a href="{{url('/payment')}}">@lang('user.payment')</a></li>
                <li><a href="{{url('/promotions')}}">@lang('user.promotion')</a></li>
                <li><a href="{{url('/wallet')}}">@lang('user.my_wallet') <span class="pull-right">{{currency(Auth::user()->wallet_balance)}}</span></a></li>
                <li><a href="{{ url('/logout') }}"
                        onclick="event.preventDefault();
                        document.getElementById('logout-form').submit();">@lang('user.profile.logout')</a></li>
                        <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                            {{ csrf_field() }}
                        </form>
            </ul>
        </div>
    </div>
</div-->