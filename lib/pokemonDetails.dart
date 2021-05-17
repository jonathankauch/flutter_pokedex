import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/utils/get-colors.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetails({Key key, @required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // backgroundColor: colorFromType(pokemon.types),
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Container(
                // color: colorFromType(pokemon.types),
                child: Column(
              children: <Widget>[
                Image(image: NetworkImage(pokemon.imageUrl), height: 250),
                ListTile(
                    leading: Text(pokemon.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    trailing: Text(pokemon.id,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 30,
                            fontWeight: FontWeight.bold))),
                Padding(
                  padding: EdgeInsets.all(30.0),
                ),
              ],
            )),
            Container(
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  ListTile(
                    title: Text("Description :",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(pokemon.description,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 18,
                            fontStyle: FontStyle.italic)),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 5, 5),
                    child: Text("Types :",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: 100,
                    color: Colors.white,
                    margin: new EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: pokemon.types.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.all(3.0),
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color:
                                  getColor(pokemon.types[index].toLowerCase())
                                      .withOpacity(0.5),
                            ),
                            child: Center(
                                child: Text(pokemon.types[index],
                                    textAlign: TextAlign.center)));
                      },
                    ),
                  ),
                  _pokemonStats(),
                ],
              ),
            )
          ],
        ));
  }

  /// Todo: Optimize code
  Widget _pokemonStats() {
    return Row(children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 5, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(pokemon.name + ' stats:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
            Row(
              children: <Widget>[
                Text('HP',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 18,
                        fontStyle: FontStyle.italic)),
                SizedBox(width: 60),
                Text(pokemon.hp.toString(),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 18,
                        fontStyle: FontStyle.italic)),
                SizedBox(width: 20),
                SizedBox(
                    height: 10.0,
                    width: 220.0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          backgroundColor:
                              colorFromType(pokemon.types).withOpacity(0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(
                              colorFromType(pokemon.types)),
                          value: pokemon.hp / 100,
                        ))),
              ],
            ),
            Row(
              children: <Widget>[
                Text('ATK',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 18,
                        fontStyle: FontStyle.italic)),
                SizedBox(width: 50),
                Text(pokemon.attack.toString(),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 18,
                        fontStyle: FontStyle.italic)),
                SizedBox(width: 20),
                SizedBox(
                    height: 10.0,
                    width: 220.0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          backgroundColor:
                              colorFromType(pokemon.types).withOpacity(0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(
                              colorFromType(pokemon.types)),
                          value: pokemon.attack / 100,
                        ))),
              ],
            ),
            Row(
              children: <Widget>[
                Text('DEF',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 18,
                        fontStyle: FontStyle.italic)),
                SizedBox(width: 50),
                Text(pokemon.defense.toString(),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 18,
                        fontStyle: FontStyle.italic)),
                SizedBox(width: 20),
                SizedBox(
                    height: 10.0,
                    width: 220.0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          backgroundColor:
                              colorFromType(pokemon.types).withOpacity(0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(
                              colorFromType(pokemon.types)),
                          value: pokemon.defense / 100,
                        ))),
              ],
            ),
            Row(
              children: <Widget>[
                Text('SPD',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 18,
                        fontStyle: FontStyle.italic)),
                SizedBox(width: 50),
                Text(pokemon.speed.toString(),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 18,
                        fontStyle: FontStyle.italic)),
                SizedBox(width: 20),
                SizedBox(
                    height: 10.0,
                    width: 220.0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          backgroundColor:
                              colorFromType(pokemon.types).withOpacity(0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(
                              colorFromType(pokemon.types)),
                          value: pokemon.speed / 100,
                        ))),
              ],
            )
          ],
        ),
      )
    ]);
  }
}
