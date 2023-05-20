// import dos domain
import 'package:pokedex/domain/entities/pokemon_type.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class PokemonTypeModel extends PokemonTypeEntity with EquatableMixin {

  PokemonTypeModel( int slot, String type ) : super(slot, type);

  factory PokemonTypeModel.fromJson( dynamic json ) {
    return PokemonTypeModel(
      json["slot"],
      json["type"]["name"],
    );
  }

}