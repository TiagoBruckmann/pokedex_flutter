// imports nativos
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// imports globais
import 'package:pokedex/session.dart';

// import das telas
import 'package:pokedex/app/pages/home/widgets/loading_detail.dart';
import 'package:pokedex/app/core/widgets/loading_connection.dart';
import 'package:pokedex/app/core/widgets/pokedex_card.dart';
import 'package:pokedex/app/pages/home/mobx/pokemon.dart';
import 'package:pokedex/app/core/style/app_colors.dart';
import 'package:pokedex/app/core/style/app_images.dart';

// import dos domain
import 'package:pokedex/domain/source/local/mobx/connection/connection.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
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
  void initState() {
    super.initState();
    Session.appEvents.sendScreen("detail");
  }

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

        return ( _mobx.pokemon == null )
        ? LoadingDetail(
          pokemon: widget.pokemon,
        )
        : Scaffold(
          backgroundColor: _mobx.pokemon?.primaryColor,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: _mobx.pokemon?.primaryColor
            ),
            title: Text(
              _mobx.pokemon?.name ?? widget.pokemon.name,
            ),
            backgroundColor: _mobx.pokemon?.primaryColor,
            actions: [
              Padding(
                padding: const EdgeInsets.only( right: 16 ),
                child: Text(
                  "# ${_mobx.pokemon?.id ?? widget.pokemon.id}",
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
          : Container(
            decoration: BoxDecoration(
              color: _mobx.pokemon!.primaryColor,
              image: DecorationImage(
                image: AssetImage(AppImages.pokeBall),
                fit: BoxFit.scaleDown,
                alignment: Alignment.topRight,
                scale: 1.5,
                opacity: 98,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only( top: 155 ),
                        child: PokedexCardWidget(
                          body: Padding(
                            padding: const EdgeInsets.only( top: 35 ),
                            child: Column(
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
                                          backgroundColor: types.color,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular( 20 ),
                                          ),
                                          label: Text(
                                            types.type,
                                            style: theme.textTheme.displaySmall!.apply(color: theme.scaffoldBackgroundColor),
                                          ),
                                        ),
                                      ),

                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric( vertical: 16 ),
                                  child: Text(
                                    FlutterI18n.translate(context, "pages.detail.about"),
                                    style: theme.textTheme.displayMedium!.apply( color: _mobx.pokemon!.primaryColor ),
                                  ),
                                ),

                                Row(
                                  children: [

                                    Expanded(
                                      flex: 2,
                                      child: ListTile(
                                        title: Text(
                                          "${Session.sharedServices.convertValue(_mobx.pokemon!.weight!)} KG",
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                        subtitle: Text(
                                          FlutterI18n.translate(context, "pages.detail.weight"),
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 2,
                                      child: ListTile(
                                        title: Text(
                                          "${Session.sharedServices.convertValue(_mobx.pokemon!.height!)} m",
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                        subtitle: Text(
                                          FlutterI18n.translate(context, "pages.detail.height"),
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 3,
                                      child: ListTile(
                                        title: Column(
                                          children: [
                                            for ( final item in _mobx.pokemon!.abilities! )
                                              Text(
                                                item.ability,
                                                style: theme.textTheme.bodySmall,
                                                textAlign: TextAlign.center,
                                              ),
                                          ],
                                        ),
                                        subtitle: Text(
                                          FlutterI18n.translate(context, "pages.detail.abilities"),
                                          style: theme.textTheme.bodyMedium,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric( vertical: 15 ),
                                  child: Text(
                                    FlutterI18n.translate(context, "pages.detail.stats"),
                                    style: theme.textTheme.displayMedium!.apply( color: _mobx.pokemon!.primaryColor ),
                                  ),
                                ),

                                for ( final item in _mobx.pokemon!.stats! )
                                  ListTile(
                                    leading: Text(
                                      item.attributeAbbreviation,
                                      style: theme.textTheme.displaySmall!.apply( color: _mobx.pokemon!.primaryColor ),
                                    ),
                                    title: LinearProgressIndicator(
                                      minHeight: 5,
                                      value: item.value / 250,
                                      color: _mobx.pokemon!.primaryColor,
                                      backgroundColor: _mobx.pokemon!.primaryColor.withOpacity(0.25),
                                    ),
                                  ),

                              ],
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 80,
                        child: TextButton(
                          onPressed: () => _mobx.getPokemon(_mobx.pokemon!.id - 1),
                          child: const FaIcon(
                            FontAwesomeIcons.circleArrowLeft,
                            color: AppColors.white,
                            size: 25,
                          ),
                        ),
                      ),

                      Positioned(
                        top: 80,
                        right: 0,
                        child: TextButton(
                          onPressed: () => _mobx.getPokemon(_mobx.pokemon!.id + 1),
                          child: const FaIcon(
                            FontAwesomeIcons.circleArrowRight,
                            color: AppColors.white,
                            size: 25,
                          ),
                        ),
                      ),

                      Positioned(
                        top: 8,
                        child: Center(
                          widthFactor: 1.8,
                          child: Image.network(
                            _mobx.pokemon!.image,
                            height: 200,
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        );

      },
    );
  }
}
