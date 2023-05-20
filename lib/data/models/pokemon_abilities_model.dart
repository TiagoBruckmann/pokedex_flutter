// import dos domain
import 'package:pokedex/domain/entities/pokemon_abilities.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class PokemonAbilitiesModel extends PokemonAbilitiesEntity with EquatableMixin {

  PokemonAbilitiesModel( String ability ) : super(ability);

  factory PokemonAbilitiesModel.fromJson( Map<String, dynamic> json ) {
    return PokemonAbilitiesModel(
      json["ability"]["name"],
    );
  }

}