// import dos domain
import 'package:pokedex/domain/entities/pokemon.dart';

// import dos data
import 'package:pokedex/data/models/pokemon_stat_model.dart';
import 'package:pokedex/data/models/pokemon_type_model.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class PokemonModel extends PokemonEntity with EquatableMixin {

  PokemonModel( int id, String name, String image, List<PokemonTypeModel>? types, double? height, double? weight, List<PokemonStatModel>? stats ) : super(id, name, image, types, height, weight, stats);

  factory PokemonModel.fromJson( Map<String, dynamic> json ) {

    int idParse = int.parse(json["url"].toString().split("/pokemon/")[1].replaceAll("/", ""));
    List<PokemonTypeModel> listTypes = [];
    if ( json["types"] != null ) {
      for ( final item in json["types"] ) {
        listTypes.add(
          PokemonTypeModel.fromJson(item),
        );
      }
    }

    List<PokemonStatModel> listStats = [];
    if ( json["stats"] != null ) {
      for ( final item in json["stats"] ) {
        listStats.add(
          PokemonStatModel.fromJson(item),
        );
      }
    }

    return PokemonModel(
      idParse,
      json["name"],
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$idParse.png",
      listTypes, // types
      json["height"],
      json["weight"],
      listStats, // stats
    );
  }

  @override
  String toString() => name;
}