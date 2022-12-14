import 'package:flutter/material.dart';
import 'package:flutter_covid/views/pokemon_detail_screen.dart';
import 'package:provider/provider.dart';
import '../constants/String_constants.dart';
import '../constants/error_constants.dart';
import '../controller/poke_controller.dart';
import '../models/poke_models.dart';

class PokeList extends StatefulWidget {
  const PokeList({Key? key}) : super(key: key);

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  late final PokeController controller;

  @override
  void initState() {
    controller = context.read<PokeController>();
    controller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:FutureBuilder<List<Pokemon>>(
        future: controller.getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            default:
              if (snapshot.hasError) {
                return  const Center(
                  child: Text(ErrorConstants.pageError),
                );
              } else {
                return  buildStack(width);
              }
          }
        }),

    );
  }

  Stack buildStack(double width) {
    return Stack(
      children: [
        Positioned(
          top: -30,
          right: -50,
          child: Image.asset(
            'images/pokeball.png',
            width: 200,
            fit: BoxFit.fitWidth,
          ),
        ),
        const Positioned(
            top: 80,
            left: 20,
            child: Text(
              'Pokedex',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )),
        Positioned(
          top: 150,
          bottom: 0,
          width: width,
          child: Column(children: [
            Expanded(
              child: GridView.builder(
                itemCount: controller.list.length,
                gridDelegate: const
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (context, index) {
                  var type = controller.list[index].type![0];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PokemonDetails(
                            pokemonDetail: controller.list[index],
                            color: type == 'Grass'
                                ? Colors.greenAccent
                                : type == 'Fire'
                                    ? Colors.redAccent
                                    : type == 'Water'
                                        ? Colors.blueAccent
                                        : type == 'Electric'
                                            ? Colors.yellow
                                            : type == 'Rock'
                                                ? Colors.grey
                                                : type == 'Ground'
                                                    ? Colors.brown
                                                    : type == 'Psychic'
                                                        ? Colors.indigo
                                                        : type == 'Fighting'
                                                            ? Colors.orange
                                                            : type == 'Bug'
                                                                ? Colors
                                                                    .lightGreenAccent
                                                                : type ==
                                                                        'Ghost'
                                                                    ? Colors
                                                                        .deepPurple
                                                                    : type ==
                                                                            'Normal'
                                                                        ? Colors
                                                                            .black26
                                                                        : type == 'Poison'
                                                                            ? Colors.deepPurpleAccent
                                                                            : Colors.pink,
                            HeroTag: index,
                            name: controller.list[index].name,
                            img: controller.list[index].img,
                            type: controller.list[index].type,
                            height: controller.list[index].height,
                            weight: controller.list[index].weight,
                            spawnTime: controller.list[index].spawnTime,
                            weaknesses: controller.list[index].weaknesses,
                            nextEvolution:
                                controller.list[index].nextEvolution,
                          ),
                        ),
                      );
                    },
                    child: mounthAreaPokemonColor(type, controller, index),
                  );
                },
              ),
            ),
          ]),
        ),
      ],
    );
  }

  mounthAreaPokemonColor(String type, PokeController provider, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: type == 'Grass'
              ? Colors.greenAccent
              : type == 'Fire'
                  ? Colors.redAccent
                  : type == 'Water'
                      ? Colors.blueAccent
                      : type == 'Electric'
                          ? Colors.yellow
                          : type == 'Rock'
                              ? Colors.grey
                              : type == 'Ground'
                                  ? Colors.brown
                                  : type == 'Psychic'
                                      ? Colors.indigo
                                      : type == 'Fighting'
                                          ? Colors.orange
                                          : type == 'Bug'
                                              ? Colors.lightGreenAccent
                                              : type == 'Ghost'
                                                  ? Colors.deepPurple
                                                  : type == 'Normal'
                                                      ? Colors.black26
                                                      : type == 'Poison'
                                                          ? Colors
                                                              .deepPurpleAccent
                                                          : Colors.pink,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -10,
              right: -10,
              child: Image.asset(
                StringConstants.imageAssets,
                height: 120,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Text(
                provider.list[index].name.toString(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 55,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black26,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 4, bottom: 4),
                  child: Text(
                    provider.list[index].type![0].toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: -5,
              child: Hero(
                tag: provider.list[index],
                child: Image.network(
                  provider.list[index].img.toString(),
                  height: 110,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
