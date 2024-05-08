import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_infinity/features/listing_feature/presentation/bloc/pokemon_bloc.dart';
import 'package:pokemon_infinity/injector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  int limit = 10;
  int offset = 0;

  @override
  void initState() {
    super.initState();
    injector<PokemonBloc>().add(const GetPokemonList(itemCounter: "10", offset: "0"));
    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent) {
      //  offset += 10;
        limit += 10;
        injector<PokemonBloc>().add(GetMorePokemon(itemCounter: limit.toString(), offset: offset.toString()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon Infinity"),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) => switch (state) {
            PokemonLoading() => const Center(child: CircularProgressIndicator()),
            PokemonError() => const Center(child: Text('Error')),
            PokemonSuccess() => ListView.builder(
              controller: scrollController,
              itemCount: state.pokemons.length + 1,
              itemBuilder: (context, index) {
                print(state.pokemons.length);
                if (index < state.pokemons.length) {
                  final pokemon = state.pokemons[index];
                  return SizedBox(height: 100,
                    child: Card(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(pokemon.name),
                          Text(pokemon.url),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            _ => const Text("Unknown state"),
          }
      ),
    );
  }
}
