<?php

namespace App\Http\Controllers;

use App\Models\Teacher;
use Illuminate\Http\Request;
use App\Traits\ApiResponse;
use Illuminate\Support\Facades\Validator as FacadesValidator;


class TeacherController extends Controller
{
    
    use ApiResponse;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $reault = Teacher::all();
        return $this->success_response($reault);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = $this->rule($request);
        if ($validation->fails()) {
            return $this->failed_response(result:$validation->errors());
        }
        //--------------------------------------------
        $teacher = Teacher::create($request->all());
        return $this->success_response(result: $teacher, code: 201);
   
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        $reault = Teacher::find($id);
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
        $obj = Teacher::find($id);
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
            $teacher = Teacher::findOrFail($id);
            $teacher->delete();
            return $this->success_response(result:null,code:200);
        } catch (\Exception $e) {
            return $this->failed_response(msg:'Teacher not found',code: 404);
        }
    }

    function rule(Request $request)
    {

        return FacadesValidator::make(
            $request->all(),
            [
                'name' => 'required|unique',
                
            ]
        );
    }
}
