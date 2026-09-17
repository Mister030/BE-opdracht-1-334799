<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\MagazijnController;
use App\Http\Controllers\MagazijnmedewerkerController;
use App\Http\Controllers\InkoperController;
use App\Http\Controllers\MagazijnbeheerderController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
})->name('welcome');

Route::get('/magazijn', [MagazijnController::class, 'index'])
    ->name('magazijn.index')
    ->middleware(['auth', 'role:magazijnmedewerker,magazijnbeheerder']);

Route::get('/magazijnmedewerker', [MagazijnmedewerkerController::class, 'index'])
    ->name('magazijnmedewerker.index')
    ->middleware(['auth', 'role:magazijnmedewerker,magazijnbeheerder']);

Route::get('/inkoper', [InkoperController::class, 'index'])
    ->name('inkoper.index')
    ->middleware(['auth', 'role:inkoper,magazijnbeheerder']);

Route::get('/magazijnbeheerder', [MagazijnbeheerderController::class, 'index'])
    ->name('magazijnbeheerder.index')
    ->middleware(['auth', 'role:magazijnbeheerder']);

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
