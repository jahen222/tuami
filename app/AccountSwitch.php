<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AccountSwitch extends Model
{
     protected $fillable = [
        'provider_id',
        'service_type_id',
         'available_for_emergency',
 'available_to','base_amount','provider_service_type','status','major_service_type_id','currency_id'
        
    ];
}
