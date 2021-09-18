

class SignModel {
  late bool _success;
 late String _code;

  bool get success => _success;
  String get code => _code;

  SignModel({
      required bool success,
      required String code}){
    _success = success;
    _code = code;
}

  SignModel.fromJson(dynamic json) {
    _success = json['success'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['success'] = _success;
    map['code'] = _code;
    return map;
  }

}