import 'Bank.dart';
import 'CurrentAccount.dart';
import 'SavingsAccount.dart';

void main(List<String> args) {
  Current c1=Current(id: "42636", balance: 5000.00);
  savingaccount s1=savingaccount(id: "56664", balance: 1000.00);
  Bank b1=Bank();
  b1.addAccount(c1);
  b1.addAccount(s1);
  b1.printAccountBalances();

  s1.deposit(100);
  c1.deposit(500);
  s1.withdraw(150);

  b1.printAccountBalances();

  s1.calculateInterest();
}