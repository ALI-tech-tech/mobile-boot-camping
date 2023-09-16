


void main(List<String> args) {
  Rectangle re=Rectangle(2.5, 3.5);
  print("area : ${re.area()}");
  print("perimer : ${re.perimer()}");
}

class Rectangle{
  late double length;
  late double width;
  Rectangle(double l,double w){
    this.length=l;
    this.width=w;
  }
  double area(){
    return length*width;
  }

  double perimer(){
    return (2*length)+width;
  }
}


