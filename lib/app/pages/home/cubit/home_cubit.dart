// imports globais
import 'package:flutter/material.dart';

// imports globais
import 'package:pokedex/session.dart';

// imports dos domain
import 'package:pokedex/domain/source/local/injection/injection.dart';
import 'package:pokedex/domain/usecases/pokemon_usecase.dart';
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
  final ScrollController scrollController = ScrollController();
  final List<PokemonEntity> listPokemon = [];
  bool isLoaded = false;

  Future<void> getPokemon() async {
    if ( nextPage == null && previousPage == null ) {
      emit(const HomeStateLoading());
    }

    // execute bussiness logic
    final failureOrList = await pokemonUseCase.getListPokemon();

    failureOrList.fold(
      (failure) => emit(HomeStateError(message: _mapFailureToMessage(failure))),
      (success) {
        isLoaded = true;
        emit(HomeStateLoaded(success));
        listPokemon.addAll(success);
      },
    );

  }

  Future<void> loadMore() async {
    if ( nextPage != null ) {
      if ( scrollController.position.maxScrollExtent == scrollController.position.pixels ) {
        await getPokemon();
      }
    }
  }

  Future<void> refresh() async {
    emit(const HomeStateLoading());
    Session.appEvents.sharedEvent("home_refresh");
    clearPagination();
    listPokemon.clear();
    await getPokemon();
  }

  void goToDetail( PokemonEntity pokemon ) {
    Session.appEvents.sharedEvent("home_open_detail");
    Navigator.pushNamed(
      Session.globalContext.currentContext!,
      "/detail",
      arguments: {
        "pokemon": pokemon,
      }
    );
  }

  String _mapFailureToMessage( Failure failure ) {
    Session.crash.onFailure(failure.message);
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