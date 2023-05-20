// imports nativos
import 'dart:convert';

// imports globais
import 'package:pokedex/session.dart';

// import dos data
import 'package:pokedex/data/exceptions/exceptions.dart';
import 'package:pokedex/data/models/pokemon_model.dart';

// import dos pacotess
import 'package:http/http.dart' as http;

abstract class PokemonRemoteDatasource {

  Future<List<PokemonModel>> getPokemon({ int? id });

}

class PokemonRemoteDatasourceImpl implements PokemonRemoteDatasource {
  final http.Client client;
  PokemonRemoteDatasourceImpl( this.client );

  @override
  Future<List<PokemonModel>> getPokemon({ int? id }) async {

    Map<String, String> header = {
      "content-Type": "application/json",
    };

    Uri url = Uri.parse(Session.credentials.url);
    if ( id != null ) {
      url = Uri.parse("${Session.credentials.url}/$id");
    }

    final response = await client.get(
      url,
      headers: header,
    );

    if ( response.statusCode != 200 ) {
      throw ServerExceptions();
    }

    final responseBody = jsonDecode(response.body);

    final List<PokemonModel> list = [];
    for ( final item in responseBody["results"] )  {
      list.add(
        PokemonModel.fromJson(item),
      );
    }

    return list;
  }

}