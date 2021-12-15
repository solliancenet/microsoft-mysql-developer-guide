<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

use App\Helpers\AppHelper;
use App\Models\Item;

class CartController extends Controller
{

	// pages:

	public function checkout()
	{
		$user = session('user');
		$cart = session('cart');
		$item_list = [];
		if ($cart) $item_list = array_keys($cart);
		if (AppHelper::instance()->checkDB() && Schema::hasTable('items') && Schema::hasTable('carts')) {
			$item = Item::whereIn('id',$item_list)->orderBy('name')->get();
			$json = 0;
		} else {
			// if there's no database connection, use a helper and JSON data
			$item = AppHelper::instance()->itemJson('items',$item_list);
			// set a flag so we can display a warning if JSON data is used
			$json = 1;
		}
		$cart_total = 0;
		$cart_data = [];
		foreach($item as $i) {
			$qty = $cart[$i->id];
			$i->qty = $qty;
			// set price to 0 in the event there is bad data
			$price = is_numeric($i->price) ? $i->price : '0';
			// set item subtotal
			$i->sub = $qty * number_format($price, 2);
			// increment cart total
			$cart_total += $i->sub;
			// add item to cart array
			$cart_data[$i->id] = $i;
		}
		return view('checkout', ['header'=>1, 'user'=>$user, 'cart_data'=>$cart_data, 'cart_total'=>$cart_total, 'json'=>$json]);
	}

	public function receipt()
	{
		$time_left = 0;

		// if we have a cart session, turn it into an order
		$cart = session('cart');
		if ($cart) {
			session()->forget('receipt');
			$item_list = array_keys($cart);
			if (AppHelper::instance()->checkDB() && Schema::hasTable('items') && Schema::hasTable('carts')) {
				$item = Item::whereIn('id',$item_list)->orderBy('name')->get();
				$json = 0;
			} else {
				// if there's no database connection, use a helper and JSON data
				$item = AppHelper::instance()->itemJson('items',$item_list,'cooktime');
				// set a flag so we can display a warning if JSON data is used
				$json = 0;
			}

			// show a semi-random delivery time to make it more fun
			$cooktime = 0;
			// start with a random prep/drive time
			$time = rand(5,20);
			foreach($item as $i) {
				// get the longest cooktime of all items in the cart
				if ($cooktime < $i->cooktime) { 
					$cooktime = $i->cooktime; 
				}
			}
			// add the cooktime to the random prep/drive time
			$time+=$cooktime;
			// turn it into minutes from *right now*
			$delivery = strtotime(now())+($time*60);

			session()->forget('cart');
			if (!session('receipt')) {
				session([ 'receipt' => [] ]);
			}
			session([ 'receipt' => ['created_at'=>strtotime(now()), 'delivery'=>$delivery], 'json'=>$json ]);
		}

		// if there was no cart, then either use the receipt session or display a generic message
		$receipt = session('receipt');

		// figure out how many minutes are left before food arrives
		$time_left = floor( ($receipt['delivery'] - strtotime(now()) )/60 );

		return view('receipt', ['header'=>1, 'receipt'=>$receipt, 'time_left'=>$time_left]);
	}



	// ajax:

	public function addToCart(Request $request)
	{
		$id = $request->item;
		if (!session('cart')) {
			session([ 'cart' => [] ]);
		}
		$cart = session('cart');
		if (isset($cart[$id])) {
			$cart[$id]++;
		} else {
			$cart[$id] = 1;
		}
		session(['cart' => $cart]);

		// update the floating cart
		$global_cart = AppHelper::instance()->globalCart();

		return ['count'=>count(session('cart')),'html'=>$global_cart];
	}

	public function updateCart(Request $request)
	{
		$item = $request->cart_items;
		$cart = session('cart');
		foreach ($item as $id => $qty) {
			if (isset($cart[$id]) && $qty<1) {
				unset($cart[$id]);
			} else {
				$cart[$id] = $qty;
			}
		}
		session(['cart' => $cart]);

		// update the floating cart
		$global_cart = AppHelper::instance()->globalCart('show');

		return ['count'=>count(session('cart')),'html'=>$global_cart];
	}

}
