<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;

class ShopController extends Controller
{
    public function __construct(){
        $this->middleware('auth');
    }
    
    public function index(){
        $products = DB::table('products')->get();
        $user = Auth::user();
        // dd($products);
        return view('shops.index', compact('products', 'user'));
    }

    public function store(Request $request){
        $unc = "unclear";
        $orders = DB::table('orders')
                     ->select('users_id')
                     ->where('users_id', $request["users_id"])
                     ->where('status', $unc)
                     ->first();

        // dd($orders);

        if(!$orders){
            $neworders = DB::table('orders')->insert([
                "users_id" => $request["users_id"],
                "amount" => 0,
                "shipping_address" => "none",
                "order_address" => "none",
                "order_date" => "2022-01-01",
                "status" => $unc
            ]);
        }

        // dd($neworders);

        $ambil_id = DB::table('orders')
        ->select('id')
        ->where('users_id', $request["users_id"])
        ->where('status', $unc)
        ->first();

        // dd($ambil_id);

        $pernah_order = DB::table('orders_detail')
            ->select('users_id')
            ->where('users_id', $request["users_id"])
            ->where('products_id', $request["id"])
            ->first();

        if(!$pernah_order){
            $query = DB::table('orders_detail')->insert([
                "users_id" => $request["users_id"],
                "products_id" => $request["id"],
                "price" => $request["price"],
                "total_price" => $request["price"],
                "quantity" => $request["quantity"],
                "image" => $request["image"],
                "name" => $request["name"],
                "orders_id" => $ambil_id->id
            ]);
        }

        // dd($query);

        // return redirect('/shop')->with('success', 'Product added to cart successfully!');
        return redirect('/shop')->with('success', 'Product added to cart successfully!');
    }
}
