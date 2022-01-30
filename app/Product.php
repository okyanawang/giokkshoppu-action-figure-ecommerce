<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = ["name", "price", "weight", "stock", "description", "image", "categories_id"];

    public function category()
    {
        return $this->belongsTo('App\Category', 'categories_id');
    }

    public function orderdetails()
    {
        return $this->hasMany('App\OrderDetail');
    }
}
