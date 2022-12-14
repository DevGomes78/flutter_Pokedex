import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/error_constants.dart';
import '../constants/url_constants.dart';
import '../models/poke_models.dart';

class PokeController extends ChangeNotifier {
  List<Pokemon> list = [];

  Future<List<Pokemon>> getData() async {
    try {
      final baseUrl = Uri.parse(ServiceUrl.BaseUrl);
      final response = await http.get(baseUrl);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        result['pokemon'].forEach((item) => list.add(Pokemon.fromJson(item)));
        notifyListeners();
        return list;
      }
    } catch (e) {
      print('${Errorconstants.pageError} $e');
      return [];
    }
    return [];
  }
}
