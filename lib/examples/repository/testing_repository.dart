import 'package:matbahk24/data/models/login.dart';
import 'package:matbahk24/data/web_services/auth_web_service.dart';
import 'package:matbahk24/examples/posts.dart';
import 'package:matbahk24/examples/web_servic/tets_webService.dart';

class TestingRepository{

  final TestWebServices testWebServices;

  TestingRepository(this.testWebServices);

  Future<List<Posts>> getAllCharacters(String phone) async {
    final characters = await testWebServices.checkUserPhone(phone);
    return characters.map((character) => Posts.fromJson(character)).toList();
  }
}