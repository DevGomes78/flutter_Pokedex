import 'package:flutter/material.dart';
import 'package:flutter_covid/controller/covid_controller.dart';
import 'package:flutter_covid/controller/flag_controller.dart';
import 'package:flutter_covid/views/home_page.dart';
import 'package:provider/provider.dart';

import 'controller/poke_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>CovidController()),
        ChangeNotifierProvider(create: (context)=>FlagController()),
        ChangeNotifierProvider(create: (context)=>PokeController()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

