<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\NewsArticleController;
use App\Http\Controllers\SourceController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get("/getData",[NewsArticleController::class,'index']);

Route::delete("deleteArticle/{id}",[NewsArticleController::class,"delete"]);

Route::get("/getCompanies",[SourceController::class,'index']);

Route::post("/addCompany",[SourceController::class,"store"]);

Route::post("/addUser",[UserController::class,"store"]);

Route::post("/login",[UserController::class,"login"]);


