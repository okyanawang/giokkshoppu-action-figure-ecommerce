<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller{
    public function index(){
        $user = Auth::user();
        $cartItems = DB::table('orders_detail')->get()
        ->where('users_id', $user->id);
        $sums = DB::table('orders_detail')
            ->where('users_id', $user->id)
            ->sum('total_price');
        // dd($sums);
        return view('carts.index', compact('cartItems', 'user', 'sums'));
    }

    public function store(Request $request){
        $banyak = $request->quantity;
        $harga = $request->price;
        $res = $harga * $banyak;
        if($banyak < 1){
            DB::table('orders_detail')->where('id', $request->id)->delete();
        }else{
            $affected = DB::table('orders_detail')
                ->where('id', $request->id)
                ->update(['quantity' => $request->quantity, 'total_price' => $res]);
        }
        // dd($res);
        return redirect('/cart');
    }
}
