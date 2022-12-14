<?php

namespace App\Http\Controllers;

use App\Models\Food_order;
use App\Models\Food;
use App\Models\Order;
use Illuminate\Http\Request;

class FoodOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $food_order = Food_order::join('foods', 'foods.id', '=', 'food_orders.food_id')->join('orders', 'orders.id', '=', 'food_orders.order_id')
        ->get(['food_orders.id', 'foods.name as food', 'orders.name as order',]);
        /*$food_order = Food_order::all();
        return response()->json([
            'food_orders' => $food_order
        ],200);*/
        return $food_order;
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
        $request->validate([
            'food_id' => 'required',
            'order_id' => 'required'
        ]);
        try{    
            $food_order = new Food_order;
            $food_order->food_id = $request->food_id;
            $food_order->order_id = $request->order_id;
            $food_order->save();        
            return response()->json([
                'message' => 'Food order created successfully'
            ]);
        }catch(Exception $e){
            Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while creating a food order!'
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Food_order  $food_order
     * @return \Illuminate\Http\Response
     */
    public function show(Food_order $food_order)
    {
        return response()->json([
            'food_order' => $food_order
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Food_order  $food_order
     * @return \Illuminate\Http\Response
     */
    public function edit(Food_order $food_order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Food_order  $food_order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $food_order = Food_order::find($id);
        $request->validate([
            'food_id' => 'required',
            'order_id' => 'required'
        ]);
        try{
            $food_order->fill($request->post())->update();
            $food_order->update();

            return response()->json([
                'message' => 'Food order updated successfully'
            ]);
        }catch(Exception $e){
            Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while updating a food order!'
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Food_order  $food_order
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $food_order = Food_order::destroy($id);
        return response()->json([
            'message' => 'Food order deleted successfully'
        ]);
    }

    public function getFoodOrder($id){
        $food_order = Food_order::findOrFail($id);
        return response()->json([
            'food_order' => $food_order
        ],200);
    }
}
