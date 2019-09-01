<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Chat extends Model
{
     protected $fillable = [
        'request_id',
        'provider_id',
        'user_id',
        'message',
        'type'
    ];
}
