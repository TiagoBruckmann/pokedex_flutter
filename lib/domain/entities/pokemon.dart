// import dos domain
import 'package:pokedex/domain/entities/pokemon_stat.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {

  final int id;
  final String name, image;
  final List<PokemonTypeEntity>? types;
  final double? height, weight;
  final List<PokemonStatEntity>? stats;

  const PokemonEntity( this.id, this.name, this.image, this.types, this.height, this.weight, this.stats );

  @override
  List<Object?> get props => [id, name, image, types, height, weight, stats];
}