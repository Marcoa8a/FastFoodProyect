<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;
use Validator;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $brand = Brand::all();
        return response()->json([
            'brands' => $brand
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
            $brand = new Brand;
            $brand->name = $request->name;
            $brand->save();        
            return response()->json([
                'message' => 'Brand created successfully'
            ]);
        }catch(Exception $e){
            Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while creating a brand!'
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function show(Brand $brand)
    {
        return response()->json([
            'brand' => $brand
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function edit(Brand $brand)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $brand = Brand::find($id);
        $request->validate([
            'name' => 'required',
        ]);
        try{
            $brand->fill($request->post())->update();
            $brand->update();

            return response()->json([
                'message' => 'Brand updated successfully'
            ]);
        }catch(\Exception $e){
            \Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while updating a brand!'
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $brand= Brand::destroy($id);
        return response()->json([
            'message' => 'Brand deleted successfully'
        ]);
    }

    public function getBrand($id){
        $brand = Brand::findOrFail($id);
        return response()->json([
            'brand' => $brand
        ],200);
    }
}
