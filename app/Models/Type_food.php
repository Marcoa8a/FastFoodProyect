<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Type_food extends Model
{
    use HasFactory;

    protected $fillable = [
        'name'
    ];  

    public function food(){
        return $this->belongsTo(Food::class);
    }
}
