<?php

namespace App\Http\Controllers;

use App\Models\Source;
use Illuminate\Http\Request;

class SourceController extends Controller
{
    public function index(){
        $companies=Source::all();
        return $companies;
    }

    public function store(Request $request){
        $validatedData= $request->validate(["name"=>"required|string|max:30|unique:sources,name"]);
        $existingSource = Source::where('name', $validatedData['name'])->first();
        if ($existingSource) {
            // If the source already exists, return an error message or redirect back
             return response()->json([
                'error' => 'The source name already exists!',
            ], 409);
        }
        $source=new Source;
        $source->name=$validatedData['name'];
        $source->save();
        return response()->json([
            'success' => 'Source created successfully.',
        ], 200);
    }
}
