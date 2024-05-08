class PokemonResultsModel {
  String name;
  String url;

  PokemonResultsModel({required this.name, required this.url});

  factory PokemonResultsModel.fromJson(Map<String, dynamic> json) {
    return PokemonResultsModel(
      name: json["name"] as String,
      url: json["url"] as String,
    );
  }
}
