<?php
namespace App\Traits;
trait ApiResponse{
    public function success_response($result, $code=200, $msg="Successful"){
        return response()->json(
            data:[
                'status'=> true,
                'code'=> $code,
                'message'=> $msg,
                'data'=> $result,
            
            ],
            status:$code
        );
    
    }

    public function failed_response($result=null, $code=404, $msg="Failed"){
        return response()->json(
            data:[
                'status'=> true,
                'code'=> $code,
                'message'=> $msg,
                'data'=> $result,
            
            ],
            status:$code
        );
    
    }
}


?>