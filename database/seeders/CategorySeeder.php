<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Category;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $category = Category::create([
            'id' => 1,
            'name' => "Breakfast"
        ]);

        $category->save();

        $category = Category::create([
            'id' => 2,
            'name' => "Lunch"
        ]);

        $category->save();

        $category = Category::create([
            'id' => 3,
            'name' => "Dinner"
        ]);

        $category->save();
    }
}
