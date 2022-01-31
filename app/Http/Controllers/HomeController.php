<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Home;

class HomeController extends Controller
{
    public function index(){
        $products = Home::where('categories_id', 20)->get();
        // dd($products);
        return view('homes.index', compact('products'));
    }

    public function store(){
        return redirect('/shop');
    }
}
