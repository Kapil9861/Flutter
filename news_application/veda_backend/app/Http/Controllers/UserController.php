<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function store(Request $request){
        
        $validator=Validator::make($request->all,[
            'source_id'=>"required|exists:sources,id",
            'name'=>'required|string|max:45',
            'phone'=>'required|string|max:13|unique:users,phone',
            'email'=>'required|string|email|max:255|unique:users,email',
            "password"=>"required|string|min:8",
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => true, 'message' => $validator->errors()->first()], 400);
        }
        $user=new User();
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone=$request->phone;
        $user->password = Hash::make($request->password);
        $user->source_id = $request->source_id; // Save the source ID if provided
        $user->save();

        return response()->json([
            'success' => 'User created successfully.',
            'user' => $user,
        ], 201);
    }
    
}
