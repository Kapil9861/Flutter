<?php

namespace App\Http\Controllers;

use App\Models\Source;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SourceController extends Controller
{
    public function remove(Request $request){
        if($request->name!=null){
            return response()->json([
                'success' => 'Source created successfully.',
            ], 200);
        }else{
            return response()->json([
                'success' => 'Source could not be deleted.',
            ], 200);
        }
    }

    public function index(){
        $companies=Source::all();
        return $companies;
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(),[
            'name' => "required|string|max:30|unique:sources,name"
        ]);
        if($validator->fails())
        {
            return response()->json(['error'=>true, 'message'=>"Invalid! Please check your company again!"],400);
        }
        
        $source=new Source;
        $source->name=$request->name;
        $source->save();
        return response()->json([
            'success' => 'Source created successfully.',
        ], 200);
    }
    
}