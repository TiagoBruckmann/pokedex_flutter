// imports globais
import 'package:pokedex/session.dart';

// import dos domain
import 'package:pokedex/domain/source/local/injection/injection.dart';
import 'package:pokedex/domain/usecases/pokemon_usecase.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

// import dos pacotes
import 'package:mobx/mobx.dart';

part 'pokemon.g.dart';

class PokemonMobx extends _PokemonMobx with _$PokemonMobx {}

abstract class _PokemonMobx with Store {

  final PokemonUseCase useCase = PokemonUseCase(getIt());

  @observable
  PokemonEntity? pokemon;

  @action
  Future<void> getPokemon( int id ) async {

    if ( id == 1011 ) {
      id = 1;
    }

    if ( id == 0 ) {
      id = 1010;
    }

    final failureOrPokemon = await useCase.getPokemon(id);

    failureOrPokemon.fold(
      (failure) => Session.crash.onFailure(failure.message),
      (success) => setPokemon(success),
    );

  }

  @action
  void setPokemon( PokemonEntity pokemonEntity ) => pokemon = pokemonEntity;

}