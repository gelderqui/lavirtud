<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id', 'usuario', 'password','condicion','idrol'
    ];
    

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];



    //use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    public $timestamps = false;

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */


    public function rol(){
        return $this->belongsTo('App\Models\Rol');
    }

    public function persona(){
        return $this->belongsTo('App\Models\Persona');
    }

}
