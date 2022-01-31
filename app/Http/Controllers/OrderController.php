<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;
use App\Order;
use App\OrderDetail;
use App\User;
use Auth;
use DB;

class OrderController extends Controller
{
    public function __construct(){
        $this->middleware('auth');
    }

    public function edit($id)
    {

        $user = Auth::user();
        $cartItems = DB::table('orders_detail')->get()
        ->where('users_id', $user->id);
        $sums = DB::table('orders_detail')
            ->where('users_id', $user->id)
            ->sum('total_price');
        $orders_id = DB::table('orders_detail')
            ->where('users_id', $user->id)->select('orders_id')
            ->pluck('orders_id')->first();

        // dd($cartItems);

        return view('order.edit', compact('cartItems', 'sums', 'orders_id'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'order_address' => 'required',
            'shipping_address' => 'required',
        ]);

        $sums = DB::table('orders_detail')
            ->where('users_id', Auth::id())
            ->sum('total_price');

        $query = DB::table('orders')
                -> where('id', $id)
                -> update([
                    'amount' => $sums,
                    'shipping_address' => $request['shipping_address'],
                    'order_address' => $request['order_address'],
                    'order_date' => date('Y-m-d'),
                    'status' => 'clear'
                ]);

        return redirect('/shop');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
}
