<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware'=>['guest']],function(){
    //Route::get('/', 'CategoriaController@index');
    Route::get('/','App\Http\Controllers\Auth\LoginController@showLoginForm');
    Route::post('/login', 'App\Http\Controllers\Auth\LoginController@login')->name('login');
    
});

Route::group(['middleware'=>['auth']],function(){
    
    Route::post('/logout', 'App\Http\Controllers\Auth\LoginController@logout')->name('logout');
    Route::get('/dashboard', 'App\Http\Controllers\DashboardController');
    //Notificaciones 
    //Route::post('/notification/get', 'App\Http\Controllers\NotificationController@get'); 
    
    Route::get('/main', function () {
        return view('contenido/contenido');
    })->name('main');

    Route::group(['middleware' => ['Almacenero']], function () {
        Route::get('/categoria', 'App\Http\Controllers\CategoriaController@index');
        Route::post('/categoria/registrar', 'App\Http\Controllers\CategoriaController@store');
        Route::put('/categoria/actualizar', 'App\Http\Controllers\CategoriaController@update');
        Route::put('/categoria/desactivar', 'App\Http\Controllers\CategoriaController@desactivar');
        Route::put('/categoria/activar', 'App\Http\Controllers\CategoriaController@activar');
        Route::get('/categoria/selectCategoria', 'App\Http\Controllers\CategoriaController@selectCategoria');
        Route::get('/categoria/listarPdf','App\Http\Controllers\CategoriaController@listarPdf')->name('categorias_pdf');

        Route::get('/articulo', 'App\Http\Controllers\ArticuloController@index');
        Route::post('/articulo/registrar', 'App\Http\Controllers\ArticuloController@store');
        Route::put('/articulo/actualizar', 'App\Http\Controllers\ArticuloController@update');
        Route::put('/articulo/desactivar', 'App\Http\Controllers\ArticuloController@desactivar');
        Route::put('/articulo/activar', 'App\Http\Controllers\ArticuloController@activar');
        Route::get('/articulo/buscarArticulo', 'App\Http\Controllers\ArticuloController@buscarArticulo');
        Route::get('/articulo/listarArticulo', 'App\Http\Controllers\ArticuloController@listarArticulo');
        Route::get('/articulo/listarPdf','App\Http\Controllers\ArticuloController@listarPdf')->name('articulos_pdf');

        Route::get('/proveedor', 'App\Http\Controllers\ProveedorController@index');
        Route::post('/proveedor/registrar', 'App\Http\Controllers\ProveedorController@store');
        Route::put('/proveedor/actualizar', 'App\Http\Controllers\ProveedorController@update');
        Route::get('/proveedor/selectProveedor', 'App\Http\Controllers\ProveedorController@selectProveedor');
        Route::get('/proveedor/listarPdf','App\Http\Controllers\ProveedorController@listarPdf')->name('proveedores_pdf');

        Route::get('/ingreso', 'App\Http\Controllers\IngresoController@index');
        Route::post('/ingreso/registrar', 'App\Http\Controllers\IngresoController@store');
        Route::put('/ingreso/desactivar', 'App\Http\Controllers\IngresoController@desactivar');
        Route::get('/ingreso/obtenerCabecera', 'App\Http\Controllers\IngresoController@obtenerCabecera');
        Route::get('/ingreso/obtenerDetalles', 'App\Http\Controllers\IngresoController@obtenerDetalles');
        Route::get('/ingreso/pdf/{id}','App\Http\Controllers\IngresoController@pdf')->name('ingreso_pdf');
        Route::get('/ingreso/listarPdf','App\Http\Controllers\IngresoController@listarPdf')->name('ingresos_pdf');
    });

    Route::group(['middleware' => ['Vendedor']], function () {
        Route::get('/cliente', 'App\Http\Controllers\ClienteController@index');
        Route::post('/cliente/registrar', 'App\Http\Controllers\ClienteController@store');
        Route::put('/cliente/actualizar', 'App\Http\Controllers\ClienteController@update');
        Route::get('/cliente/selectCliente', 'App\Http\Controllers\ClienteController@selectCliente');
        Route::get('/cliente/listarPdf','App\Http\Controllers\ClienteController@listarPdf')->name('clientes_pdf');
 
        Route::get('/articulo/buscarArticuloVenta', 'App\Http\Controllers\ArticuloController@buscarArticuloVenta');
        Route::get('/articulo/listarArticuloVenta', 'App\Http\Controllers\ArticuloController@listarArticuloVenta');

        Route::get('/venta', 'App\Http\Controllers\VentaController@index');
        Route::post('/venta/registrar', 'App\Http\Controllers\VentaController@store');
        Route::put('/venta/desactivar', 'App\Http\Controllers\VentaController@desactivar');
        Route::get('/venta/obtenerCabecera', 'App\Http\Controllers\VentaController@obtenerCabecera');
        Route::get('/venta/obtenerDetalles', 'App\Http\Controllers\VentaController@obtenerDetalles');
        Route::get('/venta/pdf/{id}','App\Http\Controllers\VentaController@pdf')->name('venta_pdf');
        Route::get('/venta/pdfTicket/{id}','App\Http\Controllers\VentaController@pdfTicket')->name('ventaticket_pdf');
        Route::get('/venta/listarPdf','App\Http\Controllers\VentaController@listarPdf')->name('ventas_pdf');
    });

    Route::group(['middleware' => ['Administrador']], function () {
        //Rutas para la vista categorias
        Route::get('/categoria', 'App\Http\Controllers\CategoriaController@index');
        Route::post('/categoria/registrar', 'App\Http\Controllers\CategoriaController@store');
        Route::put('/categoria/actualizar', 'App\Http\Controllers\CategoriaController@update');
        Route::put('/categoria/desactivar', 'App\Http\Controllers\CategoriaController@desactivar');
        Route::put('/categoria/activar', 'App\Http\Controllers\CategoriaController@activar');
        Route::get('/categoria/listarPdf','App\Http\Controllers\CategoriaController@listarPdf')->name('categorias_pdf');
        //Fin rutas para la vista categorias
        Route::get('/categoria/selectCategoria', 'App\Http\Controllers\CategoriaController@selectCategoria');


        Route::get('/articulo', 'App\Http\Controllers\ArticuloController@index');
        Route::post('/articulo/registrar', 'App\Http\Controllers\ArticuloController@store');
        Route::put('/articulo/actualizar', 'App\Http\Controllers\ArticuloController@update');
        Route::put('/articulo/desactivar', 'App\Http\Controllers\ArticuloController@desactivar');
        Route::put('/articulo/activar', 'App\Http\Controllers\ArticuloController@activar');
        Route::get('/articulo/buscarArticulo', 'App\Http\Controllers\ArticuloController@buscarArticulo');
        Route::get('/articulo/listarArticulo', 'App\Http\Controllers\ArticuloController@listarArticulo');
        Route::get('/articulo/buscarArticuloVenta', 'App\Http\Controllers\ArticuloController@buscarArticuloVenta');
        Route::get('/articulo/listarArticuloVenta', 'App\Http\Controllers\ArticuloController@listarArticuloVenta');
        Route::get('/articulo/listarPdf','App\Http\Controllers\ArticuloController@listarPdf')->name('articulos_pdf');

        Route::get('/proveedor', 'App\Http\Controllers\ProveedorController@index');
        Route::post('/proveedor/registrar', 'App\Http\Controllers\ProveedorController@store');
        Route::put('/proveedor/actualizar', 'App\Http\Controllers\ProveedorController@update');
        Route::get('/proveedor/selectProveedor', 'App\Http\Controllers\ProveedorController@selectProveedor');
        Route::get('/proveedor/listarPdf','App\Http\Controllers\ProveedorController@listarPdf')->name('proveedores_pdf');

        Route::get('/ingreso', 'App\Http\Controllers\IngresoController@index');
         Route::get('/prueba', 'App\Http\Controllers\IngresoController@prueba');
        Route::post('/ingreso/registrar', 'App\Http\Controllers\IngresoController@store');
        Route::put('/ingreso/desactivar', 'App\Http\Controllers\IngresoController@desactivar');
        Route::get('/ingreso/obtenerCabecera', 'App\Http\Controllers\IngresoController@obtenerCabecera');
        Route::get('/ingreso/obtenerDetalles', 'App\Http\Controllers\IngresoController@obtenerDetalles');
        Route::get('/ingreso/pdf/{id}','App\Http\Controllers\IngresoController@pdf')->name('ingreso_pdf');
        Route::get('/ingreso/listarPdf','App\Http\Controllers\IngresoController@listarPdf')->name('ingresos_pdf');
        
        Route::get('/cliente', 'App\Http\Controllers\ClienteController@index');
        Route::post('/cliente/registrar', 'App\Http\Controllers\ClienteController@store');
        Route::put('/cliente/actualizar', 'App\Http\Controllers\ClienteController@update');
        Route::get('/cliente/selectCliente', 'App\Http\Controllers\ClienteController@selectCliente');
        Route::get('/cliente/listarPdf','App\Http\Controllers\ClienteController@listarPdf')->name('clientes_pdf');

        Route::get('/venta', 'App\Http\Controllers\VentaController@index');
        Route::post('/venta/registrar', 'App\Http\Controllers\VentaController@store');
        Route::put('/venta/desactivar', 'App\Http\Controllers\VentaController@desactivar');
        Route::get('/venta/obtenerCabecera', 'App\Http\Controllers\VentaController@obtenerCabecera');
        Route::get('/venta/obtenerDetalles', 'App\Http\Controllers\VentaController@obtenerDetalles');
        Route::get('/venta/pdf/{id}','App\Http\Controllers\VentaController@pdf')->name('venta_pdf');
        Route::get('/venta/pdfTicket/{id}','App\Http\Controllers\VentaController@pdfTicket')->name('ventaticket_pdf');
        Route::get('/venta/listarPdf','App\Http\Controllers\VentaController@listarPdf')->name('ventas_pdf');

        Route::get('/rol', 'App\Http\Controllers\RolController@index');
        Route::get('/rol/selectRol', 'App\Http\Controllers\RolController@selectRol');
        
        Route::get('/user', 'App\Http\Controllers\UserController@index');
        Route::post('/user/registrar', 'App\Http\Controllers\UserController@store');
        Route::put('/user/actualizar', 'App\Http\Controllers\UserController@update');
        Route::put('/user/desactivar', 'App\Http\Controllers\UserController@desactivar');
        Route::put('/user/activar', 'App\Http\Controllers\UserController@activar');
        Route::get('/user/listarPdf','App\Http\Controllers\UserController@listarPdf')->name('usuarios_pdf');
    });

});