import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';
import 'package:http/http.dart' as http;
import 'package:matbahk24/helpers/constans.dart';
class SearchProvider extends ChangeNotifier{


  bool isLoading = false;


  List<Foods> foods = [];

  getData(String textSearch) async {
    isLoading = true;
    notifyListeners();


    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('GET', Uri.parse(base_url+'food/search'));
    request.bodyFields = {
      'searchText': textSearch
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {
      isLoading = false;
      var responseBody = await response.stream.bytesToString();

      var resBody = json.decode(responseBody);
      print(responseBody);

      foods=[];
      resBody.forEach((element) {
        foods.add(Foods.fromJson(element));
      });
      print(foods.length);
      notifyListeners();
    }
    else {
      isLoading = false;
      print(response.reasonPhrase);
      notifyListeners();
    }

  }
}