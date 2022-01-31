@extends('layouts.master');

@section('content')
    <section class="product_list section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="section_tittle text-center">
                        <h2>Items</h2>
                    </div>
                </div>
                    <div class="col text-right">
                        <<a class="btn_2 btn-outline-info btn-block" href="/cart">Go to cart</a>
                    </div>
            </div>
            <div class="row">
                <div class="col-2">
                    <h4 class="mb-4">Categories</h4>
                    @foreach ($categories as $item)
                    <a href="/category/{{$item->id}}" style="color:black;">{{$item->name}}</a><br><hr>
                    @endforeach
                </div>
                <div class="col-lg-10">
                    <div class="row align-items-center justify-content-start">
                        @forelse ($products as $key => $product)
                            <div class="col-lg-3 col-sm-6">
                                <div class="single_product_item" style="border: 2px solid #E7E9ED">
                                    @if (Str::contains($product->image, 'https:/'))
                                        <img src="{{$product->image}}" alt="image" style="width: 300px; height: 340px; object-fit: cover;">
                                    @else
                                        <img src="{{ asset('images/product/'.$product->image)}}" alt="image" style="width: 300px; height: 340px; object-fit: cover;">
                                    @endif
                                    <div class="single_product_text">
                                        <h4>{{ $product->name }}</h4>
                                        <h3>Rp {{ $product->price }}</h3>
                                        {{-- <p>{{ Auth::user()->fullname }}</p> --}}
                                        <form action="shop" method="POST" enctype="multipart/form-data">
                                            @csrf
                                            <input type="hidden" value="{{ Auth::user()->id }}" name="users_id">
                                            <input type="hidden" value="{{ $product->id }}" name="id">
                                            <input type="hidden" value="{{ $product->name }}" name="name">
                                            <input type="hidden" value="{{ $product->price }}" name="price">
                                            <input type="hidden" value="{{ $product->image }}"  name="image">
                                            <input type="hidden" value="1" name="quantity">
                                            <button class="px-4 py-2 text-black bg-blue-800 rounded">Add To Cart</button>
                                        </form>
                                        {{-- <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a> --}}
                                    </div>
                                </div>
                            </div>
                        @empty
                             <h4>No item</h4>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

{{-- @push('styles')
	<style>
		.bg-cover {
            width: 100%;
            height: 180px;
            background: url($product->image) no-repeat center;
            background-size: cover;
        }
	</style>
@endpush --}}