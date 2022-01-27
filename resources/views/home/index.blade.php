@extends('layouts.master')

@section('content')
    <!-- banner part start-->
    @include('home.partials.banner')
    <!-- banner part start-->

    <!-- feature_part start-->
    @include('home.partials.featureproducts')
    <!-- upcoming_event part start-->

    <!-- product_list start-->
    @include('home.partials.awesomeproducts')
    <!-- product_list part start-->

    <!-- awesome_shop start-->
    @include('home.partials.bigsale')
    <!-- awesome_shop part start-->

    <!-- product_list part start-->
    @include('home.partials.bestsellers')
    <!-- product_list part end-->

    <!-- subscribe_area part start-->
    @include('home.partials.subscribe')
    <!--::subscribe_area part end::-->
@endsection

