<?php

namespace App\Http\Controllers;

use App\Models\Profile;
use Illuminate\Http\Request;
use App\Traits\ApiResponse;
use Illuminate\Support\Facades\Validator as FacadesValidator;

class ProfileController extends Controller
{
    use ApiResponse;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $reault = Profile::all();
        return $this->success_response($reault);
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
        $author = Profile::create($request->all());
        return $this->success_response(result: $author, code: 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Profile $profile)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Profile $profile)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Profile $profile)
    {
        //
    }

    function rule(Request $request)
    {

        return FacadesValidator::make(
            $request->all(),
            [
                'home_town'    => 'required|string|max:255',
                'phone_number' => 'required|string|min:10|max:20',
                'authorr_id'   =>'required|exists:authors,id|unique:profiles,authorr_id',
            ]
        );
    }
}
