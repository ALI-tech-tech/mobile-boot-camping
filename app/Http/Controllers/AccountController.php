<?php
namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\User;
use Illuminate\Http\Request;

class AccountController extends Controller
{
    public function index(User $user)
    {
        $accounts = $user->accounts;
        return response()->json($accounts);
    }

    public function show(Account $account)
    {
        return response()->json($account);
    }

    public function store(Request $request, User $user)
    {
        $account = $user->accounts()->create($request->all());
        return response()->json($account, 201);
    }

    public function update(Request $request, Account $account)
    {
        $account->update($request->all());
        return response()->json($account);
    }

    public function destroy(Account $account)
    {
        $account->delete();
        return response()->json(['message' => 'Account deleted successfully']);
    }
}
