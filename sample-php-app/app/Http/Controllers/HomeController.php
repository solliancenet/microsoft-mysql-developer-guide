<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

use App\Helpers\AppHelper;
use App\Models\Category;
use App\Models\Item;

class HomeController extends Controller
{

	// pages:
	
	public function index()
	{
		$global_cart = AppHelper::instance()->globalCart();
		return view('index', ['global_cart'=>$global_cart]);
	}
	
	public function categoryList()
	{
		if (AppHelper::instance()->checkDB() && Schema::hasTable('categories')) {
			$data = Category::orderBy('name')->get();
			$json = 0;
		} else {
			$data = AppHelper::instance()->categoryJson();
			$json = 1;
		}
		$global_cart = AppHelper::instance()->globalCart();
		return view('category-list', ['header'=>1, 'global_cart'=>$global_cart, 'category'=>$data, 'json'=>$json]);
	}
	
	public function itemList($category)
	{
		if (AppHelper::instance()->checkDB() && Schema::hasTable('categories') && Schema::hasTable('items')) {
			$data = Category::where('url',$category)->with('items')->first();
			$data = $data->items;
			$json = 0;
		} else {
			$data = AppHelper::instance()->itemJson('byCategory',$category);
			$json = 1;
		}
		$global_cart = AppHelper::instance()->globalCart();
		return view('item-list', ['header'=>1, 'global_cart'=>$global_cart, 'item'=>$data, 'json'=>$json]);
	}

	public function checkout()
	{
		$cart = session('cart');
		$item_list = [];
		if ($cart) $item_list = array_keys($cart);
		if (AppHelper::instance()->checkDB() && Schema::hasTable('items') && Schema::hasTable('carts')) {
			$item = Item::whereIn('id',$item_list)->orderBy('name')->get();
			$json = 0;
		} else {
			$item = AppHelper::instance()->itemJson('items',$item_list);
			$json = 1;
		}
		$cart_total = 0;
		$cart_data = [];
		foreach($item as $i) {
			$qty = $cart[$i->id];
			$i->qty = $qty;
			$price = is_numeric($i->price) ? $i->price : '0';
			$i->sub = $qty * number_format($price, 2);
			$cart_total += $i->sub;
			$cart_data[$i->id] = $i;
		}
		return view('checkout', ['header'=>1, 'cart_data'=>$cart_data, 'cart_total'=>$cart_total, 'json'=>$json]);
	}

	public function receipt()
	{
		$cart = session('cart');
		$item_list = [];
		$time_left = 0;
		if ($cart) {
			session()->forget('receipt');
			$item_list = array_keys($cart);
			if (AppHelper::instance()->checkDB() && Schema::hasTable('items') && Schema::hasTable('carts')) {
				$item = Item::whereIn('id',$item_list)->orderBy('name')->get();
				$json = 0;
			} else {
				$item = AppHelper::instance()->itemJson('items',$item_list,'cooktime');
				$json = 0;
			}
			$time = rand(5,20);
			$cooktime = 0;
			foreach($item as $i) {
				$cooktime = $i->cooktime;
			}
			$time+=$cooktime;
			session()->forget('cart');
			if (!session('receipt')) {
				session([ 'receipt' => [] ]);
			}
			session([ 'receipt' => ['created_at'=>strtotime(now()), 'delivery'=>strtotime(now())+($time*60)], 'json'=>$json ]);
		}
		$receipt = session('receipt');
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
		$global_cart = AppHelper::instance()->globalCart('show');
		return ['count'=>count(session('cart')),'html'=>$global_cart];
	}



}
