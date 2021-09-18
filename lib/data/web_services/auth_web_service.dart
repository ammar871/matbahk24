import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:matbahk24/data/models/login.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:http/http.dart' as http;

class AuthWebServices{
  late Dio dio;
  AuthWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: base_url,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future<dynamic> checkUserPhone(String phone) async {
    try {
      final url =Uri.parse(base_url+'auth/check-username');
      final response = await http.post(url, body: {'phone':"+966$phone"});
      print(response.body);
      var resBody = json.decode(response.body);
      return resBody;
    } catch (e) {
      print(e.toString());
      return Login(status: 2, code: "code");
    }

  }

  Future<dynamic> confirmCode(String phone,String code) async {
    try {
      final url =Uri.parse(base_url+'auth/confirm-code');
      final response = await http.post(url, body: {'userName':"$phone","code":code});
      print(response.body);
      if(response.statusCode==200){
        var resBody = json.decode(response.body);
        return resBody;
      }else{

      }

    } catch (e) {
      print(e.toString());

    }

  }

  Future<dynamic> validateNumber(String phone) async {
    try {
      final url =Uri.parse(base_url+'auth/validate');
      final response = await http.post(url, body: {'userName':"$phone"});

     return response.body;
    } catch (e) {
      print(e.toString());

    }

  }




}