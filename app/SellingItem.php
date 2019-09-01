<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SellingItem extends Model
{
     protected $fillable = [
        'item_name',
        'item_price','selling_item_price',
        'item_image',
        'description',
        'quantity',
        'unit',
        'service_provider_id','delivery_charge','item_type',
    ];
    
    
    protected $hidden = [
         'created_at', 'updated_at'
    ];
	
	public function relateStoreUser(){
		return $this->belongsTo('App\StoreUser');
	}
}
