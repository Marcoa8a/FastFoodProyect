<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Employee;

class EmployeeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $employee = Employee::create([
            'id' => 1,
            'name' => "Andres",
            'last_name' => "Cardenas",
            'phone' => "4486587432",
            'email' => "andres12e@gmail.com",
            'password' => "andres13vo2vm",
            'job_id' => 3
        ]);

        $employee = Employee::create([
            'id' => 2,
            'name' => "Valeria",
            'last_name' => "Zuñiga",
            'phone' => "4496873210",
            'email' => "valezu763ga@gmail.com",
            'password' => "valerianiv39852",
            'job_id' => 3
        ]);

        $employee = Employee::create([
            'id' => 3,
            'name' => "Adrian",
            'last_name' => "Jimenez",
            'phone' => "4497459130",
            'email' => "andresJ12@gmail.com",
            'password' => "anM23i4vyb",
            'job_id' => 3
        ]);

        $employee = Employee::create([
            'id' => 4,
            'name' => "David",
            'last_name' => "Rocha",
            'phone' => "4497612094",
            'email' => "darocha981@outlook.com",
            'password' => "andres13vo",
            'job_id' => 3
        ]);

        $employee = Employee::create([
            'id' => 5,
            'name' => "Andres",
            'last_name' => "Cardenas",
            'phone' => "4486587432",
            'email' => "andres12e@gmail.com",
            'password' => "andres13vo2vm",
            'job_id' => 3
        ]);
    }
}
