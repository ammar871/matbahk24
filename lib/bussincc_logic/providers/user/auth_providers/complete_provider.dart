import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:matbahk24/data/models/sign_model.dart';
import 'package:matbahk24/helpers/constans.dart';

class CompletedAccountProvider extends ChangeNotifier {
  SignModel? signModel;
  bool isLoading = false;

  completeSign(String fullName, String phone) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(base_url + 'auth/signup');
    final response = await http.post(url, body: {
      'fullName': fullName,
      'email': 'dfh@hdjfgd.com',
      'userName': phone,
      'knownName': 'ejf;hgkldhglk'
    });

    if (response.statusCode == 200) {
      isLoading = false;
      var resBody = json.decode(response.body);
      signModel = SignModel.fromJson(resBody);
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }
}
