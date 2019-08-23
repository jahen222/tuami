@extends('dispatcher.layout.base')

@section('title', 'Dispatcher ')

@section('content')

<div data-reactroot="" class="container-fluid">
  <h4>Dispatcher
  </h4>
  <nav class="navbar navbar-light bg-white b-a mb-2">
    <button class="navbar-toggler hidden-md-up" data-toggle="collapse" data-target="#process-filters" aria-controls="process-filters" aria-expanded="false" aria-label="Toggle Navigation">
    </button>
    <form class="form-inline navbar-item ml-1 float-xs-right">
      <div class="input-group">
        <input class="form-control b-a" placeholder="Search for..." type="text">
        <span class="input-group-btn">
          <button type="submit" class="btn btn-primary b-a">
            <i class="ti-search">
            </i>
          </button>
        </span>
      </div>
    </form>
    <ul class="nav navbar-nav float-xs-right">
      <li class="nav-item">
        <button id="add_u" type="button" class="btn btn-success btn-md label-right b-a-0 waves-effect waves-light">
          <span class="btn-label">
            <i class="ti-plus">
            </i>
          </span>
          <!-- react-text: 16 -->ADD
          <!-- /react-text -->
        </button>
      </li>
    </ul>
    <div class="collapse navbar-toggleable-sm" id="process-filters">
      <ul class="nav navbar-nav dispatcher-nav">
        <li class="nav-item active">
          <span class="nav-link" href="#">All
          </span>
        </li>
        <li class="nav-item">
          <span class="nav-link" href="#">My
          </span>
        </li>
        <li class="nav-item">
          <span class="nav-link" href="#">Warning
          </span>
        </li>
        <li class="nav-item">
          <span class="nav-link" href="#">Scheduled
          </span>
        </li>
      </ul>
    </div>
  </nav>
  <div class="row">
    <div class="col-md-4">
      <div class="card">
        <div class="card-header text-uppercase">
          <b>List
          </b>
        </div>
        <div class="items-list" id="itemList">




         </div>


<div class="card card-block" id="create-ride">
    <h3 class="card-title text-uppercase">Ride Details</h3>
    <form id="form-create-ride" method="POST">
        <div class="row">
            <div class="col-xs-6">
                <div class="form-group">
                    <label for="first_name">First Name</label>
                    <input class="form-control" name="first_name" id="first_name" placeholder="First Name" required="" type="text">
                </div>
            </div>
            <div class="col-xs-6">
                <div class="form-group">
                    <label for="last_name">Last Name</label>
                    <input class="form-control" name="last_name" id="last_name" placeholder="Last Name" required="" type="text">
                </div>
            </div>
            <div class="col-xs-6">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input class="form-control" name="email" id="email" placeholder="Email" required="" type="email">
                </div>
            </div>
            <div class="col-xs-6">
                <div class="form-group">
                    <label for="mobile">Phone</label>
                    <input class="form-control" name="mobile" id="mobile" placeholder="Phone" required="" type="text">
                </div>
            </div>
            <div class="col-xs-12">

                 <div class="form-group">
                    <label for="service_types">Service Type</label>
                    <select name="service_type" class="form-control" id="serviceType">
                        
                        <option value="CARETAKER">CARETAKER</option>
                        <option value="AMBULANCE">AMBULANCE</option>
                        <option value="CAR/TRANSFER">CAR/TRANSFER</option>
                    </select>
                </div>


                <div class="form-group">
                    <label for="s_address">Pickup Address</label>
                    <input name="s_address" class="form-control" id="s_address" placeholder="Pickup Address" required="" autocomplete="off" type="text">
                    <input name="s_latitude" id="s_latitude" value="" type="hidden">
                    <input name="s_longitude" id="s_longitude" value="" type="hidden">
                </div>
                <div class="form-group">
                    <label for="d_address">Dropoff Address</label>
                    <input name="d_address" class="form-control" id="d_address" placeholder="Dropoff Address" required="" autocomplete="off" type="text">
                    <input name="d_latitude" id="d_latitude" value="" type="hidden">
                    <input name="d_longitude" id="d_longitude" value="" type="hidden">
                    <input name="distance" id="distance" value="" type="hidden">
                </div>
                <div class="form-group">
                    <label for="schedule_time">Schedule Time</label>
                    <input class="form-control" name="schedule_time" id="schedule_time" placeholder="Date" required="" type="text">
                </div>
               
                <div class="form-group">
                    <label for="provider_auto_assign">Auto Assign Provider</label>
                    <br>
                    <input id="provider_auto_assign" name="provider_auto_assign" class="js-switch" data-color="#f59345" value="on" style="display: none;" data-switchery="true" type="checkbox"><span class="switchery switchery-default" style="background-color: rgb(100, 189, 99); border-color: rgb(100, 189, 99); box-shadow: rgb(100, 189, 99) 0px 0px 0px 16.5px inset; transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;"><small style="left: 20px; background-color: rgb(255, 255, 255); transition: background-color 0.4s ease 0s, left 0.2s ease 0s;"></small></span></div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6">
                <button type="button" class="btn btn-lg btn-danger btn-block waves-effect waves-light">CANCEL</button>
            </div>
            <div class="col-xs-6">
                <button class="btn btn-lg btn-success btn-block waves-effect waves-light">SUBMIT</button>
            </div>
        </div>
    </form>
</div>


        
      </div>
    </div>
    <div class="col-md-8">
      <div class="card my-card">
        <div class="card-header text-uppercase">
          <b>MAP
          </b>
        </div>
        <div class="card-body">
          <div id="map" style="height: 450px; position: relative; overflow: hidden;">
            <div style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; background-color: rgb(229, 227, 223);">
              <div style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px;" class="gm-style">
                <div style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; cursor: url(&quot;https://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;), default; touch-action: none;" tabindex="0">
                  <div style="z-index: 1; position: absolute; left: 50%; top: 50%; width: 100%; transform: translate(0px, 0px);">
                    <div style="position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;">
                      <div style="position: absolute; left: 0px; top: 0px; z-index: 0;">
                        <div style="position: absolute; z-index: 998; transform: matrix(1, 0, 0, 1, 0, 0);">
                          <div style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px;">
                            <div style="width: 256px; height: 256px;">
                            </div>
                          </div>
                          <div style="position: absolute; left: -256px; top: 0px; width: 256px; height: 256px;">
                            <div style="width: 256px; height: 256px;">
                            </div>
                          </div>
                          <div style="position: absolute; left: -256px; top: -256px; width: 256px; height: 256px;">
                            <div style="width: 256px; height: 256px;">
                            </div>
                          </div>
                          <div style="position: absolute; left: 0px; top: -256px; width: 256px; height: 256px;">
                            <div style="width: 256px; height: 256px;">
                            </div>
                          </div>
                          <div style="position: absolute; left: 256px; top: -256px; width: 256px; height: 256px;">
                            <div style="width: 256px; height: 256px;">
                            </div>
                          </div>
                          <div style="position: absolute; left: 256px; top: 0px; width: 256px; height: 256px;">
                            <div style="width: 256px; height: 256px;">
                            </div>
                          </div>
                          <div style="position: absolute; left: -512px; top: 0px; width: 256px; height: 256px;">
                            <div style="width: 256px; height: 256px;">
                            </div>
                          </div>
                          <div style="position: absolute; left: -512px; top: -256px; width: 256px; height: 256px;">
                            <div style="width: 256px; height: 256px;">
                            </div>
                          </div>
                          <div style="position: absolute; left: 512px; top: -256px; width: 256px; height: 256px;">
                            <div style="width: 256px; height: 256px;">
                            </div>
                          </div>
                          <div style="position: absolute; left: 512px; top: 0px; width: 256px; height: 256px;">
                            <div style="width: 256px; height: 256px;">
                            </div>
                          </div>
                          <div style="position: absolute; left: -768px; top: 0px; width: 256px; height: 256px;">
                            <div style="width: 256px; height: 256px;">
                            </div>
                          </div>
                          <div style="position: absolute; left: -768px; top: -256px; width: 256px; height: 256px;">
                            <div style="width: 256px; height: 256px;">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div style="position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;">
                    </div>
                    <div style="position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;">
                    </div>
                    <div style="position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;">
                      <div style="position: absolute; left: 0px; top: 0px; z-index: -1;">
                        <div style="position: absolute; z-index: 998; transform: matrix(1, 0, 0, 1, 0, 0);">
                          <div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: 0px;">
                          </div>
                          <div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: 0px;">
                          </div>
                          <div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: -256px;">
                          </div>
                          <div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: -256px;">
                          </div>
                          <div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: -256px;">
                          </div>
                          <div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: 0px;">
                          </div>
                          <div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -512px; top: 0px;">
                          </div>
                          <div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -512px; top: -256px;">
                          </div>
                          <div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: -256px;">
                          </div>
                          <div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: 0px;">
                          </div>
                          <div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -768px; top: 0px;">
                          </div>
                          <div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -768px; top: -256px;">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div style="position: absolute; left: 0px; top: 0px; z-index: 0;">
                      <div style="position: absolute; z-index: 998; transform: matrix(1, 0, 0, 1, 0, 0);">
                        <div style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                          <img style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none;" draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i2!2i2!3i2!4i256!2m3!1e0!2sm!3i440145304!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&amp;token=42798">
                        </div>
                        <div style="position: absolute; left: -256px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                          <img style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none;" draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i2!2i1!3i2!4i256!2m3!1e0!2sm!3i440145304!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&amp;token=57078">
                        </div>
                        <div style="position: absolute; left: -256px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                          <img style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none;" draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i2!2i1!3i1!4i256!2m3!1e0!2sm!3i440145304!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&amp;token=34854">
                        </div>
                        <div style="position: absolute; left: 0px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                          <img style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none;" draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i2!2i2!3i1!4i256!2m3!1e0!2sm!3i440145304!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&amp;token=20574">
                        </div>
                        <div style="position: absolute; left: 256px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                          <img style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none;" draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i2!2i3!3i1!4i256!2m3!1e0!2sm!3i440145280!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&amp;token=20757">
                        </div>
                        <div style="position: absolute; left: -768px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                          <img style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none;" draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i2!2i3!3i1!4i256!2m3!1e0!2sm!3i440145280!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&amp;token=20757">
                        </div>
                        <div style="position: absolute; left: 256px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                          <img style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none;" draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i2!2i3!3i2!4i256!2m3!1e0!2sm!3i440145028!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&amp;token=21153">
                        </div>
                        <div style="position: absolute; left: -768px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                          <img style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none;" draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i2!2i3!3i2!4i256!2m3!1e0!2sm!3i440145028!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&amp;token=21153">
                        </div>
                        <div style="position: absolute; left: -512px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                          <img style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none;" draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i2!2i0!3i2!4i256!2m3!1e0!2sm!3i440145304!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&amp;token=71358">
                        </div>
                        <div style="position: absolute; left: 512px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                          <img style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none;" draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i2!2i0!3i2!4i256!2m3!1e0!2sm!3i440145304!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&amp;token=71358">
                        </div>
                        <div style="position: absolute; left: -512px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                          <img style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none;" draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i2!2i0!3i1!4i256!2m3!1e0!2sm!3i440145304!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&amp;token=49134">
                        </div>
                        <div style="position: absolute; left: 512px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                          <img style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none;" draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i2!2i0!3i1!4i256!2m3!1e0!2sm!3i440145304!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyC703aCvZmrdfFlNxArFXzBL_OBNuF4AC4&amp;token=49134">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div style="z-index: 2; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; opacity: 0;" class="gm-style-pbc">
                    <p class="gm-style-pbt">
                    </p>
                  </div>
                  <div style="z-index: 3; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; touch-action: pan-x pan-y;">
                    <div style="z-index: 4; position: absolute; left: 50%; top: 50%; width: 100%; transform: translate(0px, 0px);">
                      <div style="position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;">
                      </div>
                      <div style="position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;">
                      </div>
                      <div style="position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;">
                      </div>
                      <div style="position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;">
                      </div>
                    </div>
                  </div>
                </div>
                <iframe aria-hidden="true" style="z-index: -1; position: absolute; width: 100%; height: 100%; top: 0px; left: 0px; border: medium none;" src="about:blank" frameborder="0">
                </iframe>
                <div style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;">
                  <a style="position: static; overflow: visible; float: none; display: inline;" target="_blank" rel="noopener" href="https://maps.google.com/maps?ll=0,0&amp;z=2&amp;t=m&amp;hl=en-US&amp;gl=US&amp;mapclient=apiv3" title="Click to see this area on Google Maps">
                    <div style="width: 66px; height: 26px; cursor: pointer;">
                      <img style="position: absolute; left: 0px; top: 0px; width: 66px; height: 26px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;" alt="" src="https://maps.gstatic.com/mapfiles/api-3/images/google4.png" draggable="false">
                    </div>
                  </a>
                </div>
                <div style="background-color: white; padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto, Arial, sans-serif; color: rgb(34, 34, 34); box-sizing: border-box; box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; z-index: 10000002; display: none; width: 300px; height: 180px; position: absolute; left: 378px; top: 135px;">
                  <div style="padding: 0px 0px 10px; font-size: 16px;">Map Data
                  </div>
                  <div style="font-size: 13px;">Map data ©2018
                  </div>
                  <button style="background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; display: block; border: 0px none; margin: 0px; padding: 0px; position: absolute; cursor: pointer; -moz-user-select: none; top: 0px; right: 0px; width: 37px; height: 37px;" draggable="false" title="Close" aria-label="Close" type="button" class="gm-ui-hover-effect">
                    <img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224px%22%20height%3D%2224px%22%20viewBox%3D%220%200%2024%2024%22%20fill%3D%22%23000000%22%3E%0A%20%20%20%20%3Cpath%20d%3D%22M19%206.41L17.59%205%2012%2010.59%206.41%205%205%206.41%2010.59%2012%205%2017.59%206.41%2019%2012%2013.41%2017.59%2019%2019%2017.59%2013.41%2012z%22%2F%3E%0A%20%20%20%20%3Cpath%20d%3D%22M0%200h24v24H0z%22%20fill%3D%22none%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="pointer-events: none; display: block; width: 13px; height: 13px; margin: 12px;">
                  </button>
                </div>
                <div class="gmnoprint" style="z-index: 1000001; position: absolute; right: 72px; bottom: 0px; width: 88px;">
                  <div draggable="false" style="-moz-user-select: none; height: 14px; line-height: 14px;" class="gm-style-cc">
                    <div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
                      <div style="width: 1px;">
                      </div>
                      <div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;">
                      </div>
                    </div>
                    <div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;">
                      <a style="text-decoration: none; cursor: pointer; display: none;">Map Data
                      </a>
                      <span>Map data ©2018
                      </span>
                    </div>
                  </div>
                </div>
                <div class="gmnoscreen" style="position: absolute; right: 0px; bottom: 0px;">
                  <div style="font-family: Roboto, Arial, sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">Map data ©2018
                  </div>
                </div>
                <div class="gmnoprint gm-style-cc" style="z-index: 1000001; -moz-user-select: none; height: 14px; line-height: 14px; position: absolute; right: 0px; bottom: 0px;" draggable="false">
                  <div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
                    <div style="width: 1px;">
                    </div>
                    <div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;">
                    </div>
                  </div>
                  <div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;">
                    <a style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);" href="https://www.google.com/intl/en-US_US/help/terms_maps.html" target="_blank" rel="noopener">Terms of Use
                    </a>
                  </div>
                </div>
                <button style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; margin: 10px; padding: 0px; position: absolute; cursor: pointer; -moz-user-select: none; border-radius: 2px; height: 40px; width: 40px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; overflow: hidden; top: 0px; right: 0px;" draggable="false" title="Toggle fullscreen view" aria-label="Toggle fullscreen view" type="button" class="gm-control-active gm-fullscreen-control">
                  <img style="height: 18px; width: 18px; margin: 11px;" src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%20018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23666%22%20d%3D%22M0%2C0v2v4h2V2h4V0H2H0z%20M16%2C0h-4v2h4v4h2V2V0H16z%20M16%2C16h-4v2h4h2v-2v-4h-2V16z%20M2%2C12H0v4v2h2h4v-2H2V12z%22%2F%3E%0A%3C%2Fsvg%3E%0A">
                  <img style="height: 18px; width: 18px; margin: 11px;" src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23333%22%20d%3D%22M0%2C0v2v4h2V2h4V0H2H0z%20M16%2C0h-4v2h4v4h2V2V0H16z%20M16%2C16h-4v2h4h2v-2v-4h-2V16z%20M2%2C12H0v4v2h2h4v-2H2V12z%22%2F%3E%0A%3C%2Fsvg%3E%0A">
                  <img style="height: 18px; width: 18px; margin: 11px;" src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23111%22%20d%3D%22M0%2C0v2v4h2V2h4V0H2H0z%20M16%2C0h-4v2h4v4h2V2V0H16z%20M16%2C16h-4v2h4h2v-2v-4h-2V16z%20M2%2C12H0v4v2h2h4v-2H2V12z%22%2F%3E%0A%3C%2Fsvg%3E%0A">
                </button>
                <div draggable="false" style="-moz-user-select: none; height: 14px; line-height: 14px; display: none; position: absolute; right: 0px; bottom: 0px;" class="gm-style-cc">
                  <div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
                    <div style="width: 1px;">
                    </div>
                    <div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;">
                    </div>
                  </div>
                  <div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;">
                    <a target="_blank" rel="noopener" title="Report errors in the road map or imagery to Google" style="font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;" href="https://www.google.com/maps/@0,0,2z/data=!10m1!1e1!12b1?source=apiv3&amp;rapsrc=apiv3">Report a map error
                    </a>
                  </div>
                </div>
                <div class="gmnoprint gm-bundled-control gm-bundled-control-on-bottom" style="margin: 10px; -moz-user-select: none; position: absolute; bottom: 167px; right: 40px;" draggable="false" controlwidth="40" controlheight="153">
                  <div class="gmnoprint" style="position: absolute; left: 0px; top: 72px;" controlwidth="40" controlheight="81">
                    <div draggable="false" style="-moz-user-select: none; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; cursor: pointer; background-color: rgb(255, 255, 255); width: 40px; height: 81px;">
                      <button style="background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; display: block; border: 0px none; margin: 0px; padding: 0px; position: relative; cursor: pointer; -moz-user-select: none; overflow: hidden; width: 40px; height: 40px; top: 0px; left: 0px;" draggable="false" title="Zoom in" aria-label="Zoom in" type="button" class="gm-control-active">
                        <img style="height: 18px; width: 18px; margin: 9px 11px 13px;" src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpolygon%20fill%3D%22%23666%22%20points%3D%2218%2C7%2011%2C7%2011%2C0%207%2C0%207%2C7%200%2C7%200%2C11%207%2C11%207%2C18%2011%2C18%2011%2C11%2018%2C11%22%2F%3E%0A%3C%2Fsvg%3E%0A">
                        <img style="height: 18px; width: 18px; margin: 9px 11px 13px;" src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpolygon%20fill%3D%22%23333%22%20points%3D%2218%2C7%2011%2C7%2011%2C0%207%2C0%207%2C7%200%2C7%200%2C11%207%2C11%207%2C18%2011%2C18%2011%2C11%2018%2C11%22%2F%3E%0A%3C%2Fsvg%3E%0A">
                        <img style="height: 18px; width: 18px; margin: 9px 11px 13px;" src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpolygon%20fill%3D%22%23111%22%20points%3D%2218%2C7%2011%2C7%2011%2C0%207%2C0%207%2C7%200%2C7%200%2C11%207%2C11%207%2C18%2011%2C18%2011%2C11%2018%2C11%22%2F%3E%0A%3C%2Fsvg%3E%0A">
                      </button>
                      <div style="position: relative; overflow: hidden; width: 30px; height: 1px; margin: 0px 5px; background-color: rgb(230, 230, 230); top: 0px;">
                      </div>
                      <button style="background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; display: block; border: 0px none; margin: 0px; padding: 0px; position: relative; cursor: pointer; -moz-user-select: none; overflow: hidden; width: 40px; height: 40px; top: 0px; left: 0px;" draggable="false" title="Zoom out" aria-label="Zoom out" type="button" class="gm-control-active">
                       
                      </button>
                    </div>
                  </div>
                  <div class="gm-svpc" style="background-color: rgb(255, 255, 255); box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; width: 40px; height: 40px; cursor: url(&quot;https://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;), default; touch-action: none; position: absolute; left: 0px; top: 0px;" controlwidth="40" controlheight="40">
                    <div style="position: absolute; left: 50%; top: 50%;">
                    </div>
                    <div style="position: absolute; left: 50%; top: 50%;">
                     
                    </div>
                  </div>
                  <div class="gmnoprint" controlwidth="40" controlheight="40" style="display: none; position: absolute;">
                    <div style="width: 40px; height: 40px;">
                      <button style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; display: none; border: 0px none; margin: 0px 0px 32px; padding: 0px; position: relative; cursor: pointer; -moz-user-select: none; width: 40px; height: 40px; top: 0px; left: 0px; overflow: hidden; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px;" draggable="false" title="Rotate map 90 degrees" aria-label="Rotate map 90 degrees" type="button" class="gm-control-active">
                        
                      </button>
                      <button style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; display: block; border: 0px none; margin: 0px; padding: 0px; position: relative; cursor: pointer; -moz-user-select: none; width: 40px; height: 40px; top: 0px; left: 0px; overflow: hidden; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px;" draggable="false" title="Tilt map" aria-label="Tilt map" type="button" class="gm-tilt gm-control-active">
                       
                      </button>
                    </div>
                  </div>
                </div>
                <div class="gmnoprint" style="margin: 10px; z-index: 0; position: absolute; cursor: pointer; left: 0px; top: 0px;">
                  <div style="float: left; position: relative;" class="gm-style-mtc">
                    <div role="button" tabindex="0" title="Show street map" aria-label="Show street map" aria-pressed="true" style="direction: ltr; overflow: hidden; text-align: center; height: 40px; display: table-cell; vertical-align: middle; position: relative; color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -moz-user-select: none; font-size: 18px; background-color: rgb(255, 255, 255); padding: 0px 17px; border-bottom-left-radius: 2px; border-top-left-radius: 2px; background-clip: padding-box; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; min-width: 36px; font-weight: 500;" draggable="false">Map
                    </div>
                    <div style="background-color: white; z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; position: absolute; left: 0px; top: 40px; text-align: left; display: none;">
                      <div style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -moz-user-select: none; font-size: 18px; background-color: rgb(255, 255, 255); padding: 6px 8px 6px 6px; direction: ltr; text-align: left; white-space: nowrap;" draggable="false" title="Show street map with terrain">
                        <span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; background-color: rgb(255, 255, 255); border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle;">
                          <div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden; display: none;">
                            <img style="position: absolute; left: -52px; top: -44px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none; width: 68px; height: 67px;" alt="" src="https://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false">
                          </div>
                        </span>
                        <label style="vertical-align: middle; cursor: pointer;">Terrain
                        </label>
                      </div>
                    </div>
                  </div>
                  <div style="float: left; position: relative;" class="gm-style-mtc">
                    <div role="button" tabindex="0" title="Show satellite imagery" aria-label="Show satellite imagery" aria-pressed="false" style="direction: ltr; overflow: hidden; text-align: center; height: 40px; display: table-cell; vertical-align: middle; position: relative; color: rgb(86, 86, 86); font-family: Roboto, Arial, sans-serif; -moz-user-select: none; font-size: 18px; background-color: rgb(255, 255, 255); padding: 0px 17px; border-bottom-right-radius: 2px; border-top-right-radius: 2px; background-clip: padding-box; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; min-width: 69px; border-left: 0px none;" draggable="false">Satellite
                    </div>
                    <div style="background-color: white; z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; position: absolute; right: 0px; top: 40px; text-align: left; display: none;">
                      <div style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -moz-user-select: none; font-size: 18px; background-color: rgb(255, 255, 255); padding: 6px 8px 6px 6px; direction: ltr; text-align: left; white-space: nowrap;" draggable="false" title="Show imagery with street names">
                        <span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; background-color: rgb(255, 255, 255); border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle;">
                          <div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden;">
                            <img style="position: absolute; left: -52px; top: -44px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; max-width: none; width: 68px; height: 67px;" alt="" src="https://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false">
                          </div>
                        </span>
                        <label style="vertical-align: middle; cursor: pointer;">Labels
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

@endsection

@section('scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.4/build/jquery.datetimepicker.full.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/react/15.5.0/react.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/react/15.5.0/react-dom.js"></script> -->
<!-- <script src="https://unpkg.com/babel-standalone@6.24.0/babel.min.js"></script> -->

<script type="text/javascript">

  

    window.Tranxit = {!! json_encode([
        "minDate" => \Carbon\Carbon::today()->format('Y-m-d\TH:i'),
        "maxDate" => \Carbon\Carbon::today()->addDays(30)->format('Y-m-d\TH:i'),
        "map" => false,
    ]) !!}

var logic = function( currentDateTime ){
  // 'this' is jquery object datetimepicker
  if( currentDateTime.getDay()==6 ){
    this.setOptions({
      minTime:'11:00'
    });
  }else
    this.setOptions({
      minTime:'8:00'
    });
};
jQuery('#schedule_time').datetimepicker({
  onChangeDateTime:logic,
  onShow:logic
});

</script>
<script type="text/javascript">

    $(document).ready(function() {

$('#serviceType').on('change', function() {
  alert( this.value );
});

    

        

        $("body").addClass("compact-sidebar");

        $("#create-ride").hide();
        $("#itemList").show();

        $("#add_u").click(function(){
           // alert("The paragraph was clicked.");
           $("#create-ride").show();
           $("#itemList").hide();

             $('#serviceType').trigger("change");

          }); 
        


    });
</script>

<!-- <script type="text/javascript" src="{{ asset('asset/js/dispatcher-map.js') }}"></script> -->
<!-- <script type="text/babel" src="{{ asset('asset/js/dispatcher.js') }}"></script> -->
<script src="https://maps.googleapis.com/maps/api/js?key={{ env('GOOGLE_MAP_KEY') }}&libraries=places&callback=initMap" async defer></script>
@endsection

@section('styles')
<style type="text/css">
    .my-card input{
        margin-bottom: 10px;
    }
    .my-card label.checkbox-inline{
        margin-top: 10px;
        margin-right: 5px;
        margin-bottom: 0;
    }
    .my-card label.checkbox-inline input{
        position: relative;
        top: 3px;
        margin-right: 3px;
    }
    .my-card .card-header .btn{
        font-size: 10px;
        padding: 3px 7px;   
    }
    .tag.my-tag{
        padding: 10px 15px;
        font-size: 11px;
    }

    .add-nav-btn{
        padding: 5px 15px;
        min-width: 0;
    }

    .dispatcher-nav li span {
        background-color: transparent;
        color: #000!important;
        padding: 5px 12px;
    }

    .dispatcher-nav li span:hover,
    .dispatcher-nav li span:focus,
    .dispatcher-nav li span:active {
        background-color: #20b9ae;
        color: #fff!important;
        padding: 5px 12px;
    }

    .dispatcher-nav li.active span,
    .dispatcher-nav li span:hover,
    .dispatcher-nav li span:focus,
    .dispatcher-nav li span:active {
        background-color: #20b9ae;
        color: #fff!important;
        padding: 5px 12px;
    }

    @media (max-width:767px){
        .navbar-nav {
            display: inline-block;
            float: none!important;
            margin-top: 10px;
            width: 100%;
        }
        .navbar-nav .nav-item {
            display: block;
            width: 100%;
            float: none;
        }
        .navbar-nav .nav-item .btn {
            display: block;
            width: 100%;
        }
        .navbar .navbar-toggleable-sm {
            padding-top: 0;
        }
    }

    .items-list {
        height: 450px;
        overflow-y: scroll;
    }
</style>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.4/jquery.datetimepicker.min.css" />
@endsection