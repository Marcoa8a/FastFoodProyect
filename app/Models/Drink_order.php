<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Drink_order extends Model
{
    use HasFactory;

    protected $fillable = [
        'drink_id',
        'order_id'
    ];  

    public function drink(){
        return $this->belongsToMany(Drink::class);
    }

    public function order(){
        return $this->belongsToMany(Order::class);
    }
}
