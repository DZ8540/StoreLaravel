<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RouteController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ProductController;

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

Auth::routes();

Route::get('/', [RouteController::class, 'index'])->name('index');

Route::get('/categories', [RouteController::class, 'categories'])->name('categories');

Route::group(['prefix' => 'cart'], function() {
  Route::post('/add/{productId}', [CartController::class, 'add'])->name('cart.add');

  Route::group(['middleware' => 'cart_is_not_empty'], function() {
    Route::get('/', [CartController::class, 'cart'])->name('cart');

    Route::post('/remove/{productId}', [CartController::class, 'remove'])->name('cart.remove');

    Route::post('/addOrder', [CartController::class, 'order'])->name('cart.order');

    Route::get('/pay', [CartController::class, 'pay'])->name('cart.pay');
  });
});

Route::middleware(['auth', 'is_admin'])->prefix('admin')->group(function() {
  Route::get('/orders', [App\Http\Controllers\HomeController::class, 'index'])->name('admin');

  Route::resource('categories', CategoryController::class);

  Route::resource('products', ProductController::class);
});

Route::get('/{category}', [RouteController::class, 'category'])->name('category');

Route::get('/{category}/{product?}', [RouteController::class, 'product'])->name('product');
