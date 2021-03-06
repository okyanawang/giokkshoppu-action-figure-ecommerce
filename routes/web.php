<?php

use App\Http\Controllers\CartController;

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
// Route::post('/', 'HomeController@store');

Auth::routes();

Route::resource('product', 'ProductController');
Route::resource('order', 'OrderController')->only([
    'edit', 'update'
]);
Route::resource('category', 'CategoryController')->only([
    'show'
]);

Route::get('/shop', 'ShopController@index');
Route::post('/shop', 'ShopController@store');
Route::get('/cart', 'CartController@index');
Route::post('/cart', 'CartController@store');

// Route::get('cart', [CartController::class, 'cartList'])->name('cart.list');
// Route::post('cart', [CartController::class, 'addToCart'])->name('cart.store');
// Route::post('update-cart', [CartController::class, 'updateCart'])->name('cart.update');
// Route::post('remove', [CartController::class, 'removeCart'])->name('cart.remove');
// Route::post('clear', [CartController::class, 'clearAllCart'])->name('cart.clear');

// Route::get('/auth', 'HomeController@index')->name('auth');
