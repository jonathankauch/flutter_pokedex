import 'package:flutter/material.dart';
import 'package:flutter_pokedex/pokemonList.dart';

void main() => runApp(FlutterPokedex());

class FlutterPokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome Pokemon Trainer',
        theme: ThemeData(
          primaryColor: Colors.red[700],
        ),
        home: PokemonList());
  }
}
