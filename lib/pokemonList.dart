import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_pokedex/data-fetchers/getPokemons.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/utils/get-pokemon-image.dart';
import 'package:flutter_pokedex/utils/get-colors.dart';
import 'package:flutter_pokedex/pokemonDetails.dart';
import 'package:flutter_pokedex/ui/constants.dart';
import 'package:flutter_pokedex/components/PokemonTypePill.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Pokedex')),
        body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: FutureBuilder<List<Pokemon>>(
                future: getPokemons(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Oops an error has occured'));
                  } else if (snapshot.hasData) {
                    return renderPokemonList(snapshot);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }

  Widget renderPokemonList(data) {
    return GridView.builder(
        padding: EdgeInsets.all(SPACING_MD),
        itemCount: data.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2,
          crossAxisCount: 2,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.all(SPACING_SM),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  child: new InkResponse(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PokemonDetails(pokemon: data.data[index]),
                          ),
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: getPokemonCardBackgroundColor(
                                  data.data[index].types)),
                          child: Row(children: [
                            Expanded(
                                child: Container(
                              foregroundDecoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          getPokemonImage(data.data[index].id),
                                      fit: BoxFit.contain)),
                            )),
                            Expanded(
                                child: Stack(children: [
                              Positioned(
                                child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            alignment: Alignment(2.5, 1.0),
                                            image: AssetImage(
                                              "/img/toppng.com-okeball-graphic-by-maratuna-on-deviantart-banner-free-pokeball-icon-white-834x835.png",
                                            ),
                                            colorFilter: new ColorFilter.mode(
                                                Colors.black.withOpacity(0.2),
                                                BlendMode.srcIn),
                                            fit: BoxFit.contain))),
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(data.data[index].id,
                                        style: TextStyle(
                                            fontSize: FONT_SIZE_LG,
                                            color: Colors.white)),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(bottom: SPACING_SM),
                                        child: Text(
                                          data.data[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: FONT_SIZE_XL,
                                              color: Colors.white),
                                        )),
                                    Container(
                                        width: 100,
                                        margin: new EdgeInsets.symmetric(
                                            horizontal: SPACING_XS),
                                        child: ListView.builder(
                                            // scrollDirection: ,
                                            shrinkWrap: true,
                                            itemCount:
                                                data.data[index].types.length,
                                            itemBuilder: (context, j) {
                                              return PokemonTypePill(
                                                  type: data
                                                      .data[index].types[j]);
                                            }))
                                  ])
                            ]))
                          ])))));
        });
  }
}
