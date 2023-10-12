extension MyString on String{
  toint(){
    return int.tryParse(this);
  }

  todouble(){
    return double.tryParse(this);
  }
}