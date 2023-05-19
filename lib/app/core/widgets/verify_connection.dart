// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:pokedex/session.dart';

// import das telas
import 'package:pokedex/app/core/widgets/loading_connection.dart';

// import dos domain
import 'package:pokedex/domain/source/local/mobx/connection/connection.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class VerifyConnection extends StatelessWidget {

  final String keyAppBar;
  final Map<String, String>? appBarParams;
  final Widget page;
  const VerifyConnection({ Key? key, required this.keyAppBar, this.appBarParams, required this.page }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final connectionMobx = Provider.of<ConnectionMobx>(context);
    connectionMobx.connectivity.onConnectivityChanged.listen(connectionMobx.updateConnectionStatus);
    final ThemeData theme = Theme.of(context);

    return Observer(
      builder: (builder) {

        return Scaffold(
          appBar: ( keyAppBar.trim().isEmpty )
          ? null
          : AppBar(
            title: Text(
              FlutterI18n.translate(context, keyAppBar, translationParams: appBarParams),
            ),
          ),
          body: ( !Session.sharedServices.validateConnection(connectionMobx) )
          ? const LoadingConnection()
          : page,
        );

      },
    );
  }
}