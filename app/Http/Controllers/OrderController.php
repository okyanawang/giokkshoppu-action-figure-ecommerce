<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use App\OrderDetail;
use App\User;
use Auth;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $order = Order::findorfail($id);
        $details = OrderDetail::where('orders_id', $id)->get();
        $total = OrderDetail::where('orders_id', $id)->sum('price');
        return view('order.edit', compact('order', 'details', 'total'));
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

        $total = OrderDetail::where('orders_id', $id)->sum('price');

        $order_data = [
            'amount' => $total,
            'shipping_address' => $request->shipping_address,
            'order_address' => $request->order_address,
            'order_date' => date('Y-m-d'),
            'status' => "sudah order"
        ];

        $order = Order::findorfail($id);
        // dd($order);

        Order::create([
            'amount' => 0,
            'shipping_address' => "empty",
            'order_address' => "empty",
            'order_date' =>  date('Y-m-d'),
            'status' => "belum order",
            'users_id' => Auth::id()
        ]);

        $order->update($order_data);

        return redirect('/');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
