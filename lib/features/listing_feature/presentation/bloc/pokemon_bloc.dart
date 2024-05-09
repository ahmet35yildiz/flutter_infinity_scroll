import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../injector.dart';
import '../../data/model/pokemon_results_model.dart';
import '../../domain/repository/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<GetPokemonListEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<GetPokemonList>(_getPokemonList);
    on<GetMorePokemon>(_getMorePokemon);
  }
  final _pokemonRepository = injector<PokemonRepository>();
  List<PokemonResultsModel> newPokemons = [];

  Future <void> _getMorePokemon(

      GetMorePokemon event,
      Emitter<PokemonState> emit
      ) async {

    try {
      emit (PokemonLoading());

      final response = await _pokemonRepository.loadPokemonList(itemCounter: event.itemCounter, offset: event.offset);
      newPokemons.addAll(response);
      emit(PokemonSuccess(newPokemons));
    }catch (e,stackTrace){
      emit(PokemonError());
      print("hata: $e");
      print("hata stackTrace: $stackTrace");
    }
  }
  Future <void> _getPokemonList(

      GetPokemonList event,
      Emitter<PokemonState> emit
      ) async {
    try {
      emit (PokemonLoading());

      final response = await _pokemonRepository.loadPokemonList(itemCounter: event.itemCounter, offset: event.offset);
      newPokemons = response;
      emit(PokemonSuccess(newPokemons));
    }catch (e,stackTrace){
      emit(PokemonError());
      print("hata: $e");
      print("hata stackTrace: $stackTrace");

    }
  }
}
