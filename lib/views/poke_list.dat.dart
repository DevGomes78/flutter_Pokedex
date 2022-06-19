import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 28,
        ),
        actions: [
          Icon(
            Icons.menu,
            color: Colors.black,
            size: 28,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
          itemCount: provider.list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            childAspectRatio: 1.4,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal:10, vertical: 8,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
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
                        style: TextStyle(
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 4, bottom: 4),
                          child: Text(
                            provider.list[index].type![0].toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: -5,
                      child: Image.network(
                        provider.list[index].img.toString(),
                        height: 110,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
