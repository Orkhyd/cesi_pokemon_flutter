import 'package:flutter/material.dart';
import 'package:pokemon_1/src/models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text(pokemon.name[0].toUpperCase() + pokemon.name.substring(1)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(6),
          child: Card.outlined(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pokemon.name[0].toUpperCase() +
                        pokemon.name.substring(1)),
                    Text('HP : ${pokemon.hp}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Atk : ${pokemon.atk}'),
                        Text('Def : ${pokemon.def}'),
                      ],
                    ),
                    Text('Sp. Atk : ${pokemon.speAtk}'),
                    Text('Sp. Def : ${pokemon.speDef}'),
                    Text('Speed : ${pokemon.speed}'),
                    Text('Total : ${pokemon.total}'),
                  ],
                ),
              )),
        ));
  }
}
