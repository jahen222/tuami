<?php

namespace App;

use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens,Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'first_name', 'email', 'mobile', 'picture', 'password', 'device_type','device_token','login_by', 'payment_mode','social_unique_id','device_id','wallet_balance','family_name','relative_name','self_name','self_contact_number','family_address','self_address','relative_address','family_contact_number','relative_contact_number','earning_money','status','lang',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'created_at', 'updated_at','last_name',
    ];
    
    
     public function findForPassport($identifier) {
        return $this->Where('mobile', $identifier)->first();
}
}
