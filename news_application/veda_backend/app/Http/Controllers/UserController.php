<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function store(Request $request){
        $validator=Validator::make($request->all,[
            'source_id'=>"required"
        ]);
    }
}
