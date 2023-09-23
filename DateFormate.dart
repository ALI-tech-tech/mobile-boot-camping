class DateFormate {

  String date(String date){
  List<String> s=date.split("/");
  if (s.first.length!=2) {
    s.replaceRange(0, 1, ["0${s.first}"]);
  }
  if(s[1].length!=2){
    s.replaceRange(1, 2, ["0${s[1]}"]);
  }
  
  return "${s.first}/${s[1]}/${s.last}";
}

}