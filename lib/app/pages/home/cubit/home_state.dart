part of 'home_cubit.dart';

abstract class HomeCubitState extends Equatable {
  const HomeCubitState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeCubitState {
  const HomeInitial();
}

class HomeStateLoading extends HomeCubitState {
  const HomeStateLoading();
}

class HomeStateLoaded extends HomeCubitState {
  const HomeStateLoaded( this.listPokemon );
  final List<PokemonEntity> listPokemon;

  @override
  List<Object?> get props => [listPokemon];
}

class HomeStateError extends HomeCubitState {
  const HomeStateError({ required this.message });
  final String message;

  @override
  List<Object?> get props => [message];
}