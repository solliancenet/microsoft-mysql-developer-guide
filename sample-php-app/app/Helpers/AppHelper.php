<?php

namespace App\Helpers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class AppHelper
{

	public static function instance()
	{
		return new AppHelper();
	}


	// display a cart icon and a floating list of items in the cart
	public function globalCart($show=null) {
		$cart = session('cart');
		$cart_total = 0;
		$cart_data = [];
		if ($cart) {
			$item = AppHelper::instance()->itemJson('items',array_keys($cart));
			foreach($item as $i) {
				$qty = $cart[$i->id];
				$cart_total += $qty;
				$i->qty = $qty;
				$price = is_numeric($i->price) ? $i->price : '0';
				$i->sub = $qty * number_format($price, 2);
				$cart_data[$i->id] = $i;
			}
		}
		return view('includes/floating-cart')->with('cart_total',$cart_total)->with('cart_data',$cart_data)->with('show',$show)->render();
	}


	// use these functions to get json data when there's no database:

	// checks to see if database is connecting
	public function checkDB()
	{
		try {
			DB::connection()->getPdo();
		} catch (\Exception $e) {
			return false;
		}
		return true;
	}

	// returns a user (if ID is provide) or a list of users
	public function userJson($id=null)
	{
		$json = '[ 
			{"id":1,"name":"Bob Slydell","address":"820 Beach Street","email":"bslydell@gmail.com","password":"$2y$10$7LnWpy7R7hXgbMnn.IHaSu8i.9E0dTB4tuMVHFm77OwSV46qbIvWa"},
			{"id":2,"name":"Bill Lumbergh","address":"9318 South Pulaski Ave.","email":"blumbergh@gmail.com","password":"$2y$10$XuvN1ti/OL5mdiPtdd0z6O5b1m0Yft3WHhk3zJphZhr4GrH0OhOzK"},
			{"id":3,"name":"Barbara Reiss","address":"849 East Depot St.","email":"breiss@gmail.com","password":"$2y$10$ElCTjmvfndxWb/Z8EpDQkeKFCr0v1N8QSokKzEeXXwwHpPJhPv4EC"},
			{"id":4,"name":"Nina McInroe","address":"839 Illinois St.","email":"nmcinroe@gmail.com","password":"$2y$10$GnIyO51JnABQ2yt/6NCzKOkubSPxq49PST5jWOpfGOhu0emBkNR9e"},
			{"id":5,"name":"Drew Pitts","address":"234 Depot Ave.","email":"dpitts@gmail.com","password":"$2y$10$ynxB0d5QI/x/s0H.Ks5zIOSlPCT5/LvT2s1EJPsvs1E9SckW3lk8C"},
			{"id":6,"name":"Jennifer Emerson","address":"71 Pierce St.","email":"jemerson@gmail.com","password":"$2y$10$ZeMIoZ9DPVx1Mmb6UldmQOBdpinovkCLtObAvJJr/aoC4ZV9X6RN."},
			{"id":7,"name":"Milton Waddams","address":"497 Thomas Avenue","email":"mwaddams@gmail.com","password":"$2y$10$uyeh/gADnu0PRxhBwfyLT.8sGEL4ndbS0oX8SLg6Ei.eyjE/fffoG"},
			{"id":8,"name":"Tom Smykowski","address":"25 Manchester Street","email":"tsmykowski@gmail.com","password":"$2y$10$CuTmay8q.38uCx67aHmTmu6WCDii0yXq4sP8bEcvilRS2e0puuYRK"},
			{"id":9,"name":"Dom Portwood","address":"905 Deerfield Lane","email":"dportwood@gmail.com","password":"$2y$10$nEaJMT8ZcuFl5BitQouXXOMyiBVs2OX0MPuHB.wtRyzvpr/64e7J6"}
		]';
		$users = collect(json_decode($json))->sortBy('name')->all();
		if ($id=='rand') {
			$id = rand(1,count($users));
		}
		if ($id) {
			$user = collect(json_decode($json))->where('id', $id)->first();
			return $user;
		} else {
			return $users;
		}
	}

	// returns the list of categories
	public function categoryJson()
	{
		$json = '[ 
			{"id":1,"name":"Breakfast","url":"breakfast","img":"potatoes-g792cf4128_1920.jpg"}, 
			{"id":2,"name":"Steak","url":"steak","img":"tomahawk-ge5ea2413d_1920.jpg"}, 
			{"id":3,"name":"Pizza","url":"pizza","img":"pizza-g204a8b3d6_1920.jpg"},
			{"id":4,"name":"Burgers","url":"burgers","img":"hamburger-g685f013b8_1920.jpg"},
			{"id":5,"name":"Sushi","url":"sushi","img":"food-g3eb975adc_1920.jpg"},
			{"id":6,"name":"Salads","url":"salads","img":"salad-g3f02f56a0_1920.jpg"}
		]';
		$category = collect(json_decode($json))->sortBy('name')->all();
		return $category;
	}

	// returns a list of items
	public function itemJson($type=null,$id=null,$sort='name')
	{
		$json = '[ 
			{"id":1,"category":1,"name":"Cinnamon Roll","img":"cinnamon-rolls-gb12ce8577_1920.jpg","price":"1.19","cooktime":"13","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":2,"category":1,"name":"Toast & Eggs","img":"breakfast-g7a2675ee6_1920.jpg","price":"2.19","cooktime":"7","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":3,"category":1,"name":"Croissant","img":"croissant-ga61b1fb0e_1920.jpg","price":"3.19","cooktime":"2","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":4,"category":1,"name":"Bacon & Eggs","img":"eggs-g9c07e92b1_1920.jpg","price":"4.19","cooktime":"14","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":5,"category":1,"name":"Pancakes","img":"pancakes-g9d341228a_1920.jpg","price":"5.19","cooktime":"12","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":6,"category":1,"name":"Biscuits & Gravy","img":"biscuits-g07bd069f8_1920.jpg","price":"6.19","cooktime":"6","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},

			{"id":7,"category":2,"name":"Tomahawk","img":"steak-4342500_1920.jpg","price":"1.29","cooktime":"27","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":8,"category":2,"name":"Sirloin","img":"steak-1076665_1920.jpg","price":"2.29","cooktime":"22","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":9,"category":2,"name":"T-Bone","img":"steak-978654_1920.jpg","price":"3.29","cooktime":"23","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},

			{"id":10,"category":3,"name":"Pepperoni","img":"pizza-1344720_1920.jpg","price":"","cooktime":"12","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":11,"category":3,"name":"Margherita","img":"pizza-3000274_1920.jpg","price":"3","cooktime":"6","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},

			{"id":12,"category":4,"name":"Sliders","img":"hamburger-494706_1920.jpg","price":"1.49","cooktime":"9","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":13,"category":4,"name":"Charbroiled","img":"hamburger-1238246_1920.jpg","price":"2.49","cooktime":"17","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":14,"category":4,"name":"Diner Burger","img":"burger-3442227_1920.jpg","price":"3.49","cooktime":"12","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},

			{"id":15,"category":5,"name":"Sashimi Fresh Roll","img":"sushi-354628_1920.jpg","price":"1.59","cooktime":"3","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":16,"category":5,"name":"Power Fish","img":"sushi-2853382_1920.jpg","price":"2.59","cooktime":"5","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":17,"category":5,"name":"Spicy Tuna","img":"sushi-599721_1920.jpg","price":"3.59","cooktime":"7","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":18,"category":5,"name":"Avocado Roll","img":"maki-716432_1920.jpg","price":"4.59","cooktime":"2","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":19,"category":5,"name":"Sampler Plate","img":"sushi-2856545_1920.jpg","price":"5.59","cooktime":"4","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":20,"category":5,"name":"Veggie Roll","img":"sushi-2020287_1920.jpg","price":"6.59","cooktime":"2","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":21,"category":5,"name":"Maki","img":"sushi-748139_1920.jpg","price":"7.59","cooktime":"5","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},

			{"id":22,"category":6,"name":"Bowl of Lettuce","img":"food-1834645_1920.jpg","price":"1.69","cooktime":"1","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
			{"id":23,"category":6,"name":"Plate of Lettuce","img":"salad-2150548_1920.jpg","price":"2.69","cooktime":"1","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."}
		]';

		// need this to search json
		$category_to_id = [];
		$category_list = collect($this->categoryJson());
		foreach($category_list as $c) {
			$category_to_id[ $c->url ] = $c->id;
		}

		if ($type=='byCategory') {
			$item = collect(json_decode($json))->where('category', $category_to_id[$id])->sortBy('name')->all();
		} elseif ($type=='item') {
			$item = collect(json_decode($json))->where('id', $id)->first();
		} elseif ($type=='items') {
			$item = collect(json_decode($json))->whereIn('id', $id)->sortBy($sort)->all();
		} else {
			$item = collect(json_decode($json))->sortBy('name')->all();
		}

		return $item;
	}


}
