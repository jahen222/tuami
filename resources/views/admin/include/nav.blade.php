<div class="site-sidebar">
	<div class="custom-scroll custom-scroll-light">
		<ul class="sidebar-menu">
			<li class="menu-title">Admin Dashboard</li>
			<li>
				<a href="{{ route('admin.dashboard') }}" class="waves-effect waves-light">
					<span class="s-icon"><i class="ti-control-record"></i></span>
					<span class="s-text">Dashboard</span>
				</a>
			</li>

			<li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-user"></i></span>
					<span class="s-text">Banking</span>
				</a>
				<ul>
					<li class="with-sub"><a href="#">Bank Account</a>

                    <ul>
					<li><a href="{{ url('admin/new_account') }}">New Account</a></li>
					<li><a href="{{ url('admin/approved_account') }}">Approved Account</a></li>
				</ul>

					</li>
					<li class="with-sub"><a href="#">Withdraw</a>S
					<ul>
					<li><a href="{{ url('admin/new_withdraw') }}">Withdraw Requests</a></li>
					<li><a href="{{ url('admin/approved_withdraw') }}">Approved Withdraw</a></li>
					</ul>
					</li>
				</ul>
			</li>

             
           <!--   <li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-user"></i></span>
					<span class="s-text">Membership plan</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.membership.index') }}">List</a></li>
					<li><a href="{{ route('admin.membership.create') }}">Add</a></li>
                </ul>
					
				
			</li> -->



                        <li>
				<a href="{{ route('admin.blog.index') }}" class="waves-effect waves-light">
					<span class="s-icon"><i class="ti-power-off"></i></span>
					<span class="s-text">Blog</span>
				</a>
			</li>

			
			
			<li>
				<a href="{{ route('admin.heatmap') }}" class="waves-effect waves-light">
					<span class="s-icon"><i class="ti-location-pin"></i></span>
					<span class="s-text">Heat Map</span>
				</a>
			</li>

			
                       
			<li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-user"></i></span>
					<span class="s-text">Users</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.user.index') }}">List</a></li>
					<li><a href="{{ route('admin.user.create') }}">Add New</a></li>
				</ul>
			</li>
			<li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-basketball"></i></span>
					<span class="s-text">Drivers</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.provider.index') }}">List</a></li>
					<li><a href="{{ route('admin.provider.create') }}">Add New</a></li>
				</ul>
			</li>
			<!-- <li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-headphone"></i></span>
					<span class="s-text">Executive</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.dispatch-manager.index') }}">List</a></li>
					<li><a href="{{ route('admin.dispatch-manager.create') }}">Add New</a></li>
				</ul>
			</li> -->
			<!-- <li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-truck"></i></span>
					<span class="s-text">Ambulance Provider</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.fleet.index') }}">List</a></li>
					<li><a href="{{ route('admin.fleet.create') }}">Add New</a></li>
				</ul>
			</li> -->
			<!-- <li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-layout-grid2-thumb"></i></span>
					<span class="s-text">Manager</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.account-manager.index') }}">List</a></li>
					<li><a href="{{ route('admin.account-manager.create') }}">Add New</a></li>
				</ul>
			</li> -->

                          <!--   <li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-user"></i></span>
					<span class="s-text">Insurance</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.insurance.index') }}">List</a></li>
					<li><a href="{{ route('admin.insurance.create') }}">Add New</a></li>
				</ul>
			</li> -->
			<li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-files"></i></span>
					<span class="s-text">Finance</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.ride.statement') }}">Request Revenue</a></li>
                                        <li><a href="{{ route('admin.payment') }}">Request History</a></li>
					<li><a href="{{ route('admin.ride.statement.provider') }}">Provider Earning</a></li>
					<li><a href="{{ route('admin.ride.statement.today') }}">Daily Revenue</a></li>
					<li><a href="{{ route('admin.ride.statement.monthly') }}">Monthly Revenue</a></li>
					<li><a href="{{ route('admin.ride.statement.yearly') }}">Yearly Revenue</a></li>
				</ul>
			</li>

			<li>
				<a href="{{ route('admin.map.index') }}" class="waves-effect waves-light">
					<span class="s-icon"><i class="ti-map-alt"></i></span>
					<span class="s-text">Live Location</span>
				</a>
			</li>
			<li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-star"></i></span>
					<span class="s-text">Ratings &amp; Reviews</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.user.review') }}">User Ratings</a></li>
					<li><a href="{{ route('admin.provider.review') }}">Provider Ratings</a></li>
				</ul>
			</li>
			<li>
				<a href="{{ route('admin.requests.index') }}" class="waves-effect  waves-light">
					<span class="s-icon"><i class="ti-pie-chart"></i></span>
					<span class="s-text">All Order</span>
				</a>
			</li>
			<li>
				<a href="{{ route('admin.requests.scheduled') }}" class="waves-effect  waves-light">
					<span class="s-icon"><i class="ti-timer"></i></span>
					<span class="s-text">Scheduled Request</span>
				</a>
			</li>
			
			
			<li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-view-grid"></i></span>
					<span class="s-text">Store</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.service.index','type=Restaurants') }}">List</a></li>
					<li><a href="{{ route('admin.service.create') }}">Add New</a></li>
				</ul>
			</li>
			
			<li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-view-grid"></i></span>
					<span class="s-text">Category</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.category.index','type=Restaurants') }}">List</a></li>
					<li><a href="{{ route('admin.category.create') }}">Add New</a></li>
				</ul>
			</li>
			
			<li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-view-grid"></i></span>
					<span class="s-text">Sub Category</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.sub_category.index','type=Restaurants') }}">List</a></li>
					<li><a href="{{ route('admin.sub_category.create') }}">Add New</a></li>
				</ul>
			</li>
			
			<li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-view-grid"></i></span>
					<span class="s-text">Items</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.selling.index','type=Restaurants') }}">Item List</a></li>
					<li><a href="{{ route('admin.selling.create') }}">Add Item</a></li>
				</ul>
			</li>
			
			<li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-layout-tab"></i></span>
					<span class="s-text">Driver Documents</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.document.index') }}">List</a></li>
					<li><a href="{{ route('admin.document.create') }}">Add New</a></li>
				</ul>
			</li>

			<li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-bookmark-alt"></i></span>
					<span class="s-text">Promo Code</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.promocode.index') }}">List</a></li>
					<li><a href="{{ route('admin.promocode.create') }}">Add New</a></li>
				</ul>
			</li>
			
			<!--<li>
				<a href="{{ route('admin.payment') }}" class="waves-effect  waves-light">
					<span class="s-icon"><i class="ti-infinite"></i></span>
					<span class="s-text">Payment History</span>
				</a>
			</li>-->
			<li>
				<a href="{{ route('admin.settings.payment') }}" class="waves-effect  waves-light">
					<span class="s-icon"><i class="ti-money"></i></span>
					<span class="s-text">Payment Settings</span>
				</a>
			</li>
			<!--<li class="menu-title">Settings</li>-->
			<li>
				<a href="{{ route('admin.settings') }}" class="waves-effect  waves-light">
					<span class="s-icon"><i class="ti-settings"></i></span>
					<span class="s-text">Web Settings</span>
				</a>
			</li>
			<!--<li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-bookmark-alt"></i></span>
					<span class="s-text">Pages</span>
				</a>
				<ul>
					<li><a href="{{ route('admin.privacy') }}">Privacy Policy</a></li>
					<li><a href="{{ route('admin.help') }}">Help</a></li>
                                        <li><a href="{{ route('admin.translation') }}">Translations</a></li>
				</ul>
			</li>-->


			<!--<li class="menu-title">Account</li>-->
			<!--<li>
				<a href="{{ route('admin.profile') }}" class="waves-effect  waves-light">
					<span class="s-icon"><i class="ti-user"></i></span>
					<span class="s-text">Account Settings</span>
				</a>
			</li>-->
			<!--<li>
				<a href="{{ route('admin.password') }}" class="waves-effect  waves-light">
					<span class="s-icon"><i class="ti-exchange-vertical"></i></span>
					<span class="s-text">Change Password</span>
				</a>
			</li>-->
			<li class="compact-hide">
				<a href="{{ url('/admin/logout') }}"
                            onclick="event.preventDefault();
                                     document.getElementById('logout-form').submit();">
					<span class="s-icon"><i class="ti-power-off"></i></span>
					<span class="s-text">Logout</span>
                </a>

                <form id="logout-form" action="{{ url('/admin/logout') }}" method="POST" style="display: none;">
                    {{ csrf_field() }}
                </form>
			</li>
			
		</ul>
	</div>
</div>