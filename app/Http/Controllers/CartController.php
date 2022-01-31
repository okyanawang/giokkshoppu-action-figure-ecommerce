<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller{
    public function __construct(){
        $this->middleware('auth');
    }

    public function index(){
        $user = Auth::user();
        $cartItems = DB::table('orders_detail')->get()
        ->where('users_id', $user->id);
        $sums = DB::table('orders_detail')
            ->where('users_id', $user->id)
            ->sum('total_price');
        $orders_id = DB::table('orders_detail')
            ->where('users_id', $user->id)->select('orders_id')
            ->pluck('orders_id')->first();
        // dd($sums);
        return view('carts.index', compact('cartItems', 'user', 'sums', 'orders_id'));
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

        Alert::success('Success', 'Order Succes');
        return redirect('/cart');
    }
}
