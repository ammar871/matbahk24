import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:matbahk24/data/models/ModelMarkets/model_markets.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:http/http.dart' as http;

class MarketsProvider extends ChangeNotifier {
  bool isLoading = false;
  List<ModelMarkets> markets = [];

  getMarkets(String fieldId) async {
    isLoading = true;
    notifyListeners();

    var params = {
      "fieldId": fieldId,
    };

    final url = Uri.parse(base_url + 'field/markets');
    final newURI = url.replace(queryParameters: params);
    final response = await http.get(newURI);

    if (response.statusCode == 200) {
      var resBody = json.decode(response.body);
      markets = [];
      resBody.forEach((element) {
        markets.add(ModelMarkets.fromJson(element));
      });

      print(markets.length);

      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
    }
  }
}
