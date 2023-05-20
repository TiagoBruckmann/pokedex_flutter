// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonMobx on _PokemonMobx, Store {
  late final _$pokemonAtom =
      Atom(name: '_PokemonMobx.pokemon', context: context);

  @override
  PokemonEntity? get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(PokemonEntity? value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  late final _$getPokemonAsyncAction =
      AsyncAction('_PokemonMobx.getPokemon', context: context);

  @override
  Future<void> getPokemon(int id) {
    return _$getPokemonAsyncAction.run(() => super.getPokemon(id));
  }

  late final _$_PokemonMobxActionController =
      ActionController(name: '_PokemonMobx', context: context);

  @override
  void setPokemon(PokemonEntity pokemonEntity) {
    final _$actionInfo = _$_PokemonMobxActionController.startAction(
        name: '_PokemonMobx.setPokemon');
    try {
      return super.setPokemon(pokemonEntity);
    } finally {
      _$_PokemonMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemon: ${pokemon}
    ''';
  }
}
