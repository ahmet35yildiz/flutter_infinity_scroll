import 'dart:ffi';

import 'package:pokemon_infinity/features/listing_feature/data/model/pokemon_results_model.dart';

class PokemonResponseModel {
  String next;
  String? previous;
  List<PokemonResultsModel> pokemonResults;

  PokemonResponseModel(
      {
      required this.next,
      required this.previous,
      required this.pokemonResults});

  factory PokemonResponseModel.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["results"] as List;
    String next = json["next"] as String;
    String? previous = json["previous"] as String?;

    var pokemonResults = jsonArray
        .map((jsonArrayObject) => PokemonResultsModel.fromJson(jsonArrayObject))
        .toList();

    return PokemonResponseModel(
        next: next,
        previous: previous,
        pokemonResults: pokemonResults);
  }
}