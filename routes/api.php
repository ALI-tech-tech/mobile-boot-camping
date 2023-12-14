<?php

use App\Http\Controllers\AccountController;
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


Route::middleware(['auth:api'])->group(function () {

    Route::resource('users', UserController::class);


    Route::resource('accounts', AccountController::class);
    Route::resource('Operation', OperationAccountController::class);

    Route::resource('branchs', BranchController::class);
});
