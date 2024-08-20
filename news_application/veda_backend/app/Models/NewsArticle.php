<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NewsArticle extends Model
{
    use HasFactory;
    protected $fillable=['source_id','category','user_id','title','description','author','url','urlToImage','publishedAt','content',];

    public function source(){
        return $this->belongsTo(Source::class);
    }
}
