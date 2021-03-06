<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller{
    
    /**
     * [__construct]
     */
    public function __construct(){
        $this -> middleware('auth');
    }

    /**
     * [index main]
     */
    public function index()
    {

        $categories = DB::table('categories')->get();
        $subCategories = DB::table('sub_categories')->get();

        return view('dashboard', ['categories' => $categories, 'subCategories' => $subCategories]);
    }
    //
}
