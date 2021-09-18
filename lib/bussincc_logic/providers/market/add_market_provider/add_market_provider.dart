import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:matbahk24/helpers/commen.dart';
import 'package:matbahk24/helpers/constans.dart';

class AddMarketProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isSuccess = false;

  addMarket({required String name,
    required String image,
    required String imageBanner,

    required String summery,
    required List<String> fields}) async {

     isLoading = true;
     notifyListeners();
    print(Cemmon.UserId);

    var headers = {

    'Authorization': 'Bearer ${Cemmon.UserToken}'};
    var request = http.Request('POST', Uri.parse(base_url+'market/add'));
    request.bodyFields = {
    'title': name,
    'user_id': Cemmon.UserId,
    'image': image,
    'bannarImage': imageBanner,
    'lat': '32',
    'lng': '32',
    'phone': Cemmon.Userphone,
    'summary': summery,
      "fields": fields.join("#")
    };

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      isSuccess=true;
     isLoading=false;
    print(await response.stream.bytesToString());
      notifyListeners();
    }
    else {
      isLoading=false;
    print(response.reasonPhrase);
    }


   /* final url = Uri.parse(base_url + 'market/add');
    Map body =  {
      'title': name,
      'user_id': Cemmon.UserId.toString(),
      'image': image,
      'bannarImage': imageBanner,
      'lat': '32',
      'lng': '32',
      'phone': Cemmon.Userphone,
      'summary': summery,
    };

    fields.forEach((element) {
      body['fields']
    });
    final response = await http.post(url, body:body,headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      isLoading = false;
     print(response.statusCode);
      notifyListeners();

    } else {
      print(response.statusCode);
      isLoading = false;
      notifyListeners();
    }*/
  }
}
