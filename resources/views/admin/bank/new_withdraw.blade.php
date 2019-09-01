@extends('admin.layout.base')

@section('title', 'Withdraw')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <h5 class="mb-1">NeW Account  <a href="/blog" target="_blank"> </a> </h5>
           
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th ">Request ID </th>
                        
                        <th >Amount</th>
                       
                        <th >Request_date</th>
                       
                        <th >status</th>
                        <th >Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($bank as $index => $service)
					
				
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>ReqXc_{{ $service->id }}</td>
                        <td>{{ $service->amount }}</td>
                        <td>{{ $service->created_at }}</td>
                        <td>{{ $service->status }}</td>
                        
                       
                    
                        <td>
                           <!--  <form action="{{ route('admin.bank.destroy', $service->id) }}" method="POST"> -->

                             <!-- <form action="#" method="POST"> -->
                                {{ csrf_field() }}
                                {{ method_field('DELETE') }}
                             <!--    <a href="{{ route('admin.bank.edit', $service->id) }}" class="btn btn-info btn-block">
                                    <i class="fa fa-pencil"></i> Edit
                                </a> -->
                                <button class="btn btn-primary btn-lg" data="{{ $service->id }}">
                                     Details
                                </button>
                            

                            <!-- </form> -->
                        </td>
                    </tr>


                   
                @endforeach
                </tbody>
              
            </table>
        </div>
    </div>
</div>

 <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <a type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" >Requested for withdraw </h4>
      </div>
      <div class="modal-body">
 



<div class="container">
      <div class="row">
    
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" style="width: 100%;left: 28px;" >
   
   
          <div class="panel panel-info">
           
            <div class="panel-body">
              <div class="row">
              
                
               
                <div class=" col-md-12 col-lg-12 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Account Name:</td>
                        <td id="account_name"></td>
                      </tr>
                      <tr>
                        <td>Bank Name:</td>
                        <td id="bank_name"></td>
                      </tr>
                      <tr>
                        <td>Account Number</td>
                        <td id="account_number"></td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td>Routing Number</td>
                        <td id="routing_number"></td>
                      </tr>
                        <tr>
                        <td>Withdraw Amount</td>
                        <td id="amount"></td>
                      </tr>
                      <tr>
                        <td>Request Date</td>
                        <td id="date"></td>
                      </tr>
                        <td>Country</td>
                        <td id="country">  </td>
                           
                      </tr>
                     
                    </tbody>
                  </table>
                  
               
                </div>
              </div>
            </div>
                 
            
          </div>
        </div>
      </div>
    </div>

<div id="msg"></div>

      </div>
      <div class="modal-footer">
        <a type="button" id="ApprovedId" class="btn btn-primary " ><span aria-hidden="true">Approved</a>
      </div>
    </div>
  </div>
</div>


@endsection