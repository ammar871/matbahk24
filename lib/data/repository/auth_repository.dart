import 'package:matbahk24/data/models/confirm_code/confirm__code.dart';
import 'package:matbahk24/data/models/login.dart';
import 'package:matbahk24/data/web_services/auth_web_service.dart';

class AuthRepository{

  final AuthWebServices authWebServices;

  AuthRepository(this.authWebServices);

  Future<Login> getAllCharacters(String phone) async {
    final loginData = await authWebServices.checkUserPhone(phone);
    return  Login.fromJson(loginData);
  }
  Future<ConfirmCode> confirmCode(String phone,String code) async {
    final loginData = await authWebServices.confirmCode(phone,code);
    return  ConfirmCode.fromJson(loginData);
  }

  Future<String> validateNumber(String phone) async {
    final loginData =await authWebServices.validateNumber(phone);
   // print(loginData);
    return  loginData;
  }
}