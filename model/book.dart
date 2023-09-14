class book{
  int id=0;
  String name="";
  String Author="";
  dynamic Quantity=0;
  dynamic Price=0;
  String Category="";

  

  Map<String,dynamic> mapbook(){
    Map<String,dynamic> m={
      "id":this.id ,
      "name":this.name,
      "category":this.Category,
      "author":this.Author,
      "quantity":this.Quantity ,
      "price":this.Price ,
    };

return m;
  }
}