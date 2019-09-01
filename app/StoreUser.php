<?php

namespace App;

use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class StoreUser extends Authenticatable
{
    use HasApiTokens,Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'store_name','store_type','image', 'banner_image', 'device_type','device_token','password', 'min_amount','offer_in_percentage','device_id','max_delivery_time','description','address','latitude','longitude','landmark','open_time','close_time'
        ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password','created_at', 'updated_at',
    ];
    
    
//      public function findForPassport($identifier) {
//         return $this->Where('mobile', $identifier)->first();
// }
}
