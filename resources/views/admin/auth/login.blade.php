@extends('admin.layout.auth')

@section('content')
<div class="sign-form">
    <div class="row">
        <div class="col-md-4 offset-md-4 px-3">
            <div class="box b-a-0">
                <div class="p-2 text-xs-center">
                    <h4><i style="color:red">Tuami</i> | Admin Login</h4>
                     <hr/>
                </div>
                <form class="form-material mb-1" role="form" method="POST" action="{{ url('/admin/login') }}" >
                {{ csrf_field() }}
                    <div class="form-group {{ $errors->has('email') ? ' has-error' : '' }}">
                        <input type="email" name="email" required="true" class="form-control" id="email" placeholder="Email">

                        @if ($errors->has('email'))
                            <span class="help-block" style="margin-left: 55px;color: red;">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                        @endif
                    </div>
                    <div class="form-group {{ $errors->has('password') ? ' has-error' : '' }}">
                        <input type="password" name="password" required="true" class="form-control" id="password" placeholder="Password">
                        @if ($errors->has('password'))
                            <span class="help-block" style="margin-left: 55px;color: red;">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                        @endif
                    </div>
                    <div class="px-2 form-group mb-0">
                        <input type="checkbox" name="remember"> Remember Me
                    </div>
                    <br>
                    <div class="px-2 form-group mb-0">
                        <button type="submit" class="btn btn-success btn-block waves-effect waves-light btn-lg"><i class="ti-arrow-right float-xs-right"></i>Login</button>
                    </div>
                </form>
                <div class="p-2 text-xs-center text-muted">
                    <a class="text-black" href="{{ url('/admin/password/reset') }}"><span class="underline">Forgot Your Password?</span></a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
