// imports nativos
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import dos pacotes
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class Crash {
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  void onFailure( String errorMessage ) {
    _crashlytics.log(errorMessage);
  }

  void log( PlatformException exception ) {
    _crashlytics.log("${exception.code} - ${exception.details}");
    FlutterError.reportError(
      FlutterErrorDetails(
        exception: exception,
        library: "${exception.message}",
        context: ErrorSummary("${exception.details}"),
      ),
    );
  }

}