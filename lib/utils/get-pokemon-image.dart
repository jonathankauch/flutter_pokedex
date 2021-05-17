import 'package:flutter/material.dart';

NetworkImage getPokemonImage(String id) {
  return NetworkImage(
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${int.parse(id.substring(1)).toString()}.png');
}
