<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ScrapingController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


/**
 * Route Class Login
 */
Route::get('/', [LoginController::class, 'showLoginForm']) -> name('showLoginForm');
Route::post('login', [LoginController::class, 'login']) -> name('login');
Route::post('logout', [LoginController::class, 'logout']) -> name('logout');

/**
 * Route Class Dashboard
 */
Route::get('dashboard', [DashboardController::class, 'index']) -> name('dashboard');

/**
 * Route Class Scraping
 */
Route::get('scraping', [ScrapingController::class, 'scrape']) -> name('scrape');


