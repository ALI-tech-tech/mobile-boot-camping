import 'Bucket.dart';

import 'Cup.dart';
import 'Volume.dart';
import 'manageprint.dart';

class Vessel  implements Manageprint {
  Volume? volume;
  String get liquidType => "Cofee";

  Vessel({required this.volume});
  factory Vessel.factory(personStatus status){
    if (status==personStatus.rested) {
      return Cup(volume: Volume(quantity: 1, unit: "Cup"));
    }else if(status==personStatus.sleepy){
      return Bucket(volume: Volume(quantity: 1, unit: "liter bucket"));
    }
    else
    return Bucket(volume: Volume(quantity: 2, unit: "liter bucket"));
  }
  
  
  @override
  ToString() {

    return("${volume!.ToString()}of ${liquidType}");
  }

}

enum personStatus { rested, sleepy, barelyAlive }
