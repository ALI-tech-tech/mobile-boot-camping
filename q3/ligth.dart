import 'swetchstate.dart';

class Light implements Swetchstate {
  bool swetch=false;

  @override
  swetching() {
    this.swetch=!swetch;
    this.printstate();
  }
  printstate(){
    print("The light switch is ${this.swetch?"on":"off"}");
  }
}