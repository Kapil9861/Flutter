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
                'id'=>$article->id,
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

    public function delete($id){
        $article=NewsArticle::find($id);
        if($article){
            $article->delete();
            return response()->json(['message'=>"Article was deleted successfully!"]);
        }
        return response()->json(['message'=>"404: Article not found!"]);

    }
}