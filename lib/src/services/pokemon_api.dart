import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokemon_1/src/models/pokemon.dart';

class PokemonApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://pokeapi.co/api/v2';

  Future<List<Pokemon>> getPokemonList({int limit = 50}) async {
    try {
      final Response response =
          await _dio.get('$_baseUrl/pokemon', queryParameters: {
        'limit': limit,
      });

      if (response.statusCode == HttpStatus.ok) {
        final List<Pokemon> pokemonList = [];
        final List<dynamic> results = response.data['results'];

        for (var pokemon in results) {
          final String pokemonUrl = pokemon['url'];
          final Pokemon detailedPokemon = await _getPokemonDetails(pokemonUrl);
          pokemonList.add(detailedPokemon);
        }
        return pokemonList;
      } else {
        throw Exception('Failed to load Pokemon list');
      }
    } catch (e) {
      throw Exception('Error fetching Pokemon list: $e');
    }
  }

  Future<Pokemon> _getPokemonDetails(String url) async {
    try {
      final Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;

        return Pokemon(
          name: data['name'],
          type: data['types'][0]['type']['name'],
          sprite: data['sprites']['front_default'],
          hp: data['stats'][0]['base_stat'],
          atk: data['stats'][1]['base_stat'],
          def: data['stats'][2]['base_stat'],
          speAtk: data['stats'][3]['base_stat'],
          speDef: data['stats'][4]['base_stat'],
          speed: data['stats'][5]['base_stat'],
        );
      } else {
        throw Exception('Failed to load Pokemon details');
      }
    } catch (e) {
      throw Exception('Error fetching Pokemon details: $e');
    }
  }
}
