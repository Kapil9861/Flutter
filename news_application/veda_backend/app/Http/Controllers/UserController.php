<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;


class UserController extends Controller
{
    public function store(Request $request){        
        $validator=Validator::make($request->all(),[
            'source_id'=>"required|exists:sources,id",
            'name'=>'required|string|max:45',
            'phone'=>'required|string|min:14|unique:users,phone',
            'email' => 'required|string|email|max:255|unique:users,email',
            "password"=>"required|string|min:8",
            'device_name' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => true, 'message' => $validator->errors()->first()], 400);
        }
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone=$request->phone;
        $user->remember_token=$request->remember_token;
        $user->password = Hash::make($request->password);
        $user->source_id = $request->source_id; // Save the source ID if provided
        
        $user->save();
        
        $token = $user->createToken($request->device_name)->plainTextToken;
        return response()->json([
            'success' => 'User created successfully.',
            'token' => $token,
            'user' => $user,
        ], 201);
    }
    
    public function login(Request $request){
        $validator=Validator::make($request->all(),[
            'email' => 'required|string|email|max:255|min:11',
            'password' => 'required|string',
            'device_name' => 'required|string',
        ]);

        if($validator->fails()){
            return response()->json(['error' => true, 'errorMessage' => $validator->errors()->first()], 400);
        }
        $user=User::where('email',$request->email)->first();
        if (! $user || ! Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'errorMessage' => 'The provided credentials are incorrect.',
            ]);
        }
     
        $token=$user->createToken($request->device_name)->plainTextToken;

        return response()->json(['message'=>"User logged in Successfully!",'token' => $token, 'user' =>$user,]);
    }

    public function logout(Request $request){
        return response()->json([
            'success' => $request->user,
        ], 201);
        
        $request->user()->currentAccessToken()->delete();  //GPT le deko yo herna baki cha

        return response()->json([
            'success' => 'Logged out successfully!',
        ], 201);
    } 
    
}
