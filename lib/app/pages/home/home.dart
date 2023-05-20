// imports nativos
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/app/pages/home/cubit/home_cubit.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/source/local/injection/injection.dart';

// imports globais
import 'package:pokedex/session.dart';

// import das telas
import 'package:pokedex/app/core/widgets/loading_connection.dart';
import 'package:pokedex/app/core/style/app_images.dart';

// import dos domain
import 'package:pokedex/domain/source/local/mobx/connection/connection.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
              ),
            ),
            title: Text(
              FlutterI18n.translate(context, "app_name"),
              style: theme.textTheme.headlineLarge,
            ),
          ),
          body: ( !Session.sharedServices.validateConnection(connectionMobx) )
          ? const LoadingConnection()
          : BlocProvider(
            create: (create) => getIt<HomeCubit>(),
            child: BlocBuilder<HomeCubit, HomeCubitState>(
              builder: ( builder, state ) {

                final bloc = BlocProvider.of<HomeCubit>(builder);

                if ( !bloc.isLoaded ) {
                  bloc.getPokemon();
                }

                if ( state is HomeInitial || state is HomeStateLoading ) {
                  print("carregando => ");
                  return const CircularProgressIndicator();
                }

                if ( state is HomeStateError || bloc.listPokemon.isEmpty ) {
                  return Center(
                    child: Text(
                      "Nenhum pokemon encontrado, tente novamente!",
                      style: theme.textTheme.headlineLarge,
                    ),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 8 ),
                      child: RefreshIndicator(
                        onRefresh: () => bloc.refresh(),
                        child: GridView.builder(
                          itemCount: bloc.listPokemon.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: ( builder, index ) {

                            PokemonEntity pokemon = bloc.listPokemon[index];

                            return GestureDetector(
                              onTap: () => print("open id => ${pokemon.id}"),
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


