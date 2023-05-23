// imports globais
import 'package:pokedex/session.dart';

// import dos test
import 'pokemon_remote_datasource_test.mocks.dart';

// import dos data
import 'package:pokedex/data/datasource/pokemon_remote_datasource.dart';
import 'package:pokedex/data/exceptions/exceptions.dart';
import 'package:pokedex/data/models/pokemon_model.dart';

// import dos pacotes
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('PokemonRemoteDatasource', () {

    final mockClient = MockClient();
    final pokemonRemoteDataSourceTest = PokemonRemoteDatasourceImpl(mockClient);

    // list
    group("should return a List<PokemonModel>", () {
      test("When client response was 200 and has valid data", () async {

        const responseBody = '''{
          "count": 1281,
          "next": "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20",
          "previous": null,
          "results": [
            {
            "name": "bulbasaur",
            "url": "https://pokeapi.co/api/v2/pokemon/1/"
            },
            {
            "name": "ivysaur",
            "url": "https://pokeapi.co/api/v2/pokemon/2/"
            },
            {
            "name": "venusaur",
            "url": "https://pokeapi.co/api/v2/pokemon/3/"
            }
          ]
        }''';

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
          mockClient.get(
            Uri.parse(Session.credentials.url),
            headers: {
              "content-Type": "application/json",
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(
          Response(responseBody, 200),
        ));

        final result = await pokemonRemoteDataSourceTest.getListPokemon();

        expect(result, listPokemon);

      });
    });

    group('should throw', () {
      test('A serverException when Client response was not 200 and has no valid data', () {

        when(
          mockClient.get(
            Uri.parse(Session.credentials.url),
            headers: {
              "content-Type": "application/json",
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(
          Response('', 404),
        ));

        expect(pokemonRemoteDataSourceTest.getListPokemon(), throwsA(isA<ServerExceptions>()));

      });
    });

    /*
    // detail
    group("should return a PokemonModel", () {
      test("When client response was 200 and has valid data", () async {

        const responseBody = '''{
          "count": 1281,
          "next": "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20",
          "previous": null,
          "results": [
            {
            "name": "bulbasaur",
            "url": "https://pokeapi.co/api/v2/pokemon/1/"
            },
            {
            "name": "ivysaur",
            "url": "https://pokeapi.co/api/v2/pokemon/2/"
            },
            {
            "name": "venusaur",
            "url": "https://pokeapi.co/api/v2/pokemon/3/"
            }
          ]
        }''';

        when(
          mockClient.get(
            Uri.parse(Session.credentials.url),
            headers: {
              "content-Type": "application/json",
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(
          Response(responseBody, 200),
        ));

        final result = await pokemonRemoteDataSourceTest.getListPokemon();

        expect(result, listPokemon);

      });
    });
     */

    /*
    group('should throw', () {
      test('A serverException when Client response was not 200 and has no valid data', () {

        when(
          mockClient.get(
            Uri.parse(Session.credentials.url),
            headers: {
              "content-Type": "application/json",
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(
          Response('', 404),
        ));

        expect(pokemonRemoteDataSourceTest.getPokemon(150), throwsA(isA<ServerExceptions>()));

      });
    });
    */

  });
}