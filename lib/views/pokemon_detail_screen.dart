import 'package:flutter/material.dart';

class PokemonDetails extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int HeroTag;
  final name;
  final img;

  PokemonDetails({
    required this.pokemonDetail,
    required this.color,
    required this.HeroTag,
    required this.name,
    required this.img,
  });

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
              top: 80,
              left: 20,
              child: Text(
                widget.name.toString(),
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Positioned(
            top: height * 0.15,
            right: -30,
            child: Image.asset(
              'images/pokeball.png',
              width: 250,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: width/ 2,
            child: Image.network(widget.img.toString(),height: 200,
            fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
