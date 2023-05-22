// import dos pacotes
import 'package:equatable/equatable.dart';

class PokemonStatEntity extends Equatable{

  final String attribute;
  final int value;

  const PokemonStatEntity( this.attribute, this.value );

  String get attributeAbbreviation {
    Map<String, dynamic> values = {
      "hp": "HP",
      "attack": "ATK",
      "defense": "DEF",
      "special-attack": "SATK",
      "special-defense": "SDEF",
      "speed": "SPD",
    };

    return values[attribute] ?? attribute;
  }

  @override
  List<Object?> get props => [attribute, value];

}