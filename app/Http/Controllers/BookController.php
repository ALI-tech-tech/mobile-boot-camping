<?php

namespace App\Http\Controllers;


use App\Models\Book;
use App\Traits\ApiResponse;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator as FacadesValidator;


class BookController  extends Controller 
{
    use ApiResponse;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $reault= Book::with('authors')->get();
        return $this->success_response($reault);
          //    return response()->json(
    //     data:[
    //         "status"=> true,
    //         "code"=>200,
    //         "message"=>'Sucessfull',
    //         "data"=>$result,


    //     ],
    //     status:200
    //    );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation=$this->rule($request);
        if($validation->fails()){
            return $this->failed_response(result:$validation->errors());
        }
        //--------------------------------------
        $request["published_at"]= Carbon::createFromFormat('d/m/Y', $request->published_at);
        $book= Book::create($request->all());
        $book->authors()->attach($request->author_id);
        return $this->success_response(result: $book, code:201);
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        $reault= Book::with('authors')->find($id);
        if (!is_null($reault)) {
            return $this->success_response($reault);
        }
            else{
                return $this->failed_response(code:404);
            }
        
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, int $id)
    {
        $validation=$this->rule($request);
        if($validation->fails()){
            return $this->failed_response(result:$validation->errors());
        }
        
        $obj= Book::find($id);
        if (!is_null($obj)) { 
            if($request->has('published_at'))
            $request["published_at"]= Carbon::createFromFormat('d/m/Y', $request->published_at);
           $reault=  tap($obj)->update($request->all());
           $obj->authors()->sync($request->author_id);
            return $this->success_response($reault);
        }
            else{
                return $this->failed_response(code:404);
            }
     
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
       
        try {
            $product = Book::findOrFail($id);
            $product->authors()->detach();
            $product->delete();
            return $this->success_response(result: null, code: 200);
        } catch (\Exception $e) {
            return $this->failed_response(msg: 'Book not found', code: 404);
        }
    }
    function rule(Request $request){
        
        return FacadesValidator::make($request->all(),
        [
            'name'=>'required|unique:books,name',
            'published_at'=>'required|date_format:d/m/Y|before:'.Carbon::now(),
            'category_id'   =>'required|exists:categories,id',
            'authorr_id'=>'required|array',
            'authorr_id.*'=>'exists:authors,id',
        ]);
    }
}
