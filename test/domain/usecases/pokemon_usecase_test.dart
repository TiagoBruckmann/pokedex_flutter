// import dos testes
import 'pokemon_usecase_test.mocks.dart';

// import dos domain
import 'package:pokedex/domain/usecases/pokemon_usecase.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/failures/failure.dart';

// import dos data
import 'package:pokedex/data/repositories/pokemon_repo_impl.dart';
import 'package:pokedex/data/models/pokemon_abilities_model.dart';
import 'package:pokedex/data/models/pokemon_stat_model.dart';
import 'package:pokedex/data/models/pokemon_type_model.dart';
import 'package:pokedex/data/models/pokemon_model.dart';

// import dos pacotes
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<PokemonRepoImpl>()])
void main() {

  group('PokemonUseCases', () {

    final mockPokemonRepoImpl = MockPokemonRepoImpl();
    final pokemonUseCaseTest = PokemonUseCase(mockPokemonRepoImpl);

    // list
    group('should return List<PokemonEntity>', () {

      test('when pokemonRepoImpl return a List<PokemonEntity>', () async {

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
          mockPokemonRepoImpl.getListPokemon(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Right( listPokemon ),
          ),
        );

        final result = await pokemonUseCaseTest.getListPokemon();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, List<PokemonEntity>>(listPokemon));
        verify(mockPokemonRepoImpl.getListPokemon()).called(1);

        verifyNoMoreInteractions(mockPokemonRepoImpl);

      });

    });

    group('should return left with', () {

      test('a ServerFailure', () async {

        when(
          mockPokemonRepoImpl.getListPokemon(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(ServerFailure()),
          ),
        );

        final result = await pokemonUseCaseTest.getListPokemon();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, List<PokemonEntity>>(ServerFailure()));
        verify(mockPokemonRepoImpl.getListPokemon()).called(1);
        verifyNoMoreInteractions(mockPokemonRepoImpl);

      });

      test('a GeneralFailure', () async {

        when(
          mockPokemonRepoImpl.getListPokemon(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(GeneralFailure()),
          ),
        );

        final result = await pokemonUseCaseTest.getListPokemon();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, List<PokemonEntity>>(GeneralFailure()));
        verify(mockPokemonRepoImpl.getListPokemon()).called(1);
        verifyNoMoreInteractions(mockPokemonRepoImpl);

      });

    });

    // details
    group('should return a PokemonEntity', () {

      test('when pokemonRepoImpl return a PokemonEntity', () async {

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
          mockPokemonRepoImpl.getPokemon(150),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Right( pokemonModel ),
          ),
        );

        final result = await pokemonUseCaseTest.getPokemon(150);

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, PokemonEntity>(pokemonModel));
        verify(mockPokemonRepoImpl.getPokemon(150)).called(1);

        verifyNoMoreInteractions(mockPokemonRepoImpl);

      });

    });

    group('should return left with', () {

      test('a ServerFailure', () async {

        when(
          mockPokemonRepoImpl.getPokemon(150),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(ServerFailure()),
          ),
        );

        final result = await pokemonUseCaseTest.getPokemon(150);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, PokemonEntity>(ServerFailure()));
        verify(mockPokemonRepoImpl.getPokemon(150)).called(1);
        verifyNoMoreInteractions(mockPokemonRepoImpl);

      });

      test('a GeneralFailure', () async {

        when(
          mockPokemonRepoImpl.getPokemon(150),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(GeneralFailure()),
          ),
        );

        final result = await pokemonUseCaseTest.getPokemon(150);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, PokemonEntity>(GeneralFailure()));
        verify(mockPokemonRepoImpl.getPokemon(150)).called(1);
        verifyNoMoreInteractions(mockPokemonRepoImpl);

      });

    });

  });

}