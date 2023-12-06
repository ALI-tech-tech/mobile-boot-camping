<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    use HasFactory;

    protected $fillable = [
        "name",
        "published_at"
    ];

    public function category()
    {
        
        return $this->belongsTo(Category::class,);
    }

    public function authors()
    {
        
        return $this->belongsToMany(Author::class, 'author_book')->withPivot('is_active')->withTimestamps();
    }
}
