// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:pokedex/session.dart';

// import das telas
import 'package:pokedex/app/core/widgets/loading_connection.dart';
import 'package:pokedex/app/core/widgets/pokedex_card.dart';
import 'package:pokedex/app/pages/home/mobx/pokemon.dart';

// import dos domain
import 'package:pokedex/domain/source/local/mobx/connection/connection.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final PokemonEntity pokemon;
  const DetailPage({ Key? key, required this.pokemon }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  final PokemonMobx _mobx = PokemonMobx();
  late ConnectionMobx _connectionMobx;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _connectionMobx = Provider.of<ConnectionMobx>(context);

    await _mobx.getPokemon(widget.pokemon.id);
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Observer(
      builder: (builder) {

        return Scaffold(
          backgroundColor: theme.colorScheme.secondary,
          appBar: AppBar(
            title: Text(
              widget.pokemon.name,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only( right: 16 ),
                child: Text(
                  "# ${widget.pokemon.id}",
                  style: TextStyle(
                    color: theme.scaffoldBackgroundColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          body: ( !Session.sharedServices.validateConnection(_connectionMobx) )
          ? const LoadingConnection()
          : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [

                    PokedexCardWidget(
                      body: PokedexCardWidget(
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                for ( final types in _mobx.pokemon!.types! )
                                  Padding(
                                    padding: const EdgeInsets.only( right: 10 ),
                                    child: RawChip(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular( 20 ),
                                      ),
                                      label: Text(
                                        types.type,
                                      ),
                                    ),
                                  ),

                              ],
                            ),

                            Text(
                              "Sobre",
                              style: theme.textTheme.displayMedium,
                            ),

                            Row(
                              children: [

                                Expanded(
                                  child: ListTile(
                                    leading: const FaIcon(
                                      FontAwesomeIcons.weightHanging,
                                    ),
                                    title: Text(
                                      "${_mobx.pokemon!.weight} KG",
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    subtitle: Text(
                                      "Peso",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ),
                                ),

                                VerticalDivider(),

                                Expanded(
                                  child: ListTile(
                                    leading: const FaIcon(
                                      FontAwesomeIcons.rulerVertical,
                                    ),
                                    title: Text(
                                      "${_mobx.pokemon!.height} m",
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    subtitle: Text(
                                      "Altura",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ),
                                ),

                                /*
                                VerticalDivider(),

                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      _mobx.pokemon!.abilities![0].ability,
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    subtitle: Text(
                                      "Habilidades",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ),
                                ),
                                */

                              ],
                            ),

                            Text(
                              "Status e poderes",
                              style: theme.textTheme.displayMedium,
                            ),

                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 15,
                      child: Image.network(
                        _mobx.pokemon!.image,
                        height: 200,
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        );

      },
    );
  }
}
