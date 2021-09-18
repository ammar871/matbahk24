import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:matbahk24/helpers/commen.dart';
import 'package:matbahk24/helpers/constans.dart';

import 'package:http/http.dart' as http;
class UpdateCartProvider extends ChangeNotifier {
  bool isLoading = false;



  updateCart({required String status, required String idCart}) async {
    isLoading = true;
    notifyListeners();
    var headers = {
      'Authorization': 'Bearer ${Cemmon.UserToken}'};
    final url = Uri.parse(base_url + 'cart/update');
    final response = await http.post(url, body: {'id': idCart,
      'status': status},headers: headers);
    if (response.statusCode == 200) {
      notifyListeners();
    //  var resBody = json.decode(response.body);
     print(response.body);
      isLoading = false;


    } else {
      isLoading = false;
      print("errrror${response.statusCode}");
      notifyListeners();
    }


  }
  notifyListeners();
}