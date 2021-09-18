import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:matbahk24/data/models/confirm_code/confirm__code.dart';
import 'package:matbahk24/helpers/constans.dart';

class OtpProvider extends ChangeNotifier {
  bool isLoading = false;
  ConfirmCode? confirmCodeData;
  confirmCode(String phone, String code) async {
    isLoading = true;
    notifyListeners();


  /*  ConfirmCode confirmCode = ConfirmCode(
        token: "token",
        user: User(
            id: "1",
            knownName: "knownName",
            createdAt: "createdAt",
            fullName: "fullName",
            role: "null"),
        expiration: "expiration");*/
    try {
      final url = Uri.parse(base_url + 'auth/confirm-code');
      final response =
          await http.post(url, body: {'userName': "$phone", "code": code});
      print(response.body);
      if (response.statusCode == 200) {
        isLoading=false;
        var resBody = json.decode(response.body);
        confirmCodeData = ConfirmCode.fromJson(resBody);



        notifyListeners();
        return confirmCodeData;
      } else {
        isLoading=false;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }
}
