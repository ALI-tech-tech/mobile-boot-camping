

import 'Account.dart';
import 'AccountManagement.dart';

class savingaccount extends Account implements AccountManagement {
  late double interestrate;

 double get getInterestrate => this.interestrate;

 set setInterestrate(double interestrate) => this.interestrate = interestrate;

  savingaccount({required super.id, required super.balance});
  
  @override
  void calculateInterest() {
    // TODO: implement calculateInterest
    this.setInterestrate=(this.balance*((1.25)/100));
    this.balance+=this.interestrate;
    print("After applying interest on Saving : \nAccount Balance SavingsAccount: ${this.balance}");
  }
  
  @override
  void deposit(double amount) {
    // TODO: implement deposit
    this.balance+=amount;
    
  }
  
  @override
  void withdraw(double amount) {
    // TODO: implement withdraw
    if (this.balance>0) {
      this.balance-=amount;
    }
    
  }
  
}