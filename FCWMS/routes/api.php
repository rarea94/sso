<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::post('/', function (Request $request) {
    return response()->json(['message' => 'OK'], 200); // Respond with a JSON object
});
// Login route
Route::post('/login', function (Request $request) {
    // Define validation rules
    $rules = [
        'email' => 'required|email',
        'password' => 'required',
    ];

    // Create a validator instance
    $validator = Validator::make($request->all(), $rules);

    // Check if validation fails
    if ($validator->fails()) {
        return response()->json([
            'message' => 'Validation failed',
            'errors' => $validator->errors(),
        ], 422);
    }

    // Attempt to authenticate the user
    if (Auth::attempt($request->only('email', 'password'))) {
        // Generate a new API token for the user
        $user = User::where('email', $request->email)->first();
        $token = $user->createToken('YourAppName')->plainTextToken;

        return response()->json([
            'token' => $token,
            'user' => $user,
        ], 200);
    }

    return response()->json(['message' => 'Invalid credentials.'], 401);
});

//todo -bulit sa imi bag pula in el 
Route::middleware('auth:sanctum')->post('/logout', function (Request $request) {
    // Check if the user is authenticated
    if (!$request->user()) {
        return response()->json(['message' => 'Unauthenticated.'], 401);
    }

    // Delete the current access token
    $request->user()->currentAccessToken()->delete();

    return response()->json(['message' => 'Logged out successfully.']);
});