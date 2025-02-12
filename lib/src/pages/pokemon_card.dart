import 'package:flutter/material.dart';
import 'package:pokemon_1/src/models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name[0].toUpperCase() + pokemon.name.substring(1)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(6),
          child: Card.outlined(
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pokemon.name[0].toUpperCase() +
                            pokemon.name.substring(1),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            pokemon.frontImage,
                            width: 400,
                            height: 400,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('HP : ${pokemon.hp}'),
                                  Text('Atk : ${pokemon.atk}'),
                                  Text('Sp. Atk : ${pokemon.speAtk}'),
                                  Text('Speed : ${pokemon.speed}'),
                                ]),
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(''),
                                  Text('Def : ${pokemon.def}'),
                                  Text('Sp. Def : ${pokemon.speDef}'),
                                  Text('Total : ${pokemon.total}'),
                                ]),
                          ),
                        ],
                      ),
                    ])),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
