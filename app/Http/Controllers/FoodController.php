<?php

namespace App\Http\Controllers;

use App\Models\Food;
use App\Models\Category;
use App\Models\Type_food;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;
use Validator;

class FoodController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $food = Food::join('categories', 'categories.id', '=', 'foods.category_id')->join( 'type_foods', 'type_foods.id', '=', 'foods.type_id')
        ->get(['foods.id', 'foods.name', 'foods.price', 'foods.calories', 'foods.description', 'foods.image', 'type_foods.name as typeFood',
        'categories.name as category', ]);
        
        /*$food = Food::all();
        return response()->json([
            'foods' => $food
        ],200);*/

        return $food;
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
            'calories' => 'required',
            'description' => 'required',
            'image' => 'required|image',
            'category_id' => 'required',
            'type_id' => 'required'
        ]);
        try{
            $imageName = Str::random() . '.' . $request->image->getClientOriginalExtension();
            Storage::disk('public')->putFileAs('food/image', $request->image, $imageName);
            $category = Category::pluck('id','name');
            Food::create($request->post()+['image'=>$imageName]);
            return response()->json([
                'message' => 'Food created successfully'
            ]);
        }catch(Exception $e){
            Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while creating a food!'
            ], 500);
        }
        /*$food = new Food;
        $food->name = $request->name;
        $food->price = $request->price;
        $food->calories = $request->calories;
        $food->description = $request->description;
        
        if($request->image!=""){
            $strpos = strpos($request->image,';');
            $sub = substr($request->image,0,$strpos);

            $img = Image::make($request->image)->resize(117,100);
            $upload_path = public_path()."/upload/";
            $img->save($upload_path.$name);
            $food->image = $name;
        }else{
            $food->image = "image.png";
        }
        $food->image = $name;
        $food->category_id = $request->category_id;
        $food->type_id = $request->type_id;
        $food->save();*/
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Food  $food
     * @return \Illuminate\Http\Response
     */
    public function show(Food $food)
    {
        return response()->json([
            'food' => $food
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Food  $food
     * @return \Illuminate\Http\Response
     */
    public function edit($foodId)
    {
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Food  $food
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $food = Food::find($id);
        $request->validate([
            'name' => 'required',
            'price' => 'required',
            'calories' => 'required',
            'description' => 'required',
            'image' => 'nullable',
            'category_id' => 'required',
            'type_id' => 'required'
        ]);

        try{
            $food->fill($request->post())->update();

            if($request->hasFile('image')){
                if($food->image){
                    $exists = Storage::disk('public')->exists("public/image/{$food->image}");

                    if($exists){
                        Storage::disk('public')->delete("public/image/{$food->image}");
                    }
                }
                $imageName = Str::random() . '.' . $request->image->getClientOriginalExtension();
                Storage::disk('public')->putFileAs('food/image', $request->image, $imageName);
                $food->image = $imageName;
                $food->update();

                return response()->json([
                    'message' => 'Food updated successfully'
                ]);
            } else{
                return response()->json([
                    'message' => 'Food updated successfully'
                ]);
            }
        }catch(Exception $e){
            Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while updating a food!'
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Food  $food
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $food = Food::destroy($id);
        return response()->json([
            'message' => 'Food deleted successfully'
        ]);
        /*try {
            if($food->image){
                $exists = Storage::disk('public')->exists("public/image/{$food->image}");

                if($exists){
                    Storage::disk('public')->delete("public/image/{$food->image}");
                }
            }

            $food->delete();

            return response()->json([
                'message' => 'Food deleted successfully'
            ]);
        }catch(\Exception $e){
            \Log::error($e.getMessage());
            return response()->json([
                'message' => 'Something goes wrong while deleting a food!'
            ], 500);
        }*/
    }

    public function getFood($id){
        $food = Food::findOrFail($id);
        return response()->json([
            'food' => $food
        ],200);
    }
}
