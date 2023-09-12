
/*
4) Write a program to create an enum called "DaysOfWeek" representing the days of the 
week using enum and display it
*/

void main(List<String> args) {
  //print days of week name using foreach and element.name
  DaysOfWeek.values.forEach((element) { 
    print(element.name);
  });
}
//create enum object have days of week
enum DaysOfWeek{
  Saturday,
  Sunday,
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday
}