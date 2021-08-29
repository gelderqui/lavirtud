<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    //Con invoke no se necesita especificar la ruta porque se entiende que solo hay uno
    public function __invoke(Request $request)
    {
        $anio=date('Y');  //Esto es para mosotrar el año actual
        //$anio=2018;
        $ingresos=DB::table('ingresos as i')
        ->select(DB::raw('MONTH(i.fecha_hora) as mes'),
        DB::raw('YEAR(i.fecha_hora) as anio'),
        DB::raw('SUM(i.total) as total'))
        ->whereYear('i.fecha_hora',$anio)
        ->groupBy(DB::raw('MONTH(i.fecha_hora)'),DB::raw('YEAR(i.fecha_hora)'))
        ->get();

        $ventas=DB::table('ventas as v')
        ->select(DB::raw('MONTH(v.fecha_hora) as mes'),
        DB::raw('YEAR(v.fecha_hora) as anio'),
        DB::raw('SUM(v.total) as total'))
        ->whereYear('v.fecha_hora',$anio)
        ->groupBy(DB::raw('MONTH(v.fecha_hora)'),DB::raw('YEAR(v.fecha_hora)'))
        ->get();

        return ['ingresos'=>$ingresos,'ventas'=>$ventas,'anio'=>$anio];      

    }
}
