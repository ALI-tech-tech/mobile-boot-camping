void main(List<String> args) {
  const pizzaPrices = {
  'margherita': 5.5,
  'pepperoni': 7.5,
  'vegetarian': 6.5,
  };

  const order = ['margherita', 'pepperoni'];
  double sum=0;
  for (var i = 0; i < order.length; i++) {
    sum+=pizzaPrices[order[i]]!;
  }
  print(" \$"+"$sum");
}