<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Helpers\AppHelper;

class HomeController extends Controller
{

	// pages:
	
	public function index()
	{
		$global_cart = AppHelper::instance()->globalCart();
		return view('index', ['global_cart'=>$global_cart]);
	}

}
