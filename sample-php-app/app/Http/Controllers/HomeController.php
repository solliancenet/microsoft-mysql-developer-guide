<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Category;

class HomeController extends Controller
{
	
	public function index()
	{
		return view('index');
	}
	
	public function categoryList()
	{
		if ($this->checkDB()) {
			$data = Category::all();
		} else {
			// use JSON
			$json = '[ 
				{"id":1,"name":"Breakfast","url":"breakfast","img":"potatoes-g792cf4128_1920.jpg"}, 
				{"id":2,"name":"Steak","url":"steak","img":"tomahawk-ge5ea2413d_1920.jpg"}, 
				{"id":3,"name":"Pizza","url":"pizza","img":"pizza-g204a8b3d6_1920.jpg"},
				{"id":4,"name":"Burgers","url":"burgers","img":"hamburger-g685f013b8_1920.jpg"},
				{"id":5,"name":"Sushi","url":"sushi","img":"food-g3eb975adc_1920.jpg"},
				{"id":6,"name":"Salads","url":"salads","img":"salad-g3f02f56a0_1920.jpg"}
			]';
			$category = collect(json_decode($json));
		}
		return view('category-list', ['header'=>1,'category'=>$category]);
	}
	
	public function itemList($category)
	{
		if ($this->checkDB()) {
			$data = Category::all();
		} else {
			// use JSON
			$json = '[ 
				{"id":1,"category":1,"name":"Cinnamon Roll","img":"cinnamon-rolls-gb12ce8577_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":2,"category":1,"name":"Toast & Eggs","img":"breakfast-g7a2675ee6_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":3,"category":1,"name":"Croissant","img":"croissant-ga61b1fb0e_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":4,"category":1,"name":"Bacon & Eggs","img":"eggs-g9c07e92b1_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":5,"category":1,"name":"Pancakes","img":"pancakes-g9d341228a_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":6,"category":1,"name":"Biscuits & Gravy","img":"biscuits-g07bd069f8_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},

				{"id":7,"category":2,"name":"Tomahawk","img":"steak-4342500_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":8,"category":2,"name":"Sirloin","img":"steak-1076665_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":9,"category":2,"name":"T-Bone","img":"steak-978654_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},

				{"id":10,"category":3,"name":"Pepperoni","img":"pizza-1344720_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":11,"category":3,"name":"Margherita","img":"pizza-3000274_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},

				{"id":12,"category":4,"name":"Sliders","img":"hamburger-494706_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":13,"category":4,"name":"Charbroiled","img":"hamburger-1238246_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":14,"category":4,"name":"Diner Burger","img":"burger-3442227_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},

				{"id":15,"category":5,"name":"Sashimi Fresh Roll","img":"sushi-354628_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":16,"category":5,"name":"Power Fish","img":"sushi-2853382_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":17,"category":5,"name":"Spicy Tuna","img":"sushi-599721_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":18,"category":5,"name":"Avocado Roll","img":"maki-716432_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":19,"category":5,"name":"Sampler Plate","img":"sushi-2856545_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":20,"category":5,"name":"Veggie Roll","img":"sushi-2020287_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":21,"category":5,"name":"Maki","img":"sushi-748139_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},

				{"id":22,"category":6,"name":"Bowl of Lettuce","img":"food-1834645_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."},
				{"id":23,"category":6,"name":"Plate of Lettuce","img":"salad-2150548_1920.jpg","price":"9.99","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dignissim lacus vel odio sagittis, ut faucibus felis vulputate. Duis nisi quam, luctus eget augue vel, ullamcorper commodo ipsum. Nunc quam turpis, facilisis interdum vestibulum et, volutpat congue arcu."}

			]';
			// need this to search json
			$category_to_id = ['breakfast'=>1,'steak'=>2,'pizza'=>3,'burgers'=>4,'sushi'=>5 ,'salads'=>6];

			$item = collect(json_decode($json))->where('category', $category_to_id[$category])->sortBy('name')->all();
		}
		return view('item-list', ['header'=>1,'item'=>$item]);
	}

	public function checkDB()
	{
		try {
		    DB::connection()->getPdo();
		} catch (\Exception $e) {
		    return false;
		}
		return true;
	}

}
