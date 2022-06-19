import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/flag_controller.dart';

class FlagList extends StatefulWidget {
  const FlagList({Key? key}) : super(key: key);

  @override
  State<FlagList> createState() => _FlagListState();
}

class _FlagListState extends State<FlagList> {
  late final FlagController flagController;

  @override
  void initState() {
    flagController = context.read<FlagController>();
    flagController.getFlag();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlagController provider = Provider.of<FlagController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: ListView.builder(
            itemCount: provider.list.length,
            itemBuilder: (context, index) {

              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(provider.list[index].name.toString()),
                ),
              );
            }),
      ),
    );
  }
}
