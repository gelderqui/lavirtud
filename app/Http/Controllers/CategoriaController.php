<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Categoria;
use Carbon\Carbon;

class CategoriaController extends Controller
{
    public function index(Request $request)
    {
        //if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;

        $mytime= Carbon::now('America/Guatemala');
        
        if ($buscar==''){
            $categorias = Categoria::orderBy('id', 'desc')
            ->where('condicion','=','1')
            ->paginate(10);
        }
        else{
            $categorias = Categoria::where($criterio, 'like', '%'. $buscar . '%')
            ->where('condicion','=','1')
            ->orderBy('id', 'asc')
            ->paginate(10);
        }
        
        return [
            'pagination' => [
                'total'        => $categorias->total(),
                'current_page' => $categorias->currentPage(),
                'per_page'     => $categorias->perPage(),
                'last_page'    => $categorias->lastPage(),
                'from'         => $categorias->firstItem(),
                'to'           => $categorias->lastItem(),
                'towe'           => $categorias->items(),
            ],
            'categorias' => $categorias,
            'fecha'=>$mytime
        ];
    }

    public function store(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $categoria = new Categoria();
        $categoria->nombre = $request->nombre;
        $categoria->descripcion = $request->descripcion;
        $categoria->condicion = '1';
        $categoria->save();
    }

    public function update(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $categoria = Categoria::findOrFail($request->id);
        $categoria->nombre = $request->nombre;
        $categoria->descripcion = $request->descripcion;
        $categoria->condicion = '1';
        $categoria->save();
    }

    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $categoria = Categoria::findOrFail($request->id);
        $categoria->condicion = '0';
        $categoria->save();
    }

    public function activar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $categoria = Categoria::findOrFail($request->id);
        $categoria->condicion = '1';
        $categoria->save();
    }

    public function listarPdf(){
        $categorias = Categoria::select('nombre','descripcion','condicion')->orderBy('nombre', 'asc')
        ->where('condicion','=','1')->get();
        //$cont=Categoria::count();
        $cont = Categoria::where('condicion','=',1)->count();
        

        $pdf = \PDF::loadView('pdf.categoriaspdf',['categorias'=>$categorias,'cont'=>$cont])->setPaper('a4', 'portrait');
        return $pdf->download('categorias.pdf');
    }

    public function selectCategoria(Request $request){
        if (!$request->ajax()) return redirect('/');
        $categorias = Categoria::where('condicion','=','1')
        ->select('id','nombre')->orderBy('nombre', 'asc')->get();
        return ['categorias' => $categorias];
    }

}
