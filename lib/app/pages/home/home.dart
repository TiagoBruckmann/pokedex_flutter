// imports nativos do flutter
import 'package:flutter/material.dart';

// import das telas
import 'package:pokedex/app/core/widgets/verify_connection.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerifyConnection(
      keyAppBar: "pages.home.app_bar",
      page: Center(
        child: Text(
          FlutterI18n.translate(context, "pages.home.app_bar"),
        ),
      ),
    );
  }
}
