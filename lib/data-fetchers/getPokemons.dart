import 'dart:convert';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:http/http.dart' as http;

final apiUrl = Uri.https("gist.githubusercontent.com",
    "scitbiz/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json");

Future<List<Pokemon>> getPokemons() async {
  final response = await http.get(apiUrl);

  return (json.decode(response.body) as List)
      .map((item) => Pokemon.fromJson(item))
      .toList();
}
