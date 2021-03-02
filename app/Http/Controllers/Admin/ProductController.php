<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;

class ProductController extends Controller
{
  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index()
  {
    $products = Product::get();
    return view('admin.products.index', compact('products'));
  }

  /**
   * Show the form for creating a new resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function create()
  {
    $categories = Category::get();
    return view('admin.products.form', compact('categories'));
  }

  /**
   * Store a newly created resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @return \Illuminate\Http\Response
   */
  public function store(Request $request)
  {
    Product::create($request->all());
    return redirect()->route('products.index');
  }

  /**
   * Display the specified resource.
   *
   * @param  \App\Models\product  $product
   * @return \Illuminate\Http\Response
   */
  public function show(product $product)
  {
    return view('admin.products.show', compact('product'));
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  \App\Models\product  $product
   * @return \Illuminate\Http\Response
   */
  public function edit(product $product)
  {
    $categories = Category::get();
    return view('admin.products.form', compact('product', 'categories'));
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  \App\Models\product  $product
   * @return \Illuminate\Http\Response
   */
  public function update(Request $request, product $product)
  {
    $product->update($request->all());
    return redirect()->route('products.index');
  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  \App\Models\product  $product
   * @return \Illuminate\Http\Response
   */
  public function destroy(product $product)
  {
    $product->delete();
    return redirect()->route('products.index');
  }
}
