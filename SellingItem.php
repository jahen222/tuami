<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SellingItem extends Model
{
     protected $fillable = [
        'item_name',
        'item_price',
        'item_image',
        'description',
        'quantity',
        'unit',
        'service_provider_id'
    ];
    
    
    protected $hidden = [
         'created_at', 'updated_at'
    ];
}
