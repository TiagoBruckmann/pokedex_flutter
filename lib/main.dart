// imports nativos
import 'package:flutter/material.dart';
import 'dart:ui';

// imports globais
import 'package:pokedex/session.dart';

// import dos app
import 'package:pokedex/app/core/services/languages.dart';
import 'package:pokedex/app/core/routes/routes.dart';
import 'package:pokedex/app/core/style/themes.dart';

// import dos domain
import 'package:pokedex/domain/source/local/mobx/connection/connection.dart';
import 'package:pokedex/domain/source/local/injection/injection.dart';

// import dos pacotes
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = ( error, stackTrace ) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    return true;
  };
  FirebasePerformance.instance;

  configureDependencies();

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => ConnectionMobx(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: Session.globalContext,
        title: "Pokédex",
        theme: Themes.lightTheme,
        onGenerateRoute: Routes.generateRoutes,
        initialRoute: "/splash",
        supportedLocales: supportedLocale,
        localizationsDelegates: localizationsDelegate,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}