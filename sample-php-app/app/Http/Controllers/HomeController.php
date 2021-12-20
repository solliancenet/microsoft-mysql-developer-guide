<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

use App\Helpers\AppHelper;
use App\Models\User;

class HomeController extends Controller
{

	/*
		Using the default Laravel 8 installation, this app example attempts to cover the very basic 
		essentials without getting too complex. We've provided sample JSON data so the app can function 
		even if there is no database connection. (JSON data can be found in /app/Helpers/AppHelper.php)
	*/

	// pages:
	
	public function index()
	{
		// pretend the user logged in
		$user = AppHelper::instance()->randomUser();

		// display the floating cart
		$global_cart = AppHelper::instance()->globalCart();

		return view('index', ['global_cart'=>$global_cart, 'user'=>$user]);
	}

}
