<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\Transactions;
use App\Models\User;
use Illuminate\Http\Request;

class AccountController extends Controller
{
    public function index(User $user)
    {
        $accounts = $user->accounts;
        return response()->json($accounts);
    }

    public function show(int $id)
    {
        $account = Account::findOrFail($id);
        return response()->json($account);
    }

    public function store(Request $request, User $user)
    {
        $accountData = $request->all();
        //$accountData['main_account_id'] = $user->accounts->isEmpty() ? null : $user->main_account_id;

        $account = $user->accounts()->create($accountData);

        if ($user->accounts->count() === 1) {
            $user->main_account_id = $account->id;
            $user->save();
        }

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
