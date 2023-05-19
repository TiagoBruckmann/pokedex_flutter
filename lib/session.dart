// imports nativos do flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:pokedex/app/core/services/shared.dart';

class Session {

  static GlobalKey<NavigatorState> globalContext = GlobalKey<NavigatorState>();

  static final SharedServices sharedServices = SharedServices();

}