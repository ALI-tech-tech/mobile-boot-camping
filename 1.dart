void main(List<String> args) {

  List<Map<String,dynamic>> restaurants = [
  {
  'name': 'Pizza Mario',
  'cuisine': 'Italian',
  'ratings': [4.0, 3.5, 4.5],
  },
  {
  'name': 'Chez Anne',
  'cuisine': 'French',
  'ratings': [5.0, 4.5, 4.0],
  },
  {
  'name': 'Navaratna',
  'cuisine': 'Indian',
  'ratings': [4.0, 4.5, 4.0],
  },
  ];


  for (var i = 0; i < restaurants.length; i++) {
    List<double> my=restaurants[i]["ratings"];
    double sumli=  sum(my)/my.length;
    restaurants[i]["avgRating"]=sumli;
    
  }
  print(restaurants);
}



double sum(var num){
  double sum=0;
  num.forEach((element) { sum+=element;});
  return sum;
}