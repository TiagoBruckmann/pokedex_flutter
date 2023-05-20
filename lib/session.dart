// imports nativos do flutter
import 'package:flutter/material.dart';

// imports das telas
import 'package:pokedex/app/core/services/shared.dart';

// import dos domain
import 'package:pokedex/domain/source/remote/credentials.dart';

class Session {

  static GlobalKey<NavigatorState> globalContext = GlobalKey<NavigatorState>();

  static final SharedServices sharedServices = SharedServices();
  static final Credentials credentials = Credentials();

}