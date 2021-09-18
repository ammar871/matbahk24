import 'package:dio/dio.dart';

import 'package:matbahk24/helpers/constans.dart';

class TestWebServices{
  late Dio dio;
  TestWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: base_url,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> checkUserPhone(String phone) async {
    try {
      Response response = await dio.get('posts/');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }

  }

}