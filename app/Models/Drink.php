<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Drink extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'price',
        'description',
        'image',
        'quantity',
        'size',
        'flavor',
        'type_id',
        'brand_id'
    ];    

    public function type(){
        return $this->belongsTo(type_drink::class);
    }

    public function brand(){
        return $this->belongsTo(brand_drink::class);
    }
}
