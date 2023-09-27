import 'CarBilder.dart';
import 'main.dart';

class Car {
  late CarType cartype;
  late Category category;
  late int seats;
  late bool gpsNavigator;

  Car(CarBuilder B){
    this.cartype=B.cartype;
    this.category=B.category;
    this.gpsNavigator=B.gpsNavigator;
    this.seats=B.seats;
  }

  printdata(){
    print("Car Type: ${cartype.name}\nCar Category:${category.name}\nSeats Count:$seats\nGPS Navigator:${gpsNavigator?"Functional":"N/A"}");
  }
}
