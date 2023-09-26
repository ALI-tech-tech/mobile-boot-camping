import 'manageprint.dart';

class Volume implements Manageprint{
  int? quantity;
  String? unit;
  Volume({required this.quantity, required this.unit});
  
  
  
  @override
  ToString() {
   
       return(' ${quantity} ${unit} ');
 
  }
 

}