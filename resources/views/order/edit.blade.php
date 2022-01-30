@extends('layouts.master')

@section('content')
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>Checkout Product</h2>
                            <p>Home <span>-</span> Tracking Order</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="checkout_area padding_top">
        <div class="container">
          <div class="billing_details">
            <div class="row">
              <div class="col-lg-8">
                <h3>Checkout Details</h3>
                <form class="row contact_form" action="/order/{{$order->id}}" method="post" novalidate="novalidate">
                @csrf
                @method('PUT')
                  <div class="col-md-12 form-group p_star">
                    <textarea class="form-control" name="order_address" id="message" rows="1"
                      placeholder="Order Address"></textarea>
                    @error('order_address')
                      <div class="alert alert-danger" role="alert">{{ $message }}</div>
                    @enderror
                  </div>
                  <div class="col-md-12 form-group p_star">
                    <textarea class="form-control" name="shipping_address" id="message" rows="1"
                      placeholder="Shipping Address"></textarea>
                    @error('shipping_address')
                      <div class="alert alert-danger" role="alert">{{ $message }}</div>
                    @enderror
                  </div>
                  <button type="submit" class="btn btn-primary btn-block">Order Now</button>
                </form>
              </div>
              <div class="col-lg-4">
                <div class="order_box">
                  <h2>Your Order</h2>
                  <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">Product</th>
                        <th scope="col"></th>
                        <th scope="col">Price</th>
                      </tr>
                    </thead>
                    <tbody>
                        @foreach ($details as $detail)
                        <tr>
                            <td>{{$detail->product->name}}</td>
                            <td>x{{$detail->quantity}}</td>
                            <td>Rp{{$detail->price}}</td>
                        </tr>
                    @endforeach
                      <tr>
                        <td>TOTAL</td>
                        <td></td>
                        <td>Rp{{$total}}</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
@endsection