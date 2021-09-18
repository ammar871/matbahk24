import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:matbahk24/data/models/ModelMarkets/model_markets.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';

import 'package:http/http.dart' as http;
import 'package:matbahk24/helpers/constans.dart';

class MarketDetailsProvider extends ChangeNotifier {
  bool isLoading = false;
  Market? market;
  List<Fields> fields = [];
  List<Foods> foods = [];

  getData(String marketId) async {
    isLoading = true;
    notifyListeners();

    var request = http.MultipartRequest(
        'GET', Uri.parse(base_url+'market/detail'));
    request.fields.addAll({'marketId': marketId});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();

      var resBody = json.decode(responseBody);
      resBody["foods"].forEach((element) {
        foods.add(Foods.fromJson(element));
      });

      resBody["fields"].forEach((element) {
        fields.add(Fields.fromJson(element));
      });
      market = Market.fromJson(resBody["market"]);
      print("${market!.title}${foods.length}${fields.length}");

      isLoading = false;
      notifyListeners();

      // var resBody = json.decode(responseBody);
      // print(resBody);
    } else {
      print(response.reasonPhrase);
    }

/*    // markets = [];
    var params = {
      'marketId':'1'
    };

    final url = Uri.parse(base_url +'market/detail');
    final newURI = url.replace(queryParameters: {'marketId': '1'});
    final response = await http.get(newURI);

    if (response.statusCode == 200) {
      var resBody = json.decode(response.body);
      print(resBody);
      //"${market!.title}${foods.length}${fields.length}"
      resBody["foods"].forEach((element) {
        foods.add(Foods.fromJson(element));
      });

      resBody["fields"].forEach((element) {
        fields.add(Fields.fromJson(element));
      });
      market=ModelMarkets.fromJson(resBody["market"]);
      print("${market!.title}${foods.length}${fields.length}");



      isLoading = false;
      notifyListeners();
    } else {
      print(response.reasonPhrase);
      isLoading = false;
      notifyListeners();
    }*/
  }
}
