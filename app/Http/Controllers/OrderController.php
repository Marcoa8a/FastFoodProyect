<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Employee;
use App\Models\User;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $order = Order::join('employees', 'employees.id', '=', 'orders.employee_id')->join('users', 'users.id', '=', 'orders.user_id')
        ->get(['orders.id', 'orders.price', 'orders.date', 'employees.name as employee', 'users.name as user']);
        /*$order = Order::all();
        return response()->json([
            'orders' => $order
        ],200);*/
        return $order;
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
            'price' => 'required',
            'date' => 'required',
            'employee_id' => 'required',
            'user_id' => 'required'
        ]);
        try{    
            $order = new Order;
            $order->price = $request->price;
            $order->date = $request->date;
            $order->employee_id = $request->employee_id;
            $order->user_id = $request->user_id;
            $order->save();        
            return response()->json([
                'message' => 'Order created successfully'
            ]);
        }catch(Exception $e){
            Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while creating a orcer!'
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        return response()->json([
            'order' => $order
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function edit(Order $order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $order = Order::find($id);
        $request->validate([
            'price' => 'required',
            'date' => 'required',
            'employee_id' => 'required',
            'user_id' => 'required'
        ]);
        try{
            $order->fill($request->post())->update();
            $order->update();

            return response()->json([
                'message' => 'Order updated successfully'
            ]);
        }catch(Exception $e){
            Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while updating a order!'
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $order = Order::destroy($id);
        return response()->json([
            'message' => 'Order deleted successfully'
        ]);
    }

    public function getOrder($id){
        $order = Order::findOrFail($id);
        return response()->json([
            'order' => $order
        ],200);
    }
}
