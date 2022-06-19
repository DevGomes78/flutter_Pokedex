import 'package:flutter/material.dart';
import 'package:flutter_covid/controller/covid_controller.dart';
import 'package:provider/provider.dart';
import '../models/covid_models.dart';

class CovidList extends StatefulWidget {
  const CovidList({Key? key}) : super(key: key);

  @override
  State<CovidList> createState() => _CovidListState();
}

class _CovidListState extends State<CovidList> {
  late final CovidController controller;

  @override
  void initState() {
    controller = context.read<CovidController>();
    controller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CovidController provider = Provider.of<CovidController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: ListView.builder(
            itemCount: provider.lista.length,
            itemBuilder: (context, index) {

              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(provider.lista[index].state.toString()),
                  subtitle: Text(provider.lista[index].deaths.toString()),
                ),
              );
            }),
      ),
    );
  }
}
