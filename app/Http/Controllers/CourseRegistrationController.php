<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Student;
use Illuminate\Http\Request;
use App\Traits\ApiResponse;

class CourseRegistrationController extends Controller
{
    use ApiResponse;
    public function registerStudentForCourse($studentId, $courseId)
    {
        
        $student = Student::findOrFail($studentId);
        $course = Course::findOrFail($courseId);

        
        if ($student->courses()->where('course_id', $course->id)->exists()) {
            return $this->failed_response(msg:'Student is already registered',code:400);
        }

     
        $student->courses()->attach($course->id);
        return $this->success_response(result:$student, msg:'Student registered for the course',code:200);
    }

    public function addGrade($studentId, $courseId, $grade)
    {
        $student = Student::findOrFail($studentId);
        $course = Course::findOrFail($courseId);

        
        if (!$student->courses()->where('course_id', $course->id)->exists()) {
            return $this->failed_response(msg:'Student is not registered',code:400);
        }

       
        $student->courses()->updateExistingPivot($course->id, ['grade' => $grade]);
        return $this->success_response(result:$student, msg:'Grade added successfully',code:200);

    }
}
