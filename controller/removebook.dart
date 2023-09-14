

removebook(List<Map<String,dynamic>> li,int id){
  int len=li.length;
  for (var i = 0; i < li.length; i++) {
    if (li[i]["id"]==id) {
      li.remove(li[i]);
    }
    
  }
  if (len==li.length) {
    print("not found");
  }else{
  print("Remove Done");
  }
  print("-----------------------------------------------");
}