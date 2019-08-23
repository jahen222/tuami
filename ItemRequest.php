<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ItemRequest extends Model
{
     protected $fillable = [
        'selling_item_id',
        'item_price',
        'quantity',
        'user_id','status'
       
    ];
    
    
    protected $hidden = [
         'created_at', 'updated_at'
    ];
}
