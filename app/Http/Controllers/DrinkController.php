<?php

namespace App\Http\Controllers;

use App\Models\Drink;
use App\Models\Type_drink;
use App\Models\Brand;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;
use Validator;

class DrinkController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $drink = Drink::join('type_drinks', 'type_drinks.id', '=', 'drinks.type_id')->join('brands', 'brands.id', '=', 'drinks.brand_id')
        ->get(['drinks.id', 'drinks.name', 'drinks.description', 'drinks.image', 'drinks.quantity', 'drinks.size', 'drinks.flavor', 'type_drinks.name as typeDrink', 'brands.name as brand', ]);
        /*$drink = Drink::all();
        return response()->json([
            'drinks' => $drink
        ],200);*/

        return $drink;
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
            'price' => 'required',
            'description' => 'required',
            'image' => 'required|image',
            'quantity' => 'required',
            'size' => 'required',
            'flavor' => 'required',
            'type_id' => 'required',
            'brand_id' => 'required'
        ]);
        try{
            $imageName = Str::random() . '.' . $request->image->getClientOriginalExtension();
            Storage::disk('public')->putFileAs('drink/image', $request->image, $imageName);
            Drink::create($request->post()+['image'=>$imageName]);
            return response()->json([
                'message' => 'Drink created successfully'
            ]);
        }catch(\Exception $e){
            \Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while creating a drink!'
            ], 500);
        }
        /*$drink = new Drink;
        $drink->name = $request->name;
        $drink->price = $request->price;
        $drink->description = $request->description;
        $drink->image = $request->image;
        $drink->quantity = $request->quantity;
        $drink->size = $request->size;
        $drink->flavor = $request->flavor;
        $drink->type_id = $request->type_id;
        $drink->brand_id = $request->brand_id;
        $drink->save();*/
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Drink  $drink
     * @return \Illuminate\Http\Response
     */
    public function show(Drink $drink)
    {
        return response()->json([
            'drink' => $drink
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Drink  $drink
     * @return \Illuminate\Http\Response
     */
    public function edit(Drink $drink)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Drink  $drink
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $drink = Drink::find($id);
        $request->validate([
            'name' => 'required',
            'price' => 'required',
            'description' => 'required',
            'image' => 'required|image',
            'quantity' => 'required',
            'size' => 'required',
            'flavor' => 'required',
            'type_id' => 'required',
            'brand_id' => 'required'
        ]);
        try{
            $drink->fill($request->post())->update();

            if($request->hasFile('image')){
                if($drink->image){
                    $exists = Storage::disk('public')->exists("public/image/{$drink->image}");

                    if($exists){
                        Storage::disk('public')->delete("public/image/{$drink->image}");
                    }
                }
                $imageName = Str::random() . '.' . $request->image->getClientOriginalExtension();
                Storage::disk('public')->putFileAs('drink/image', $request->image, $imageName);
                $drink->image = $imageName;
                $drink->update();

                return response()->json([
                    'message' => 'Drink updated successfully'
                ]);
            } else{
                return response()->json([
                    'message' => 'Drink updated successfully'
                ]);
            }
        }catch(\Exception $e){
            \Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while updating a drink!'
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Drink  $drink
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $drink = Drink::destroy($id);
        return response()->json([
            'message' => 'Drink deleted successfully'
        ]);
    }

    public function getDrink($id){
        $drink = Drink::findOrFail($id);
        return response()->json([
            'drink' => $drink
        ],200);
    }
}
