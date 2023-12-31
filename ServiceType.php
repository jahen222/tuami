<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ServiceType extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'provider_name',
         'provider_image',
        'image',
        'price',
        'fixed',
        'description',
        'status',
        'minute',
        'distance',
        'calculator',
        'capacity',
         'emergency_price','location','latitude','longitude'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
         'created_at', 'updated_at'
    ];
}
