import 'package:flutter/cupertino.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:http/http.dart' as http;

class SignValidateProvider extends ChangeNotifier {
  bool isLoading = false;
  String? responseData;

  validateNumber(String phone) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(base_url + 'auth/validate');
    final response = await http.post(url, body: {'userName': "$phone"});
    if (response.statusCode == 200) {
      this.responseData = response.body.toString();
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }
}
