<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

use App\Helpers\AppHelper;
use App\Models\Category;
use App\Models\Item;

class ProductController extends Controller
{

	// pages:

	public function categoryList()
	{
		if (AppHelper::instance()->checkDB() && Schema::hasTable('categories')) {
			$data = Category::orderBy('name')->get();
			$json = 0;
		} else {
			// if there's no database connection, use a helper and JSON data
			$data = AppHelper::instance()->categoryJson();
			// set a flag so we can display a warning if JSON data is used
			$json = 1;
		}

		// floating cart on every page
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
			// if there's no database connection, use a helper and JSON data
			$data = AppHelper::instance()->itemJson('byCategory',$category);
			// set a flag so we can display a warning if JSON data is used
			$json = 1;
		}

		// floating cart on every page
		$global_cart = AppHelper::instance()->globalCart();

		return view('item-list', ['header'=>1, 'global_cart'=>$global_cart, 'item'=>$data, 'json'=>$json]);
	}

}
