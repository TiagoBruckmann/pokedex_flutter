// import dos pacotes
import 'package:equatable/equatable.dart';

class PokemonAbilitiesEntity extends Equatable{

  final String ability;

  const PokemonAbilitiesEntity( this.ability );

  @override
  List<Object?> get props => [ability];

}