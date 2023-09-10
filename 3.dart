void main(List<String> args) {
  Map<String,dynamic>user={"name":"Ali","Phone":715924217};
  List<String>Keys=[];
  user.forEach((key, value) {
    if(key.length==4){
      Keys.add(key);
    }
  });

  print(Keys);
}