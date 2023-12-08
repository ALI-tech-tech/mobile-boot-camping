<?php

namespace App\Http\Controllers;

use App\Models\Course;
use Illuminate\Http\Request;
use App\Traits\ApiResponse;
use Illuminate\Support\Facades\Validator as FacadesValidator;


class CourseController extends Controller
{

    use ApiResponse;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $reault = Course::all();
        return $this->success_response($reault);
    }
    public function getCoursesByHours(int $hours)
    {
        //get all courses with hours 3 and you can send any number of hours
        $courses = Course::where('hours', $hours)->get();
        return response()->json($courses);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = $this->rule($request);
        if ($validation->fails()) {
            return $this->failed_response(result: $validation->errors());
        }
        //--------------------------------------------
        $createdCourses = [];

        foreach ($request['courses'] as $courseData) {
            $course = Course::create($courseData);
            $createdCourses[] = $course;
        }
        //$course = Course::create($request->all());
        return $this->success_response(result: $createdCourses , code: 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        $reault = Course::find($id);
        if (!is_null($reault)) {
            return $this->success_response($reault);
        } else {
            return $this->failed_response(code: 404);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, int $id)
    {
        $obj = Course::find($id);
        if (!is_null($obj)) {
            $reault =  tap($obj)->update($request->all());
            return $this->success_response($reault);
        } else {
            return $this->failed_response(code: 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        try {
            $course = Course::findOrFail($id);
            $course->delete();
            return $this->success_response(result: null, code: 200);
        } catch (\Exception $e) {
            return $this->failed_response(msg: 'Course not found', code: 404);
        }
    }

    function rule(Request $request)
    {

        return FacadesValidator::make(
            $request->all(),
            [

                'courses' => 'required|array',
                'courses.*.name' => 'required|unique:courses,name',
                'courses.*.hours' => 'required|integer',
            ]
        );
    }
}
