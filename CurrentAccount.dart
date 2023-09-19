import 'Account.dart';

class Current extends Account {
 double overdaraftlimit=1000.00;
  get getOverdaraftlimit => this.overdaraftlimit;

 set setOverdaraftlimit( overdaraftlimit) => this.overdaraftlimit = overdaraftlimit;

  Current({required super.id, required super.balance});
  
  @override
  void deposit(double amount) {
    // TODO: implement deposit
    this.balance+=amount;
  }
  
  @override
  void withdraw(double amount) {
    // TODO: implement withdraw
    if (this.balance!=(-1000)) {
      this.balance-=amount;
      print("withdraw done \n Balance : ${this.balance} ");
    }else{
      print("overdaraftlimit : -${this.getOverdaraftlimit}");
    }

  }

  
}