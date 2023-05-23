// imports nativos
import 'dart:io';

// import dos testes
import 'pokemon_repo_impl_test.mocks.dart';

// import dos domain
import 'package:pokedex/domain/failures/failure.dart';

// import dos data
import 'package:pokedex/data/datasource/pokemon_remote_datasource.dart';
import 'package:pokedex/data/repositories/pokemon_repo_impl.dart';
import 'package:pokedex/data/models/pokemon_abilities_model.dart';
import 'package:pokedex/data/models/pokemon_stat_model.dart';
import 'package:pokedex/data/models/pokemon_type_model.dart';
import 'package:pokedex/data/exceptions/exceptions.dart';
import 'package:pokedex/data/models/pokemon_model.dart';

// import dos pacotes
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<PokemonRemoteDatasourceImpl>()])
void main() {

  group('PokemonRepoImpl', () {

    final mockPokemonRemoteDatasource = MockPokemonRemoteDatasourceImpl();
    final pokemonRepoImplTest = PokemonRepoImpl(mockPokemonRemoteDatasource);

    // list
    group('should return List<PokemonModel>', () {

      test('when pokemonRemoteDatasource return a List<PokemonModel>', () async {

        List<PokemonModel> listPokemon = [
          PokemonModel(
            1,
            "bulbasaur",
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
            const [],
            null,
            null,
            const [],
            const [],
          ),
          PokemonModel(
            2,
            "ivysaur",
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png",
            const [],
            null,
            null,
            const [],
            const [],
          ),
          PokemonModel(
            3,
            "venusaur",
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png",
            const [],
            null,
            null,
            const [],
            const [],
          ),
        ];

        when(
          mockPokemonRemoteDatasource.getListPokemon(),
        ).thenAnswer(
          (realInvocation) => Future.value(listPokemon),
        );

        final result = await pokemonRepoImplTest.getListPokemon();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, List<PokemonModel>>(listPokemon));
        verify(mockPokemonRemoteDatasource.getListPokemon()).called(1);
        verifyNoMoreInteractions(mockPokemonRemoteDatasource);

      });

    });

    group('should return left with', () {

      test('A serverFailure when a ServerException occurs', () async {

        when(
          mockPokemonRemoteDatasource.getListPokemon(),
        ).thenThrow(ServerExceptions());

        final result = await pokemonRepoImplTest.getListPokemon();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, List<PokemonModel>>(ServerFailure()));

      });

      test('A GeneralFailure on all another exceptions', () async {

        when(
          mockPokemonRemoteDatasource.getListPokemon(),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await pokemonRepoImplTest.getListPokemon();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, List<PokemonModel>>(GeneralFailure()));

      });

    });

    // detail
    group('should return a PokemonModel', () {

      test('when pokemonRemoteDatasource return a PokemonModel', () async {

        PokemonModel pokemonModel = PokemonModel(
          150,
          "mewtwo",
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png",
          [
            PokemonTypeModel(1, "psychic"),
          ],
          20,
          1220,
          [
            PokemonStatModel("hp", 106),
            PokemonStatModel("attack", 110),
            PokemonStatModel("defense", 90),
            PokemonStatModel("special-attack", 154),
            PokemonStatModel("special-defense", 90),
            PokemonStatModel("speed", 130),
          ],
          [
            PokemonAbilitiesModel("pressure"),
            PokemonAbilitiesModel("unnerve"),
          ],
        );

        when(
          mockPokemonRemoteDatasource.getPokemon(150),
        ).thenAnswer(
          (realInvocation) => Future.value(pokemonModel),
        );

        final result = await pokemonRepoImplTest.getPokemon(150);

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, PokemonModel>(pokemonModel));
        verify(mockPokemonRemoteDatasource.getPokemon(150)).called(1);

      });

    });

    group('should return left with', () {

      test('A serverFailure when a ServerException occurs', () async {

        when(
          mockPokemonRemoteDatasource.getPokemon(150),
        ).thenThrow(ServerExceptions());

        final result = await pokemonRepoImplTest.getPokemon(150);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, PokemonModel>(ServerFailure()));

      });

      test('A GeneralFailure on all another exceptions', () async {

        when(
          mockPokemonRemoteDatasource.getPokemon(150),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await pokemonRepoImplTest.getPokemon(150);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, PokemonModel>(GeneralFailure()));

      });

    });

  });

}