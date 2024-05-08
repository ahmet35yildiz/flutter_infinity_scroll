import '../../../../injector.dart';
import '../service/api_service.dart';

class PokemonRepository {
  final apiService = injector<ApiService>();

  Future loadPokemonList({String? itemCounter,String? offset}) async {
    return await apiService.loadPokemonList(itemCounter: itemCounter, offset: offset);
  }
}