import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:http/http.dart' as http;

class SignDriverProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isSuccess = false;

  SignUpDriver(
      {required String fullName,
      required String phone,
      required String email,
      required String knowName,
      required String identity,
      required String iban,
      required String address}) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(base_url + 'auth/driver-signup');
    final response = await http.post(url, body: {
      'fullName': fullName,
      'email': email,
      'userName': '+966$phone',
      'knownName': knowName,
      'IdentityNumber': identity,
      'address': address,
      'lat': '39',
      'lng': '21',
      'IbanNumber': iban
    });

    if (response.statusCode == 200) {
      isLoading = false;
      isSuccess = true;
      var resBody = json.decode(response.body);
      print(resBody);
      notifyListeners();
    } else {
      isLoading = false;
      print(response.statusCode);
      notifyListeners();
    }
    notifyListeners();
  }
}
