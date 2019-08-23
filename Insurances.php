<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Insurances extends Model
{
    //
     // use SoftDeletes;
    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'insurance_id',
        'name',
        'price'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        // 'created_at', 'updated_at'
    ];
    
    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = [
        'created_at'
    ];
}
