// import dos domain
import 'package:pokedex/domain/repositories/pokemon_repo.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/failures/failure.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class PokemonUseCase {
  final PokemonRepo pokemonRepo;
  PokemonUseCase( this.pokemonRepo );

  Future<Either<Failure, List<PokemonEntity>>> getListPokemon() async {
    return pokemonRepo.getListPokemon();
  }

  Future<Either<Failure, PokemonEntity>> getPokemon( int id ) async {
    return pokemonRepo.getPokemon(id);
  }

}