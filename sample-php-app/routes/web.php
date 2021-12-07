<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


// pages:

Route::get('/', 'HomeController@index');
Route::get('/category-list', 'HomeController@categoryList')->name('category-list');
Route::get('/item-list/{category}', 'HomeController@itemList')->name('item-list');
Route::get('/checkout', 'HomeController@checkout')->name('checkout');
Route::get('/receipt', 'HomeController@receipt')->name('receipt');


// ajax:

Route::post('/add-to-cart', 'HomeController@addToCart');
Route::post('/update-cart', 'HomeController@updateCart');




// delete these:

Route::get('/welcome', function () {
    return view('welcome');
});
Route::get('/skeleton', function () {
    return view('skeleton');
});
