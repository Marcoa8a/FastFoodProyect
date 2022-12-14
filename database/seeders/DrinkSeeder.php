<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Drink;

class DrinkSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $drink = Drink::create([
            'id' => 1,
            'name' => "Coca Cola",
            'price' => 20,
            'description' => "The original coca cola",
            'image' => "https://ibb.co/ypyy1qM",
            'quantity' => 30,
            'size' => "500ml",
            'flavor' => "Original",
            'type_id' => 1,
            'brand_id' => 1
        ]);

        $drink = Drink::create([
            'id' => 2,
            'name' => "Manzanita sol",
            'price' => 18,
            'description' => "Produced by pepsi with better apple",
            'image' => "https://ibb.co/x6Jty6X",
            'quantity' => 40,
            'size' => "355ml",
            'flavor' => "Apple",
            'type_id' => 1,
            'brand_id' => 4
        ]);

        $drink = Drink::create([
            'id' => 3,
            'name' => "Pepsi",
            'price' => 20,
            'description' => "The original pepsi flavor",
            'image' => "https://ibb.co/MGnnbwL",
            'quantity' => 35,
            'size' => "355ml",
            'flavor' => "Original",
            'type_id' => 1,
            'brand_id' => 1
        ]);

        $drink = Drink::create([
            'id' => 4,
            'name' => "Boing fresa",
            'price' => 18,
            'description' => "The rich boing juice now in strawberry flavor",
            'image' => "https://ibb.co/d49jbwD",
            'quantity' => 40,
            'size' => "354ml",
            'flavor' => "Strawberry",
            'type_id' => 2,
            'brand_id' => 3
        ]);

        $drink = Drink::create([
            'id' => 5,
            'name' => "Boing Guayaba",
            'price' => 18,
            'description' => "The rich boing juice now with guava flavor",
            'image' => "https://ibb.co/k3pXKXQ",
            'quantity' => 20,
            'size' => "354ml",
            'flavor' => "Guava",
            'type_id' => 2,
            'brand_id' => 3
        ]);

        $drink = Drink::create([
            'id' => 6,
            'name' => "Ciel natural",
            'price' => 15,
            'description' => "Natural ciel water",
            'image' => "https://ibb.co/zhk7ksj",
            'quantity' => 50,
            'size' => "355ml",
            'flavor' => "Natural",
            'type_id' => 3,
            'brand_id' => 5
        ]);

        $drink = Drink::create([
            'id' => 7,
            'name' => "Ciel coco frambuesa",
            'price' => 17,
            'description' => "Coconut and raspberry flavored agua ciel, unique in the country for its special flavor.",
            'image' => "https://ibb.co/wpXz4Z5",
            'quantity' => 42,
            'size' => "1L",
            'flavor' => "Coconut raspberry",
            'type_id' => 3,
            'brand_id' => 5
        ]);

        $drink = Drink::create([
            'id' => 8,
            'name' => "Jumex guayaba",
            'price' => 15,
            'description' => "Delicious guava flavored jumex for any meal",
            'image' => "https://ibb.co/hMk4zkR",
            'quantity' => 28,
            'size' => "355ml",
            'flavor' => "Guava",
            'type_id' => 2,
            'brand_id' => 2
        ]);

        $drink = Drink::create([
            'id' => 9,
            'name' => "Jumex mango",
            'price' => 16,
            'description' => "Rich mango flavored jumex for any meal",
            'image' => "https://ibb.co/RYck6T5",
            'quantity' => 12,
            'size' => "355ml",
            'flavor' => "Mango",
            'type_id' => 2,
            'brand_id' => 2
        ]);

        $drink = Drink::create([
            'id' => 10,
            'name' => "Fanta",
            'price' => 22,
            'description' => "Fanta orange flavor rich for any meal",
            'image' => "https://ibb.co/pv2tx98",
            'quantity' => 20,
            'size' => "400ml",
            'flavor' => "Orange",
            'type_id' => 1,
            'brand_id' => 1
        ]);

        $drink = Drink::create([
            'id' => 11,
            'name' => "Boing mango",
            'price' => 18,
            'description' => "Boing juice with fich mango flavor",
            'image' => "4PyIcbR8773KOgJ2.png",
            'quantity' => 33,
            'size' => "354ml",
            'flavor' => "Mango",
            'type_id' => 2,
            'brand_id' => 3
        ]);
    }
}
