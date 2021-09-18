import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:matbahk24/data/models/login.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;

  Login? loginData ;

  checkUserPhone(String phone) async {
    isLoading = true;
    notifyListeners();

      final url = Uri.parse(base_url + 'auth/check-username');
      final response = await http.post(url, body: {'phone': "$phone"});
      if (response.statusCode == 200) {

        var resBody = json.decode(response.body);
        loginData = Login.fromJson(resBody);
        isLoading = false;
        print(response.body);
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }


    }
    notifyListeners();
  }

