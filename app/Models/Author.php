<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Author extends Model
{
    use HasFactory;

    protected $fillable = ["name"];

    public function profile (){
        return $this->hasOne(Profile::class,"authorr_id");
    }
    public function books()
    {
        return $this->belongsToMany(Book::class, 'author_book')->withPivot('is_active')->withTimestamps();
    }
}
