import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:matbahk24/helpers/commen.dart';
import 'package:matbahk24/helpers/constans.dart';
class AddMealProvider extends ChangeNotifier{

  bool isLoading = false;
  bool isSuccess = false;

  addMarket({required String name,
    required String desc,
    required String attachments,

    required String serveWay,
    required String nots,
    required String price,
    required String time,
    required String persons,
    required List<String> images}) async {

    isLoading = true;
    notifyListeners();


    var headers = {

      'Authorization': 'Bearer ${Cemmon.UserToken}'};
    var request = http.Request('POST', Uri.parse(base_url+'food/add'));
    request.bodyFields = {
      'name':name,
      'desc':desc,
      'attatchments': attachments,
      'serve_way': serveWay,
      'notes': nots,
      'price': price,
      'persons':persons,
      'preparation_time': time,
      'category_id': '1',
      'market_id': Cemmon.MarketId,
      'images': images.join("#"),
      'lat': '33',
      'lng': '39'
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
