import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:matbahk24/helpers/commen.dart';
import 'package:matbahk24/helpers/constans.dart';

class AddCartProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isSuccess = false;

  addToCart(
      {required String price,
      required String foodId,
      required String quantity}) async {
    isLoading = true;
    notifyListeners();
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${Cemmon.UserToken}'
    };
    var request = http.Request('POST', Uri.parse(base_url + 'cart/add'));
    request.bodyFields = {
      'price': price,
      'user_id': Cemmon.UserId,
      'quantity': quantity,
      'food_id': foodId
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      isLoading = false;
      isSuccess = true;
      notifyListeners();
      print(await response.stream.bytesToString());

    } else {
      isSuccess = false;
      isLoading = false;
      print(response.reasonPhrase);
    }
  }
}
