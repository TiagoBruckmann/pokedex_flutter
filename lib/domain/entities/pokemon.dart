// import dos domain
import 'package:pokedex/domain/entities/pokemon_abilities.dart';
import 'package:pokedex/domain/entities/pokemon_stat.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {

  final int id;
  final String name, image;
  final List<PokemonTypeEntity>? types;
  final int? height, weight;
  final List<PokemonStatEntity>? stats;
  final List<PokemonAbilitiesEntity>? abilities;

  const PokemonEntity( this.id, this.name, this.image, this.types, this.height, this.weight, this.stats, this.abilities );

  @override
  List<Object?> get props => [id, name, image, types, height, weight, stats, abilities];
}