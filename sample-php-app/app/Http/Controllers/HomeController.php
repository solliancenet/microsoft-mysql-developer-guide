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
		$user = session('user');
		$cart = session('cart');

		// set a flag so we can display a warning if JSON data is used
		$json = 0;

		// get random user, simulate we're logged in
		if (!$user || !$cart) {
			if (AppHelper::instance()->checkDB() && Schema::hasTable('users')) {
				$user = User::inRandomOrder()->first();
			} else {
				// if there's no database connection, use a helper and JSON data
				$user = AppHelper::instance()->userJson('rand');
				$json = 1;
			}
		}
		session([ 'user' => $user ]);

		// floating cart on every page
		$global_cart = AppHelper::instance()->globalCart();

		return view('index', ['global_cart'=>$global_cart, 'user'=>$user, 'json'=>$json]);
	}

}
