<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

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

Route::get('/', function () {
    return view('welcome');
});

Route::post('/register_brand', [BrandController::class, 'store']);

Route::post('/register_category', [CategoryController::class, 'store']);

Route::post('/register_drink', [DrinkController::class, 'store']);

Route::post('/register_drink_order', [DrinkOrderController::class, 'store']);

Route::post('/register_employee', [EmployeeController::class, 'store']);

Route::post('/register_food', [FoodController::class, 'store']);

Route::post('/register_food_order', [FoodOrderController::class, 'store']);

Route::post('/register_job', [JobController::class, 'store']);

Route::post('/register_order', [OrderController::class, 'store']);

Route::post('/register_type_drink', [TypeDrinkController::class, 'store']);

Route::post('/register_type_food', [TypeFoodController::class, 'store']);

Route::post('/register_user', [UserController::class, 'store']);
