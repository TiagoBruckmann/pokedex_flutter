// import dos modelos
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/failures/failure.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

abstract class PokemonRepo {
  Future<Either<Failure, List<PokemonEntity>>> getListPokemon();
  Future<Either<Failure, PokemonEntity>> getPokemon( int id );
}