@extends('user.layout.base')

@section('title', 'FAQ ')

@section('content')
<div class="content-area py-1">
    <div class="container-fluid">

        <div class="box box-block bg-white">
            <div class="row no-margin ride-detail">
            <div class="col-md-12">
            @if($faqs->count() > 0)

                <table class="table table-condensed" style="border-collapse:collapse;">

                    <thead>
                        <tr>
                            <th class="col-md-6" colspan="2"><h5>FAQ</h5></th>
                        </tr>
                    </thead>

                    <tbody>
                    @foreach($faqs as $faq)

                        <tr data-toggle="collapse" data-target="#faq_{{$faq->faq_id}}" class="accordion-toggle collapsed">
                            <td class="col-md-1"><span class="arrow-icon fa fa-chevron-right"></span></td>
                            <td class="col-md-11">{{ $faq->question }}</td>
        
                        </tr>

                        <tr class="hiddenRow">
                            <td class="col-md-1"></td>
                            <td class="col-md-11">
                                <div class="accordian-body collapse row" id="faq_{{$faq->faq_id}}">
                                    <div class="col-md-12">
                                        <!-- <div class="my-trip-left"> -->
                                            {{ $faq->answer }}
                                        <!-- </div> -->
                                    </div>
                                </div>            
                            </td>
                        </tr>
                        @endforeach


                    </tbody>
                </table>
                @else
                    <hr>
                    <p style="text-align: center;">No faqs Available</p>
                @endif
            </div>
            </div>
        </div>    

    </div>
</div>
@endsection