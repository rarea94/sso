<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});

///sectiune ACTIUNI DEPOZIT
//Intrari marfa
//iesiri marfa
//muta marfa 
//task terminale
//Alerte stock


///sectiune info 
//stoc in dep 
//spatiu de stocare activ


///Setari cont / administrare contueri si reguli
//REGULI PE USER
//PUTERI USERI 
//TASKUTI PE USER
//ROLURI PE USERI 


///productie ACTIUNI
//ordin  productie
//status productie
//status stock productie
//setari alerte productie


///Setari sistem
//config depozite 
//config tip produse(inflamabil , exploziv, normal, gabarit mare)
//config tip manipulare (fragil, nu )
//config tip primire (fifo , lilo . etc)

