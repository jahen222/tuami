<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class JahenController extends Controller
{

    public function index1() {

        return view('index1');
    }

    public function terms_app() {

        return view('user.terms_app');
    }

    public function fees() {

        return view('user.fees');
    }

    public function refund() {

        return view('user.refund');
    }

    public function rideweb() {

        return view('rideweb');
    }
}
