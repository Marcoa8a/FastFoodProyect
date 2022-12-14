<?php

namespace App\Http\Controllers;

use App\Models\Type_drink;
use Illuminate\Http\Request;

class TypeDrinkController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $type_drink = Type_drink::all();
        return response()->json([
            'type_drinks' => $type_drink
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
            $type_drink = new Type_drink;
            $type_drink->name = $request->name;
            $type_drink->save();        
            return response()->json([
                'message' => 'Type drink created successfully'
            ]);
        }catch(Exception $e){
            Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while creating a type drink!'
            ], 500);
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Type_drink  $type_drink
     * @return \Illuminate\Http\Response
     */
    public function show(Type_drink $type_drink)
    {
        return response()->json([
            'type_drink' => $type_drink
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Type_drink  $type_drink
     * @return \Illuminate\Http\Response
     */
    public function edit(Type_drink $type_drink)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Type_drink  $type_drink
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $type_drink = Type_drink::find($id);
        $request->validate([
            'name' => 'required',
        ]);
        try{
            $type_drink->fill($request->post())->update();
            $type_drink->update();

            return response()->json([
                'message' => 'Type drink updated successfully'
            ]);
        }catch(Exception $e){
            Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while updating a type drink!'
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Type_drink  $type_drink
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $type_drink = Type_drink::destroy($id);
        return response()->json([
            'message' => 'Type drink deleted successfully'
        ]);
    }

    public function getTypeDrink($id){
        $type_drink = Type_drink::findOrFail($id);
        return response()->json([
            'type_drink' => $type_drink
        ],200);
    }
}
