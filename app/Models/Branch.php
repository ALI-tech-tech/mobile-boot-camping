<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Branch extends Model
{
    use HasFactory;
    protected $fillable = [
        'code',
        // Add any other necessary fields
    ];

    public function accounts()
    {
        return $this->hasMany(Account::class);
    }
}
