// import dos domain
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/source/local/injection/injection.dart';
import 'package:pokedex/domain/usecases/pokemons_usecase.dart';

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

    final failureOrPokemon = await useCase.getPokemon(id);

    failureOrPokemon.fold(
      (failure) => print("Deu ruim nos detalhes => ${failure.message}"),
      (success) => setPokemon(success),
    );

  }

  @action
  void setPokemon( PokemonEntity pokemonEntity ) => pokemon = pokemonEntity;
}