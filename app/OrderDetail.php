<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    protected $table = 'orders_detail';
    protected $fillabel = ['orders_id', 'products_id', 'price', 'quantity'];

    public function product()
    {
        return $this->belongsTo('App\Product', 'products_id');
    }

    public function order()
    {
        return $this->belongsTo('App\Order', 'orders_id');
    }
}
