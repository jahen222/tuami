<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SignInControlller extends Controller
{
    //

    public function index()
    {
        return view('user.layout.signin');

    }

	public function passengerSignin()
    {
        return view('user.layout.passengersignin');

    }

}
