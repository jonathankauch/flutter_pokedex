import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/colors.dart';

Color colorFromType(dynamic data) {
  Color color = getColor(data?.first?.toLowerCase()) ?? Colors.white;
  return color;
}

Color getPokemonCardBackgroundColor(dynamic data) {
  String type = data?.first?.toLowerCase();

  switch (type) {
    case "grass":
      return Colors.green[200];

    case "bug":
      return Colors.teal[200];

    case "fire":
      return Colors.red[600];

    case "water":
      return Colors.blue[200];

    case "fighting":
      return Colors.red[200];

    case "normal":
      return Colors.grey[200];

    case "electric":
      return Colors.yellow[200];

    case "psychic":
      return Colors.pink[200];

    case "poison":
      return Colors.purple[200];

    case "ghost":
      return Colors.purple;

    case "ground":
      return Colors.brown[600];

    case "rock":
      return Colors.brown[200];

    case "dark":
      return Colors.grey[800];

    case "dragon":
      return Colors.deepPurple[800];

    case "fairy":
      return Colors.pink[200];

    case "flying":
      return Colors.deepPurple[200];

    case "ice":
      return Colors.cyan[200];

    case "steel":
      return Colors.blueGrey[200];

    default:
      return Colors.white;
  }
}

Color getColor(String type) {
  switch (type) {
    case "grass":
      return PokedexColors.lightGreen;

    case "bug":
      return PokedexColors.lightTeal;

    case "fire":
      return PokedexColors.lightRed;

    case "water":
      return PokedexColors.lightBlue;

    case "fighting":
      return PokedexColors.red;

    case "normal":
      return PokedexColors.beige;

    case "electric":
      return PokedexColors.lightYellow;

    case "psychic":
      return PokedexColors.lightPink;

    case "poison":
      return PokedexColors.lightPurple;

    case "ghost":
      return PokedexColors.purple;

    case "ground":
      return PokedexColors.darkBrown;

    case "rock":
      return PokedexColors.lightBrown;

    case "dark":
      return PokedexColors.black;

    case "dragon":
      return PokedexColors.violet;

    case "fairy":
      return PokedexColors.pink;

    case "flying":
      return PokedexColors.lilac;

    case "ice":
      return PokedexColors.lightCyan;

    case "steel":
      return PokedexColors.grey;

    default:
      return Colors.white;
  }
}
