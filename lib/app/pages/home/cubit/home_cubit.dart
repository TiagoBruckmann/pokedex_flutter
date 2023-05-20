// imports globais
import 'package:flutter/material.dart';

// imports dos domain
import 'package:pokedex/domain/usecases/pokemons_usecase.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/failures/failure.dart';

// import dos pacotes
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

const generalFailureMessage = "Ups, something gone wrong. Please try again!";
const serverFailureMessage = "Ups, API error. Please try again!";
const cacheFailureMessage = "Ups, cache failed. Please try again";

class HomeCubit extends Cubit<HomeCubitState> {
  final PokemonUseCase pokemonUseCase;
  HomeCubit( this.pokemonUseCase ) : super(const HomeInitial());

  TextEditingController controllerSearch = TextEditingController();
  final List<PokemonEntity> listPokemon = [];
  bool isLoaded = false;

  void getPokemon() async {
    emit(const HomeStateLoading());
    listPokemon.clear();

    // execute bussiness logic
    final failureOrList = await pokemonUseCase.getPokemon();

    failureOrList.fold(
      (failure) => emit(HomeStateError(message: _mapFailureToMessage(failure))),
      (success) {
        isLoaded = true;
        emit(HomeStateLoaded(success));
        listPokemon.addAll(success);
      },
    );

  }

  Future<void> refresh() async {
    emit(const HomeStateLoading());
    getPokemon();
  }

  String _mapFailureToMessage( Failure failure ) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}