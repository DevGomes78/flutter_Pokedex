import 'package:flutter/material.dart';
import 'package:flutter_covid/views/pokemon_detail_screen.dart';
import 'package:provider/provider.dart';

import '../controller/poke_controller.dart';

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
    PokeController provider = Provider.of<PokeController>(context);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
          Positioned(
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
                  itemCount: provider.list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1.4,
                  ),
                  itemBuilder: (context, index) {
                    var type = provider.list[index].type![0];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>
                                PokemonDetails(
                                  pokemonDetail: provider.list[index],
                            color:  type == 'Grass'?
                              Colors.greenAccent: type== 'Fire'?
                              Colors.redAccent: type=='Water'?
                              Colors.blueAccent: type=='Electric'?
                              Colors.yellow: type=='Rock'?
                              Colors.grey: type=='Ground'?
                              Colors.brown: type== 'Psychic'?
                              Colors.indigo: type=='Fighting'?
                              Colors.orange: type=='Bug'?
                              Colors.lightGreenAccent:type=='Ghost'?
                              Colors.deepPurple  : type=='Normal'?
                              Colors.black26 :type=='Poison'?
                              Colors.deepPurpleAccent: Colors.pink,
                                  HeroTag: index,
                                  name:  provider.list[index].name,
                                  img: provider.list[index].img,
                                  type: provider.list[index].type,
                                  height: provider.list[index].height,
                                  weight: provider.list[index].weight,
                                  spawnTime:  provider.list[index].spawnTime,
                                  weaknesses: provider.list[index].weaknesses,
                                  nextEvolution: provider.list[index].nextEvolution,
                            )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: type == 'Grass'?
                            Colors.greenAccent: type== 'Fire'?
                            Colors.redAccent: type=='Water'?
                            Colors.blueAccent: type=='Electric'?
                            Colors.yellow: type=='Rock'?
                            Colors.grey: type=='Ground'?
                            Colors.brown: type== 'Psychic'?
                            Colors.indigo: type=='Fighting'?
                            Colors.orange: type=='Bug'?
                            Colors.lightGreenAccent:type=='Ghost'?
                            Colors.deepPurple  : type=='Normal'?
                            Colors.black26 :type=='Poison'?
                            Colors.deepPurpleAccent: Colors.pink,

                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: -10,
                                right: -10,
                                child: Image.asset(
                                  'images/pokeball.png',
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
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
