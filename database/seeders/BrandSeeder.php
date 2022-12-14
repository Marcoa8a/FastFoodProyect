<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Brand;

class BrandSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $brand = Brand::create([
            'id' => 1,
            'name' => "CocaCola"
        ]);
        $brand->save();

        $brand = Brand::create([
            'id' => 2,
            'name' => "Jumex"
        ]);
        $brand->save();

        $brand = Brand::create([
            'id' => 3,
            'name' => "Boing"
        ]);
        $brand->save();

        $brand = Brand::create([
            'id' => 4,
            'name' => "Pepsi"
        ]);
        $brand->save();

        $brand = Brand::create([
            'id' => 5,
            'name' => "Ciel"
        ]);
        $brand->save();
    }
}