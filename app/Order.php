<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = ["amount", "shipping_address", "order_address", "order_date", "status", "users_id"];
}
