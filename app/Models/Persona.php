<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
    use HasFactory;
    protected $fillable = ['nombre','tipo_documento','num_documento','direccion','telefono','email'];

    public function provedor()
    {
        return $this->hasOne('App\Models\Proveedor');
    }

    public function user()
    {
        return $this->hasOne('App\Models\User');
    }

}
