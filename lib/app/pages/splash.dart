// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

// import das telas
import 'package:pokedex/app/core/style/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        "/",
        (route) => false,
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Image.asset(
            AppImages.logo,
            width: 150,
          ),
        ),
      ),
    );
  }
}