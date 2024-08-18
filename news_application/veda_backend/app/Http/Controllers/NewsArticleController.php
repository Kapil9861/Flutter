<?php

namespace App\Http\Controllers;

use App\Models\NewsArticle;
use Illuminate\Http\Request;

class NewsArticleController extends Controller
{
    public function index(){
        $articles=NewsArticle::with('source')->get();
        $formattedArticles=$articles->map(function ($article){
            return [
                'source'=>[
                    'id' => $article->source->id ?? null,
                    'name' => $article->source->name ?? null,
                ],
                'author' => $article->author ?? null,
                'title' => $article->title ?? null,
                'description' => $article->description ?? null,
                'url' => $article->url ?? null,
                'urlToImage' => $article->urlToImage ?? null,
                'publishedAt' => $article->publishedAt ?? null,
                'content' => $article->content ?? null,
            ];
        });

        return response()->json([
            "status"=>'ok',
            'totalResults'=>$articles->count(),
            'articles'=>$formattedArticles,
        ]);
    }
}
