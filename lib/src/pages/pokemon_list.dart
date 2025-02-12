import 'package:flutter/material.dart';
import 'package:pokemon_1/src/pages/pokemon_card.dart';
import 'package:pokemon_1/src/services/pokemon_api.dart';
import '../models/pokemon.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final PokemonApiService _pokemonApiService = PokemonApiService();
  late Future<List<Pokemon>> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = _pokemonApiService.getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
        ),
        body: FutureBuilder<List<Pokemon>>(
            future: _pokemonListFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No Pokemon found'));
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final pokemon = snapshot.data![index];
                  return GestureDetector(
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PokemonCard(pokemon: pokemon)))
                          },
                      child: Card(
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          leading: Image.network(
                            pokemon.sprite,
                            width: 50,
                            height: 50,
                          ),
                          title: Text(pokemon.name[0].toUpperCase() +
                              pokemon.name.substring(1)),
                          trailing: Icon(Icons.chevron_right),
                        ),
                      ));
                },
              );
            }));
  }
}
