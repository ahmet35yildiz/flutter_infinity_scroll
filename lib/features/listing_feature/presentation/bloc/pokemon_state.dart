part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonState extends Equatable{
  const PokemonState();

  @override
  List<Object?> get props => [];
}

final class PokemonInitial extends PokemonState {}
final class PokemonLoading extends PokemonState {}
final class PokemonSuccess extends PokemonState {
  final List<PokemonResultsModel> pokemons;

  const PokemonSuccess(this.pokemons);

  @override
  List<Object?> get props => [pokemons];
}
final class PokemonError extends PokemonState {}
