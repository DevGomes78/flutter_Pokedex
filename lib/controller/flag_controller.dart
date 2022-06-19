import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/flag_model.dart';



class FlagController extends ChangeNotifier {
  List<Data> list = [];
  var url = 'https://countriesnow.space/api/v0.1/countries/flag/images';

  Future<List<Data>> getFlag() async {
    final baseUrl = Uri.parse(url);
    final response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      result['data'].forEach((item) => list.add(Data.fromJson(item)));
      notifyListeners();
      return list;
    } else {
      throw (Exception);
    }
  }
}
