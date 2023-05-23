// import dos domains
import 'package:pokedex/domain/source/local/mobx/connection/connection.dart';

// import dos pacotes
import 'package:connectivity_plus/connectivity_plus.dart';

class SharedServices {

  bool validateConnection( ConnectionMobx connectionMobx ) {
    if ( connectionMobx.connectionStatus == ConnectivityResult.wifi || connectionMobx.connectionStatus == ConnectivityResult.mobile ) {
      return true;
    }
    return false;
  }

  String convertValue( int oldValue ) {
    String newValue = "";
    if ( oldValue.toString().length == 1 ) {
      newValue = "0.$oldValue";
    } else if ( oldValue.toString().length == 2 ) {
      newValue = "${oldValue.toString().substring(0, 1)}.${oldValue.toString().substring(1)}";
    } else if ( oldValue.toString().length == 3 ) {
      newValue = "${oldValue.toString().substring(0, 2)}.${oldValue.toString().substring(2)}";
    } else if ( oldValue.toString().length == 4 ) {
      newValue = "${oldValue.toString().substring(0, 3)}.${oldValue.toString().substring(3)}";
    } else {
      newValue = "${oldValue.toString().substring(0, 4)}.${oldValue.toString().substring(4)}";
    }

    return newValue;
  }

}