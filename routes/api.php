<?php

use App\Http\Controllers\CourseController;
use App\Http\Controllers\CourseRegistrationController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TeacherController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::apiResources([
    'course'=>CourseController::class,
    'student'=>StudentController::class,
    'teacher'=>TeacherController::class,
    //'courseregister'=>CourseRegistrationController::class,
]);

Route::post('/students/{student}/courses/{course}', [CourseRegistrationController::class,'registerStudentForCourse']);  
Route::get('/course/hour/{hour}', [CourseController::class,'getCoursesByHours']);  
Route::get('/getTeacherByCountCourse', [TeacherController::class,'getTeacherByCountCourse']);  