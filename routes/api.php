<?php

use App\Http\Controllers\AccountController;
use App\Http\Controllers\authController;
use App\Http\Controllers\OperationAccountController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BankController;
use App\Http\Controllers\BranchController;
use App\Http\Controllers\TransactionController;
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



// Route::post('/login', [BankController::class, 'login']);
// Route::middleware('auth:api')->group(function () {
//     Route::post('/create-account', [BankController::class, 'createAccount']);
//     Route::post('/update-main-account', [BankController::class, 'updateMainAccount']);
//     Route::post('/transaction', [BankController::class, 'makeTransaction']);
// });


Route::post('/login', [authController::class, 'login']);
Route::post('/logout', [authController::class, 'logout']);
//'middleware' => ['auth:sanctum']
Route::group([], function () {


    Route::get('/users', [UserController::class, 'index']);
    Route::put('/users/{id}', [UserController::class, 'update']);
    Route::delete('/users/{id}', [UserController::class, 'destroy']);
    //Route::put('/users/{id}/mainaccount/{id}', [UserController::class, 'updateMainAccount']);

    Route::get('/branches', [BranchController::class, 'index']);
    Route::post('/branches', [BranchController::class, 'store']);
    Route::get('/branches/{id}', [BranchController::class, 'show']);
    Route::put('/branches/{id}', [BranchController::class, 'update']);
    Route::delete('/branches/{id}', [BranchController::class, 'destroy']);


    Route::get('/accounts', [AccountController::class, 'index']);
    Route::post('/accounts', [AccountController::class, 'store']);
    Route::put('/accounts/{id}', [AccountController::class, 'update']);
    Route::delete('/accounts/{id}', [AccountController::class, 'destroy']);

    Route::group(["/operation"], function () {
    Route::get('/withdraw/{accountId}', [OperationAccountController::class, 'withdraw']);
    Route::post('/deposit/{accountId}', [AccountController::class, 'deposit']);
    Route::put('/transfer', [AccountController::class, 'transfer']);
    Route::put('/mtransfer', [AccountController::class, 'mtransfer']);
    });


});

Route::post('/users', [UserController::class, 'store']);
