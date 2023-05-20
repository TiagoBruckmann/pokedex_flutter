// import dos domain
import 'package:pokedex/data/models/pokemon_abilities_model.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

// import dos data
import 'package:pokedex/data/models/pokemon_stat_model.dart';
import 'package:pokedex/data/models/pokemon_type_model.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class PokemonModel extends PokemonEntity with EquatableMixin {

  PokemonModel( int id, String name, String image, List<PokemonTypeModel>? types, int? height, int? weight, List<PokemonStatModel>? stats, List<PokemonAbilitiesModel>? abilities ) : super(id, name, image, types, height, weight, stats, abilities);

  factory PokemonModel.fromJson( Map<String, dynamic> json, { int? pokemonId } ) {

    int idParse = pokemonId ?? int.parse(json["url"].toString().split("/pokemon/")[1].replaceAll("/", ""));
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

    List<PokemonAbilitiesModel> listAbilities = [];
    if ( json["abilities"] != null ) {
      for ( final item in json["abilities"] ) {
        listAbilities.add(
          PokemonAbilitiesModel.fromJson(item),
        );
      }
    }

    return PokemonModel(
      idParse,
      json["name"],
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$idParse.png",
      listTypes,
      json["height"],
      json["weight"],
      listStats,
      listAbilities,
    );
  }

  @override
  String toString() => name;
}