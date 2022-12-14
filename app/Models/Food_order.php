<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Food_order extends Model
{
    use HasFactory;

    protected $fillable = [
        'food_id',
        'order_id'
    ];  

    public function foods(){
        return $this->belongsToMany(Food::class);
    }

    public function orders(){
        return $this->belongsToMany(Order::class);
    }
}
