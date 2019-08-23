<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ItemRequest extends Model
{
     protected $fillable = [
        'selling_item_id',
        'item_price',
        'quantity',
        'user_id','status','booking_id','request_status',
       
    ];
    
    
    protected $hidden = [
         'updated_at'
    ];

	public function item() {
		return $this->belongsTo('App\SellingItem', 'user_id', 'user_id');
	} 

}
