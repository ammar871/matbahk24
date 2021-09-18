import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:http/http.dart' as http;

class HomeProviders extends ChangeNotifier {
  bool isLoading = false;

  List<Fields> fields = [];
  List<Foods> foods = [];


  getDataHome() async {
    isLoading = true;

    foods = [];
    final url = Uri.parse(base_url + 'get-home');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var resBody = json.decode(response.body);

      resBody["foods"].forEach((element) {
        foods.add(Foods.fromJson(element));
      });

      resBody["fields"].forEach((element) {
        fields.add(Fields.fromJson(element));
      });


    print(foods.length+fields.length);

    isLoading = false;
    notifyListeners();
  }

  else {
  isLoading = false;
  notifyListeners();
  }

}}
