// import dos domain
import 'package:pokedex/domain/entities/pokemon_stat.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class PokemonStatModel extends PokemonStatEntity with EquatableMixin {

  PokemonStatModel( String attribute, int value ) : super(attribute, value);

  factory PokemonStatModel.fromJson( Map<String, dynamic> json ) {
    return PokemonStatModel(
      json["stat"]["name"],
      json["base_stat"],
    );
  }

}