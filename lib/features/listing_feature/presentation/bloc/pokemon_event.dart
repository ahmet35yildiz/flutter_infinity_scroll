part of 'pokemon_bloc.dart';

@immutable
sealed class GetPokemonListEvent extends Equatable{
  const GetPokemonListEvent();

  @override
  List<Object?> get props => [];
}

final class GetPokemonList extends GetPokemonListEvent {
  final String? itemCounter;
  final String? offset;
  const GetPokemonList({this.itemCounter,this.offset, });

  @override
  List<Object?> get props => [itemCounter];
}

final class GetMorePokemon extends GetPokemonListEvent {
  final String? itemCounter;
  final String? offset;
  const GetMorePokemon({this.itemCounter, this.offset,});

  @override
  List<Object?> get props => [itemCounter];
}
