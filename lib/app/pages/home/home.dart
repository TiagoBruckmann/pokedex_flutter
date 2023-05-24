// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:pokedex/session.dart';

// import das telas
import 'package:pokedex/app/pages/home/widgets/loading_pokemon.dart';
import 'package:pokedex/app/core/widgets/loading_connection.dart';
import 'package:pokedex/app/pages/home/cubit/home_cubit.dart';
import 'package:pokedex/app/core/widgets/pokedex_card.dart';
import 'package:pokedex/app/core/style/app_images.dart';

// import dos domain
import 'package:pokedex/domain/source/local/mobx/connection/connection.dart';
import 'package:pokedex/domain/source/local/injection/injection.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

// import dos pacotes
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Session.appEvents.sendScreen("home");
    final connectionMobx = Provider.of<ConnectionMobx>(context);
    connectionMobx.connectivity.onConnectivityChanged.listen(connectionMobx.updateConnectionStatus);
    final ThemeData theme = Theme.of(context);

    return Observer(
      builder: (builder) {

        return Scaffold(
          backgroundColor: theme.colorScheme.secondary,
          appBar: AppBar(
            toolbarHeight: 70,
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.secondary,
              child: Image.asset(
                AppImages.pokeBall,
                width: 30,
              ),
            ),
            title: Text(
              FlutterI18n.translate(builder, "app_name"),
              style: theme.textTheme.headlineLarge,
            ),
          ),
          body: ( !Session.sharedServices.validateConnection(connectionMobx) )
          ? const LoadingConnection()
          : BlocProvider(
            create: (create) => getIt<HomeCubit>(),
            child: BlocBuilder<HomeCubit, HomeCubitState>(
              builder: ( blocBuilder, state ) {

                final bloc = BlocProvider.of<HomeCubit>(blocBuilder);

                if ( !bloc.isLoaded ) {
                  clearPagination();
                  bloc.scrollController.addListener(() {
                    if ( bloc.scrollController.position.maxScrollExtent == bloc.scrollController.position.pixels ) {
                      bloc.loadMore();
                    }
                  });
                  bloc.getPokemon();
                }

                if ( state is HomeInitial || state is HomeStateLoading ) {
                  return const LoadingPokemonWidget();
                }

                if ( state is HomeStateError || bloc.listPokemon.isEmpty ) {
                  return PokedexCardWidget(
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Image.asset(
                          AppImages.darkrai,
                          height: 150,
                        ),

                        Padding(
                          padding: const EdgeInsets.only( top: 15 ),
                          child: Text(
                            FlutterI18n.translate(blocBuilder, "routes.empty"),
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),

                      ],
                    ),
                  );
                }

                return PokedexCardWidget(
                  body: RefreshIndicator(
                    onRefresh: () => bloc.refresh(),
                    child: GridView.builder(
                      controller: bloc.scrollController,
                      itemCount: bloc.listPokemon.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: ( itemBuilder, index ) {

                        PokemonEntity pokemon = bloc.listPokemon[index];

                        return GestureDetector(
                          onTap: () => bloc.goToDetail(pokemon),
                          child: Card(
                            shadowColor: Colors.grey,
                            child: GridTile(
                              header: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                                child: Text(
                                  "# ${pokemon.id}",
                                  textAlign: TextAlign.end,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                              footer: GridTileBar(
                                backgroundColor: theme.colorScheme.primary.withOpacity(0.8),
                                title: Text(
                                  pokemon.name,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                              child: Image.network(
                                pokemon.image,
                              ),
                            ),
                          ),
                        );

                      },
                    ),
                  ),
                );

              },
            ),
          ),
        );

      },
    );
  }
}


