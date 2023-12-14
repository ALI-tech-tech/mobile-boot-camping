<?php

namespace App\Http\Controllers;
use Illuminate\Support\Str;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function index()
    {
        $users = User::all();
        return response()->json($users);
    }
    public function updateMainAccount(Request $request)
{
    $user = Auth::user();

    $accountId = $request->input('account_id'); 
    $userId = $request->user()->id; 
    $user = User::find($userId); 

    if ($user && $user->accounts()->where('id', $accountId)->exists()) {

        $user->main_account_id = $accountId; 
        $user->save(); 

        return response()->json(['message' => 'Main account updated successfully.']);
    }

    return response()->json(['message' => 'Account not found.'], 404);
}
    public function create(Request $request)
    {
        $userData = $request->all();
    
        
        $year = substr(date('Y'), -2);
        $randomNumbers = Str::random(4);
        $userData['momaiaz_number'] = $year . $randomNumbers;
    
        $user = User::create($userData);
    
        return response()->json($user, 201);
    }
    public function show(User $user)
    {
        return response()->json($user);
    }

    public function update(Request $request, User $user)
    {
        $user->update($request->all());
        return response()->json($user);
    }

    public function destroy(User $user)
    {
        $user->delete();
        return response()->json(['message' => 'User deleted successfully']);
    }
}

