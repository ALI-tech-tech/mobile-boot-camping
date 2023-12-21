<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class Users extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            "id"=> $this->id,
            "name"=>$this->name,
            "email"=> $this->email,       
            "is_suspended"=> $this->is_suspended?"Suspended":"UnSuspended",
            "momaiaz_number"=> $this->momaiaz_number,
            
        ];
    }
}
