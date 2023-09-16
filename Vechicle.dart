
void main(List<String> args) {
  Vechicle vi=Vechicle("Mercedes-Benz", 	"A-Class", 2000);
  vi.vehicledetails();
}

class Vechicle {
  late String model;
  late String brand;
  late int year;

  Vechicle(String brand,String model,int year){
    this.brand=brand;
    this.model=model;
    this.year=year;
  }

  vehicledetails(){
    print("brand is : $brand , model : $model , year : $year ");
  }


}