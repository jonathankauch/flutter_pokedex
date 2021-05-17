import 'package:flutter/material.dart';

import 'package:flutter_pokedex/ui/constants.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/utils/get-colors.dart';

class PokemonTypePill extends StatelessWidget {
  final String type;

  PokemonTypePill({Key key, @required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(SPACING_XS),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: getColor(type.toLowerCase())),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SPACING_MD, vertical: SPACING_XS),
            child: Center(
                child: Text(
              type,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ))));
  }
}
