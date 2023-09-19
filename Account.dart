

abstract class Account  {
  late String? _id;
  late double _balance;

  Account({required String id, required double balance}) {
    this.id = id;
    this.balance = balance;
  }

  get id => this._id;

  set id(value) => this._id = value;

  get balance => this._balance;

  set balance(value) => this._balance = value;
  

 
  void deposit( double amount);
  

  void withdraw(double amount) ;

}
