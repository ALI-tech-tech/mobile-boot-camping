
void main(List<String> args) {
  BankAccount myaccount=BankAccount(002564, 100000);
  myaccount.deposit(50000);
  myaccount.withdraw(10000);
  print(myaccount.balance);
}

class BankAccount{
  late int accountNumber;
  late int balance;

  BankAccount(int accountnumber,int balance){
    this.accountNumber=accountnumber;
    this.balance=balance;
  }

  deposit(int m){
    this.balance+=m;
  }

  withdraw(int m){
    this.balance-=m;
  }


}