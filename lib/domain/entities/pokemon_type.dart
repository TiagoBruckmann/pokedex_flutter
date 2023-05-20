// import dos pacotes
import 'package:equatable/equatable.dart';

class PokemonTypeEntity extends Equatable {

  final int slot;
  final String type;

  const PokemonTypeEntity( this.slot, this.type );

  @override
  List<Object?> get props => [slot, type];

}