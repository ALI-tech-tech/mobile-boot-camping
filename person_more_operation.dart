mixin person_more_operation{
  int Registeredfrom(DateTime dt){
    return dt.difference(DateTime.now()).inDays;
  }
}