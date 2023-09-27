import 'Car.dart';
import 'main.dart';

class CarBuilder {
  late CarType cartype;
  late Category category;
  late int seats;
  late bool gpsNavigator;

  CarBuilder({required this.cartype,required this.category});

  CarBuilder setSeats(int seats){
    this.seats=seats;
    return this;
  }
  CarBuilder setgpsNavigator(bool gpsNavigator){
    this.gpsNavigator=gpsNavigator;
    return this;
  }
  Car Build(){
    return Car(this);
  }
}