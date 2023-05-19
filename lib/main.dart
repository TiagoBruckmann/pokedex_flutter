// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:pokedex/session.dart';

// import dos app
import 'package:pokedex/app/core/services/languages.dart';
import 'package:pokedex/app/core/routes/routes.dart';
import 'package:pokedex/app/core/style/themes.dart';

// import dos domain
import 'package:pokedex/domain/source/local/mobx/connection/connection.dart';

// import dos pacotes
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // configureDependencies();

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => ConnectionMobx(),
        ),
        /*
        Provider(
          create: (context) => CategoriesMobx(),
        ),
        */
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