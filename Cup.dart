import 'Vessel.dart';

import 'manageprint.dart';

class Cup extends Vessel implements Manageprint {
  Cup({required super.volume});
 

  @override
  ToString() {

    return("${volume!.ToString()} of ${liquidType}");
  }
}