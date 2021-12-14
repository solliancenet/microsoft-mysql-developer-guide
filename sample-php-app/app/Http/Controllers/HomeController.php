<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

use App\Helpers\AppHelper;
use App\Models\User;

class HomeController extends Controller
{

	// pages:
	
	public function index()
	{
		// get random user, like we logged in or something
		$user = session('user');
		$cart = session('cart');
		$json = 0;
		if (!$user || !$cart) {
			if (AppHelper::instance()->checkDB() && Schema::hasTable('users')) {
				$user = User::inRandomOrder()->first();
			} else {
				$user = AppHelper::instance()->userJson('rand');
				$json = 1;
			}
		}
		if ($user->name) {
			$name_parts = explode(' ', $user->name);
			$user->first_name = $name_parts[0];
			$user->last_name = $name_parts[1];
		}
		session([ 'user' => $user ]);

		$global_cart = AppHelper::instance()->globalCart();
		return view('index', ['global_cart'=>$global_cart, 'user'=>$user, 'json'=>$json]);
	}

}
