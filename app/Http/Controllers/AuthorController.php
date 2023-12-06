<?php

namespace App\Http\Controllers;

use App\Models\Author;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator as FacadesValidator;

class AuthorController extends Controller
{
    use ApiResponse;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $reault = Author::all();
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
        $author = Author::create($request->all());
        return $this->success_response(result: $author, code: 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        $reault = Author::find($id);
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
        $obj = Author::find($id);
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
            $author = Author::findOrFail($id);
            $author->delete();
            return $this->success_response(result:null,code:200);
        } catch (\Exception $e) {
            return $this->failed_response(msg:'Author not found',code: 404);
        }
    }

    function rule(Request $request)
    {

        return FacadesValidator::make(
            $request->all(),
            [
                'name' => 'required|unique:authors,name',
            ]
        );
    }
}
