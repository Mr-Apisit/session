import 'dart:io';

import 'package:http/http.dart';

import '../models/network_model.dart';
import 'error_remote.dart';

String url = "https://my-json-server.typicode.com/Mr-Apisit/place-pokemon/pokemon";

abstract class PokemonRemote {
  Future<List<Pokemon>> fetchListPokemon();
}

class PokemonRemoteImpl extends PokemonRemote {
  @override
  Future<List<Pokemon>> fetchListPokemon() async {
    Pokemon pokemon = Pokemon();
    final client = Client();
    try {
      final response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = pokemon.pokemonFromJson(response.body);
        return data;
      } else {
        return [];
      }
    } on SocketException {
      throw NoInternetException('No Internet');
    } on HttpException {
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}
