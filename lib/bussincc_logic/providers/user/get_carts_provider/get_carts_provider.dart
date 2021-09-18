import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:matbahk24/data/models/cart_model/get_cart_model.dart';
import 'package:matbahk24/helpers/commen.dart';
import 'package:http/http.dart' as http;
import 'package:matbahk24/helpers/constans.dart';

class GetCartProvider extends ChangeNotifier {
  bool isLeading = false;
  List<CartModel> carts = [];

  getCarts() async {
    isLeading = true;
    notifyListeners();
    var headers = {'Authorization': 'Bearer ${Cemmon.UserToken}'};

    final url = Uri.parse(base_url + 'cart/get-carts');
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      notifyListeners();
      isLeading = false;
      var resBody = json.decode(response.body);
      print(resBody);
      carts = [];
      resBody.forEach((element) {
        carts.add(CartModel.fromJson(element));
      });
print(carts.length);
    } else {
      isLeading = false;
      notifyListeners();
    }

    /*
    var request = http.Request('GET', Uri.parse(base_url + 'cart/get-carts'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    carts = [];
    if (response.statusCode == 200) {
      isLeading = false;
      notifyListeners();
      print(await response.stream.bytesToString());
      var responseBody = await response.stream.bytesToString();
      var resBody = json.decode(responseBody);

      print(resBody);
      resBody.forEach((element) {
        carts.add(CartModel.fromJson(element));
      });
      notifyListeners();
    } else {
      isLeading = false;
      notifyListeners();
      print(response.reasonPhrase);
    }*/
  }
}
