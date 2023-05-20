// import dos domain
import 'package:pokedex/domain/repositories/pokemon_repo.dart';
import 'package:pokedex/domain/failures/failure.dart';

// import dos data
import 'package:pokedex/data/datasource/pokemon_remote_datasource.dart';
import 'package:pokedex/data/exceptions/exceptions.dart';
import 'package:pokedex/data/models/pokemon_model.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class PokemonRepoImpl implements PokemonRepo {
  final PokemonRemoteDatasource pokemonRemoteDatasource;
  PokemonRepoImpl(this.pokemonRemoteDatasource);

  @override
  Future<Either<Failure, List<PokemonModel>>> getPokemon({ int? id }) async {
    try {
      final result = await pokemonRemoteDatasource.getPokemon(id: id);
      return right(result);
    } on ServerExceptions {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

}