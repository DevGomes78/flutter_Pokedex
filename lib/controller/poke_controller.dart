import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/poke_models.dart';

class PokeController extends ChangeNotifier {
  List<Pokemon> list = [];
  var url = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  Future<List<Pokemon>> getData() async {
    final baseUrl = Uri.parse(url);
    final response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      result['pokemon'].forEach((item) =>
          list.add(Pokemon.fromJson(item)));
      notifyListeners();
      return list;
    } else {
      throw (Exception);
    }
  }
}
