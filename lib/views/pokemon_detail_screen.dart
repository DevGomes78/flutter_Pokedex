import 'package:flutter/material.dart';
import 'package:flutter_covid/components/text.dart';

import '../constants/String_constants.dart';

class PokemonDetails extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int HeroTag;
  final name;
  final img;
  final type;
  final height;
  final weight;
  final spawnTime;
  final weaknesses;
  final nextEvolution;

  PokemonDetails({
    required this.pokemonDetail,
    required this.color,
    required this.HeroTag,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.spawnTime,
    required this.weaknesses,
    required this.nextEvolution,
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
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
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
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Positioned(
              top: 140,
              left: 20,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.black26,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                  child: Text(
                    widget.type![0].toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
          Positioned(
            top: height * 0.15,
            right: -30,
            child: Image.asset(
              StringConstants.imageAssets,
              width: 250,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    mounthAreaname(width),
                    mounthAreaheinght(width),
                    mounthAreaWheight(width),
                    mounthAreaSpawTime(width),
                    mountAreaWeaknesses(width),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.16,
            left: (width / 2) - 100,
            child: Image.network(
              widget.img.toString(),
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }

  Padding mountAreaWeaknesses(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width * 0.3,
            child: Text(
              StringConstants.weaknesses,
              style: AppTextStyle.font18BoldBlack,
            ),
          ),
          Text(
            widget.weaknesses.toString(),
            style: AppTextStyle.font18W700Bluegray,
          ),
        ],
      ),
    );
  }

  Padding mounthAreaSpawTime(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.3,
            child: Text(
              StringConstants.SpawTime,
              style: AppTextStyle.font18BoldBlack,
            ),
          ),
          SizedBox(
            width: width * 0.3,
            child: Text(
              widget.spawnTime.toString(),
              style: AppTextStyle.font18W700Bluegray,
            ),
          ),
        ],
      ),
    );
  }

  Padding mounthAreaWheight(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width * 0.3,
            child: Text(
              StringConstants.Weigth,
              style: AppTextStyle.font18BoldBlack,
            ),
          ),
          Container(
            width: width * 0.3,
            child: Text(
              widget.weight.toString(),
              style: AppTextStyle.font18W700Bluegray,
            ),
          ),
        ],
      ),
    );
  }

  Padding mounthAreaheinght(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width * 0.3,
            child: Text(StringConstants.Height,
                style: AppTextStyle.font18BoldBlack),
          ),
          Container(
            width: width * 0.3,
            child: Text(widget.height.toString(),
                style: AppTextStyle.font18W700Bluegray),
          ),
        ],
      ),
    );
  }

  Padding mounthAreaname(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width * 0.3,
            child: Text(
              StringConstants.Name,
              style: AppTextStyle.font18BoldBlack,
            ),
          ),
          Container(
            width: width * 0.3,
            child: Text(
              widget.name.toString(),
              style: AppTextStyle.font18W700Bluegray,
            ),
          ),
        ],
      ),
    );
  }
}
