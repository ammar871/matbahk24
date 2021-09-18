import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:matbahk24/helpers/constans.dart';

class UploadImageMarketProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoadingBanner = false;
  bool isSuccessBanner = false;
  bool isSuccessImage = false;
  String image1 = "";
  String imagemeal = "";
  String image2 = "";
  int typeMethod = 0;

  startUploadImageProfile(String tmpFile, String model) async {
    isLoading = true;
    notifyListeners();

    var request =
        http.MultipartRequest('POST', Uri.parse(base_url + 'image/upload'));
    request.fields.addAll({'modle': model, 'modleId': ''});
    request.files.add(await http.MultipartFile.fromPath('file', tmpFile));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      isSuccessImage=true;
      isLoading = false;

      var responseBody = await response.stream.bytesToString();







        image2 = responseBody.toString();
      notifyListeners();

      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }

  startUploadImageMeal(String tmpFile, String model) async {
    imagemeal="";
    isLoading = true;
    notifyListeners();

    var request =
    http.MultipartRequest('POST', Uri.parse(base_url + 'image/upload'));
    request.fields.addAll({'modle': model, 'modleId': ''});
    request.files.add(await http.MultipartFile.fromPath('file', tmpFile));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      isSuccessImage=true;
      isLoading = false;

      var responseBody = await response.stream.bytesToString();







      imagemeal = responseBody.toString();
      notifyListeners();

      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }

  startUploadImageBanner(String tmpFile, String model) async {
    isLoadingBanner = true;
    notifyListeners();

    var request =
    http.MultipartRequest('POST', Uri.parse(base_url + 'image/upload'));
    request.fields.addAll({'modle': model, 'modleId': ''});
    request.files.add(await http.MultipartFile.fromPath('file', tmpFile));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      isLoadingBanner = false;
      isSuccessBanner=true;
      var responseBody = await response.stream.bytesToString();






        image2 = responseBody.toString();


      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }
}
