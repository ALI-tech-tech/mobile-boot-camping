
import 'Car.dart';
import 'CarBilder.dart';

void main(List<String> args) {
  CarBuilder car=CarBuilder(cartype: CarType.SPORTS_CAR, category: Category.MANUAL)..setSeats(4)..setgpsNavigator(true);
  Car c=car.Build();
  CarBuilder car2=CarBuilder(cartype: CarType.CITY_CAR, category: Category.MANUAL)..setSeats(6)..setgpsNavigator(false);
  Car c2=car2.Build();
  c.printdata();
  c2.printdata();
}


enum CarType { CITY_CAR, SPORTS_CAR}
enum Category { MANUAL, AUTOMATIC }