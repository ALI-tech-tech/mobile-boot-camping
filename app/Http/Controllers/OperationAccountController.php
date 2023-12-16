<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\Currenies;
use App\Models\Transactions;
use App\Models\User;
use Illuminate\Http\Request;

class OperationAccountController extends Controller
{
    public function withdraw(Request $request, $accountId)
    {

        $account = Account::findOrFail($accountId);


        $currentBalance = $account->balance;
        $withdrawAmount = $request->input('amount');

        if ($currentBalance < $withdrawAmount) {

            return response()->json(['error' => 'Insufficient balance'], 400);
        }


        $transaction = new Transactions();
        $transaction->account_id = $account->id;
        $transaction->amount = -$withdrawAmount;
        $transaction->save();


        $account->balance -= $withdrawAmount;
        $account->save();

        return response()->json(['message' => 'Withdrawal successful']);
    }

    public function deposit(Request $request, $accountId)
    {

        $account = Account::findOrFail($accountId);
        $depositAmount = $request->input('amount');

        $transaction = new Transactions();
        $transaction->account_id = $account->id;
        $transaction->amount = $depositAmount;
        $transaction->save();

        $account->balance += $depositAmount;
        $account->save();


        return response()->json(['message' => 'Deposit successful']);
    }

    public function transfer(Request $request, $sourceAccountId, $destinationAccountId)
    {
        try {
            $sourceAccount = Account::findOrFail($sourceAccountId);
            $destinationAccount = Account::findOrFail($destinationAccountId);
        } catch (\Throwable $th) {
            return response()->json(['error' => 'Not found account'], 400);
        }


        $sourceBalance = $sourceAccount->balance;
        $transferAmount = $request->input('amount');
        if ($sourceBalance < $transferAmount) {
            return response()->json(['error' => 'Insufficient balance'], 400);
        }

        $sourceTransaction = new Transactions();
        $sourceTransaction->account_id = $sourceAccount->id;
        $sourceTransaction->amount = -$transferAmount;
        $sourceTransaction->save();

        $destinationTransaction = new Transactions();
        $destinationTransaction->account_id = $destinationAccount->id;
        $destinationTransaction->amount = $transferAmount;
        $destinationTransaction->save();

        $sourceAccount->balance -= $transferAmount;
        $sourceAccount->save();

        $destinationAccount->balance += $transferAmount;
        $destinationAccount->save();

        return response()->json(['message' => 'Transfer successful']);
    }

    public function mtransfer(Request $request)
    {
        $momaiaznumbersource = $request->input('momaiaz_number_source');
        $momaiaznumberdestination = $request->input('momaiaz_number_destination');
        $transferAmount = $request->input('amount');
        $currancyId = Currenies::findOrFail($request->input('currency'));

        try {
            $usersource = User::findOrFail($momaiaznumbersource);
            $userdestination = User::findOrFail($momaiaznumberdestination);
            if (!$userdestination->is_suspended) {
                $sourceAccount = $usersource->accounts()->where('id', $currancyId)->first();
                $destinationAccount = $userdestination->accounts()->where('id', $currancyId)->first();
                if ($sourceAccount != null || $destinationAccount != null) {

                    $sourceBalance = $sourceAccount->balance;
                    $transferAmount = $request->input('amount');
                    if ($sourceBalance < $transferAmount) {
                        return response()->json(['error' => 'Insufficient balance'], 400);
                    }

                    $sourceTransaction = new Transactions();
                    $sourceTransaction->account_id = $sourceAccount->id;
                    $sourceTransaction->amount = -$transferAmount;
                    $sourceTransaction->save();

                    $destinationTransaction = new Transactions();
                    $destinationTransaction->account_id = $destinationAccount->id;
                    $destinationTransaction->amount = $transferAmount;
                    $destinationTransaction->save();

                    $sourceAccount->balance -= $transferAmount;
                    $sourceAccount->save();

                    $destinationAccount->balance += $transferAmount;
                    $destinationAccount->save();

                    return response()->json(['message' => 'Transfer successful']);
                }
            }
        } catch (\Exception $e) {
            return response()->json(['error' => 'Account not found'], 400);
        }
    }
}
