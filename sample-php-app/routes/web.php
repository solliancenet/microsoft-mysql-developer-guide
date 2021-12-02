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

Route::get('/', 'HomeController@index');
Route::get('/category-list', 'HomeController@categoryList')->name('category-list');
Route::get('/item-list/{category}', 'HomeController@itemList')->name('item-list');

Route::get('/welcome', function () {
    return view('welcome');
});
Route::get('/skeleton', function () {
    return view('skeleton');
});
