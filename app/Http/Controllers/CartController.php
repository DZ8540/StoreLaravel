<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
  public function cart() {
    $orderId = session('orderId');
    if (!is_null($orderId)) {
      $order = Order::findOrFail($orderId);
    }
    return view('cart', compact('order'));
  }

  public function pay() {
    $orderId = session('orderId');
    if (is_null($orderId)) {
      return redirect()->route('index');
    }
    $order = Order::find($orderId);
    return view('pay', compact('order'));
  }

  public function add($productId) {
    $orderId = session('orderId');
    if (is_null($orderId)) {
      $order = Order::create();
      session(['orderId' => $order->id]);
    } else {
      $order = Order::find($orderId);
    }

    if ($order->products->contains($productId)) {
      $pivotRow = $order->products()->where('product_id', $productId)->first()->pivot;
      $pivotRow->count++;
      $pivotRow->update();
    } else {
      $order->products()->attach($productId);
    }

    if (Auth::check()) {
      $order->user_id = Auth::id();
      $order->save();
    }

    $product = Product::find($productId);

    session()->flash('success', 'Был добавлен товар ' . $product->name);

    return redirect()->route('cart');
  }

  public function remove($productId) {
    $orderId = session('orderId');
    if (is_null($orderId)) {
      return redirect()->route('cart');
    }
    $order = Order::find($orderId);

    if ($order->products->contains($productId)) {
      $pivotRow = $order->products()->where('product_id', $productId)->first()->pivot;
      if ($pivotRow->count < 2) {
        $order->products()->detach($productId);
      } else {
        $pivotRow->count--;
        $pivotRow->update();
      }
    }

    session()->flash('warning', 'Товар был удален!');

    return redirect()->route('cart');
  }

  public function order(Request $request) {
    $orderId = session('orderId');
    if (is_null($orderId)) {
      return redirect()->route('index');
    }
    $order = Order::find($orderId);
    $success = $order->saveOrder($request->name, $request->phone);
    if ($success) {
      session()->flash('success', 'Ваш заказа был успешно принят!');
    } else {
      session()->flash('warning', 'Случилась ошибка!');
    }

    return redirect()->route('index');
  }
}
