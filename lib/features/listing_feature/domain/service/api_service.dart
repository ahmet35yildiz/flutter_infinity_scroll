import 'package:dio/dio.dart';
import 'package:pokemon_infinity/features/listing_feature/data/model/pokemon_response_model.dart';
import 'package:pokemon_infinity/features/listing_feature/data/model/pokemon_results_model.dart';

import '../../../../injector.dart';

class ApiService{
  final dio = injector<Dio>();

  Future<List<PokemonResultsModel>> parsePokemon(Map<String, dynamic> response) async {
    return PokemonResponseModel.fromJson(response).pokemonResults;
  }

  Future<List<PokemonResultsModel>> loadPokemonList({String? itemCounter,String? offset}) async {
    try {
      var response = await dio.get("https://pokeapi.co/api/v2/pokemon?offset=${offset}&limit=${itemCounter}");
      print(response.data);
      return parsePokemon(response.data);

    } catch (e) {
      throw Exception(e);
    }
  }
}