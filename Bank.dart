import 'Account.dart';
import 'CurrentAccount.dart';
import 'SavingsAccount.dart';


class Bank    {
  List<Account> _acounts=[];
  List<Account> get acounts => this._acounts;

 

 
  


  addAccount(Account account){
    if (account.id.length>3 && account.balance>0) {
      acounts.add(account);
      print("${account.id} Add ");
    }else{

      print("Enter Correct info for account");
    }
    
  }

  removeAccount(Account account){
    for (var i = 0; i < acounts.length; i++) {
      if (acounts.contains(account)) {
        if (account.balance==0) {
          acounts.remove(account);
        }
        else if(account.balance>0 || account.balance<0 ){
          print("money in This account : ${account.balance}");
        }
        
      }
    }
  }
    void printAccountBalances() {
      if (this.acounts.length>0) {
        for (var i = 0; i < acounts.length; i++) {
          if (acounts[i].runtimeType.toString()=="Current") {
              print("Current Account: \n Balance : ${acounts[i].balance} \n OverdraftLimit: ${(acounts[i] as Current).getOverdaraftlimit }");
          } 
          else  {
              print("Savings Account: \n Balance : ${acounts[i].balance} \n Interest rate: 1.25% ");
          } 
          
          
        }
      }
    }
  
  void deposit(Account account, double amount) {
    if (this.acounts.contains(account)) {
      account.deposit(amount); 
    }else{
      print("${account.id} not found");
    }
    
  }
  
  
  void withdraw(Account account,double amount) {
    account.withdraw(amount);
  }
  
 
 
 
}