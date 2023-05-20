// import dos pacotes
import 'package:equatable/equatable.dart';

class PokemonStatEntity extends Equatable{

  final String attribute;
  final double value;

  const PokemonStatEntity( this.attribute, this.value );

  @override
  List<Object?> get props => [attribute, value];

}