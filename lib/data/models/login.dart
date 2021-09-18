

class Login {
 late int _status;
  late String _code;

  int get status => _status;
  String get code => _code;

  Login({
      required int status,
      required String code}){
    _status = status;
    _code = code;
}

  Login.fromJson(dynamic json) {
    _status = json['status'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['code'] = _code;
    return map;
  }

}