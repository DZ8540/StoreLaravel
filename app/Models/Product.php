<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
  use HasFactory;

  protected $fillable = ['code', 'name', 'category_id', 'description', 'image', 'price'];

  public function category() {
    return $this->belongsTo(Category::class);
  }

  public function getPriceForCount() {
    return $this->pivot->count * $this->price;
  }
}
