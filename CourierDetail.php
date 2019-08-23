<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CourierDetail extends Model
{
     protected $fillable = [
        'user_id',
        'service_type_id',
        'item_height','item_width','item_weight','item_quantity','s_location','s_latitude','s_longitude','status','d_location','d_latitude','d_longitude','pickup_info','distance'
        
       
    ];
    
    
    protected $hidden = [
         'created_at', 'updated_at'
    ];
}
