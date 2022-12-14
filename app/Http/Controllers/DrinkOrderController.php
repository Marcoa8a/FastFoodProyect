<?php

namespace App\Http\Controllers;

use App\Models\Drink_order;
use App\Models\Order;
use App\Models\Drink;
use Illuminate\Http\Request;

class DrinkOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $drink_order = Drink_order::join('drinks', 'drinks.id', '=', 'drink_orders.drink_id')->join('orders', 'orders.id', '=', 'drink_orders.order_id')
        ->get(['drink_orders.id', 'drinks.name as drink', 'orders.name as order',]);
        /*$drink_order = Drink_order::all();
        return response()->json([
            'drink_orders' => $drink_order
        ],200);*/
        return $drink_order;
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
            'drink_id' => 'required',
            'order_id' => 'required'
        ]);
        try{    
            $drink_order = new Drink_order;
            $drink_order->drink_id = $request->drink_id;
            $drink_order->order_id = $request->order_id;
            $drink_order->save();        
            return response()->json([
                'message' => 'Drink order created successfully'
            ]);
        }catch(Exception $e){
            Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while creating a drink order!'
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Drink_order  $drink_order
     * @return \Illuminate\Http\Response
     */
    public function show(Drink_order $drink_order)
    {
        return response()->json([
            'drink_order' => $drink_order
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Drink_order  $drink_order
     * @return \Illuminate\Http\Response
     */
    public function edit(Drink_order $drink_order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Drink_order  $drink_order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $drink_order = Drink_order::find($id);
        $request->validate([
            'drink_id' => 'required',
            'order_id' => 'required'
        ]);
        try{
            $drink_order->fill($request->post())->update();
            $drink_order->update();

            return response()->json([
                'message' => 'Drink order updated successfully'
            ]);
        }catch(Exception $e){
            Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while updating a drink order!'
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Drink_order  $drink_order
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $drink_order = Drink_order::destroy($id);
        return response()->json([
            'message' => 'Drink order deleted successfully'
        ]);
    }

    public function getDrinkOrder($id){
        $drink_order = Drink_order::findOrFail($id);
        return response()->json([
            'drink_order' => $drink_order
        ],200);
    }
}
