<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Validator;
use Illuminate\Support\Facades\Auth;

class PassportAuthController extends Controller
{
        //Registro de usuario
        public function register(Request $request){
            $validator = Validator::make($request->all(),
                [
                    'name'      => 'required|string|max:255',
                    'last_name' => 'required|string|max:255',
                    'phone'     => 'required|string|max:255',
                    'email'     => 'required|email|max:255|unique:App\Models\User,email',
                    'password'  => 'required|min:8',
                ]
            );
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            }
                
            $user = User::create(
                [
                    'name'      => $request->name,
                    'last_name' => $request->last_name,
                    'phone'     => $request->phone,
                    'email'     => $request->email,
                    'password'  => bcrypt($request->password),
                ]
                );
                $token = $user->createToken('LaravelAuthApp')->accessToken;
                //$token = $user ->createToken('LaravelAuthApp')->accessToken;
    
                return response()->json(['token'=>$token], 200);
        }
    
        //Login de usuario
        /*public function login(Request $request){
            $credentials = [
                'email' => $request->email,
                'password' => $request->password
            ];
    
            if (auth()->attempt($credentials)){
                $token = auth()->user()->createToken('LaravelAuthApp')->accessToken;
                return response()->json(['token'=>$token], 200);
            }else{
                return response()->json(['error' => 'Credenciales erroneas']);
            }
        }*/
        public function login(Request $request)
        {
                $credentials = [
                    'email'=>$request->email,
                    'password'=>$request->password
                ];

                if(auth()->attempt($credentials)){
                    $token = auth()->user()->createToken('LaravelAuthApp')->accessToken;
                    return response()->json(['token'=>$token, 'status'=>200, 'user'=>auth()->user()]);
                }
                else{
                    return response()->json(['error' => 'Unauthorized','status'=>401], 401);
                }
                /*if (auth()->attempt($data)){
                    $token = auth()->user()->createToken('LaravelAuthApp')->accessToken;
                    return response()->json(['token' => $token], 200);
                }else{
                    return response()->json(['error' => 'Credenciales erroneas'], 401);
                }*/ 
        }
    
        public function logout(){
            $token = auth()->user()->token();
            $token->revoke();
            return response()->json(['success'=>'Logout successfully']);
        }
}
