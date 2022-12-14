<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\JobController;
use App\Http\Controllers\BrandController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\DrinkController;
use App\Http\Controllers\DrinkOrderController;
use App\Http\Controllers\FoodController;
use App\Http\Controllers\FoodOrderController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\TypeDrinkController;
use App\Http\Controllers\TypeFoodController;
use App\Http\Controllers\PassportAuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



Route::post('/register_employee', [EmployeeController::class, 'store']);

Route::post('/register_user', [UserController::class, 'store']);


Route::get('/show_employees', [EmployeeController::class, 'index']);


//Rutas Food--------------------
Route::post('/register_food', [FoodController::class, 'store']);

Route::get('/show_foods', [FoodController::class, 'index']);

Route::get('/edit_foods/{id}', [FoodController::class, 'getFood']);

Route::put('/update_foods/{id}', [FoodController::class, 'update']);

Route::delete('/delete_foods/{id}', [FoodController::class, 'destroy']);

//Rutas Drink----------------------
Route::post('/register_drink', [DrinkController::class, 'store']);

Route::get('/show_drinks', [DrinkController::class, 'index']);

Route::get('/edit_drinks/{id}', [DrinkController::class, 'getDrink']);

Route::put('/update_drinks/{id}', [DrinkController::class, 'update']);

Route::delete('/delete_drinks/{id}', [DrinkController::class, 'destroy']);

//Rutas Brand------------------------
Route::post('/register_brand', [BrandController::class, 'store']);

Route::get('/show_brands', [BrandController::class, 'index']);

Route::get('/edit_brands/{id}', [BrandController::class, 'getBrand']);

Route::put('/update_brands/{id}', [BrandController::class, 'update']);

Route::delete('/delete_brands/{id}', [BrandController::class, 'destroy']);

//Rutas Category---------------------------
Route::post('/register_category', [CategoryController::class, 'store']);

Route::get('/show_categories', [CategoryController::class, 'index']);

Route::get('/edit_categories/{id}', [CategoryController::class, 'getCategory']);

Route::put('/update_categories/{id}', [CategoryController::class, 'update']);

Route::delete('/delete_categories/{id}', [CategoryController::class, 'destroy']);

//Rutas Job----------------------------
Route::post('/register_job', [JobController::class, 'store']);

Route::get('/show_jobs', [JobController::class, 'index']);

Route::get('/edit_jobs/{id}', [JobController::class, 'getJob']);

Route::put('/update_jobs/{id}', [JobController::class, 'update']);

Route::delete('/delete_jobs/{id}', [JobController::class, 'destroy']);

//Rutas Order------------------------------
Route::post('/register_order', [OrderController::class, 'store']);

Route::get('/show_orders', [OrderController::class, 'index']);

Route::get('/edit_orders/{id}', [OrderController::class, 'getOrder']);

Route::put('/update_orders/{id}', [OrderController::class, 'update']);

Route::delete('/delete_orders/{id}', [OrderController::class, 'destroy']);

//Rutas Type food-------------------------------------------------
Route::post('/register_type_food', [TypeFoodController::class, 'store']);

Route::get('/show_type_foods', [TypeFoodController::class, 'index']);

Route::get('/edit_type_foods/{id}', [TypeFoodController::class, 'getTypeFood']);

Route::put('/update_type_foods/{id}', [TypeFoodController::class, 'update']);

Route::delete('/delete_type_foods/{id}', [TypeFoodController::class, 'destroy']);

//Rutas Type drink------------------------------------------------
Route::post('/register_type_drink', [TypeDrinkController::class, 'store']);

Route::get('/show_type_drinks', [TypeDrinkController::class, 'index']);

Route::get('/edit_type_drinks/{id}', [TypeDrinkController::class, 'getTypeDrink']);

Route::put('/update_type_drinks/{id}', [TypeDrinkController::class, 'update']);

Route::delete('/delete_type_drinks/{id}', [TypeDrinkController::class, 'destroy']);

//Rutas Food Order------------------------------------------------------
Route::post('/register_food_order', [FoodOrderController::class, 'store']);

Route::get('/show_food_orders', [FoodOrderController::class, 'index']);

Route::get('/edit_food_orders/{id}', [FoodOrderController::class, 'getFoodOrder']);

Route::put('/update_food_orders/{id}', [FoodOrderController::class, 'update']);

Route::delete('/delete_food_orders/{id}', [FoodOrderController::class, 'destroy']);

//Rutas Drink order---------------------------------------------------
Route::post('/register_drink_order', [DrinkOrderController::class, 'store']);

Route::get('/show_drink_orders', [DrinkOrderController::class, 'index']);

Route::get('/edit_drink_orders/{id}', [DrinkOrderController::class, 'getDrinkOrder']);

Route::put('/update_drink_orders/{id}', [DrinkOrderController::class, 'update']);

Route::delete('/delete_drink_orders/{id}', [DrinkOrderController::class, 'destroy']);


//Rutas Token--------------------------------------------------------
Route::post('register', [PassportAuthController::class, 'register']);

Route::post('login', [PassportAuthController::class, 'login']);

Route::middleware('auth:api')->group(
    function(){
        Route::get('/show_job', [JobController::class, 'index']);
    }
);