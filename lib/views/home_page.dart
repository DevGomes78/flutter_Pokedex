import 'package:flutter/material.dart';
import 'package:flutter_covid/views/poke_list.dat.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:PokeList(),
    );
  }
}
