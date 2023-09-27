import 'swetchstate.dart';

class Lightmanage {
  late Swetchstate swetchstate;
  Lightmanage({required this.swetchstate});

 

  setState(){
    swetchstate.swetching();
    
  }
}