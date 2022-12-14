<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Type_food;
use Illuminate\Http\Request;

class TypeFoodController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $typefood = Type_food::all();
        return response()->json([
            'type_foods' => $typefood
        ],200);
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
            'name' => 'required',
        ]);
        try{    
            $type_food = new Type_food;
            $type_food->name = $request->name;
            $type_food->save();        
            return response()->json([
                'message' => 'Type food created successfully'
            ]);
        }catch(Exception $e){
            Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while creating a type food!'
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Type_food  $type_food
     * @return \Illuminate\Http\Response
     */
    public function show(Type_food $type_food)
    {
        return response()->json([
            'type_food' => $type_food
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Type_food  $type_food
     * @return \Illuminate\Http\Response
     */
    public function edit(Type_food $type_food)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Type_food  $type_food
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $type_food = Type_food::find($id);
        $request->validate([
            'name' => 'required',
        ]);
        try{
            $type_food->fill($request->post())->update();
            $type_food->update();

            return response()->json([
                'message' => 'Type food updated successfully'
            ]);
        }catch(Exception $e){
            Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while updating a type food!'
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Type_food  $type_food
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $type_food = Type_food::destroy($id);
        return response()->json([
            'message' => 'Type food deleted successfully'
        ]);
    }

    public function getTypeFood($id){
        $type_food = Type_food::findOrFail($id);
        return response()->json([
            'type_food' => $type_food
        ],200);
    }
}
