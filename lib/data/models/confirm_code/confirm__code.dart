import 'package:matbahk24/data/models/ModelMarkets/model_markets.dart';

class ConfirmCode {
  late String _token;
  late User _user;
  late Market _market;
  late String _expiration;

  String get token => _token;

  User get user => _user;

  String get expiration => _expiration;

  Market get market => _market;

  ConfirmCode(
      {required String token,
      required User user,
      required Market market,
      required String expiration}) {
    _token = token;
    _user = user;
    _market = market;
    _expiration = expiration;
  }

  ConfirmCode.fromJson(dynamic json) {
    _token = json['token'];
    _user = User.fromJson(json['user']);
    _market = Market.fromJson(json['market']);
    _expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['token'] = _token;

    map['user'] = _user.toJson();
    map['market'] = _market.toJson();

    map['expiration'] = _expiration;
    return map;
  }
}

class User {
  late String _id;
  late String _knownName;
  late String _createdAt;
  late dynamic _city;
  late dynamic _country;
  late String _fullName;
  late dynamic _statuse;
  late String _role;

  String get id => _id;

  String get knownName => _knownName;

  String get createdAt => _createdAt;

  dynamic get city => _city;

  dynamic get country => _country;

  String get fullName => _fullName;

  dynamic get statuse => _statuse;

  String get role => _role;

  User(
      {required String id,
      required String knownName,
      required String createdAt,
      dynamic city,
      dynamic country,
      required String fullName,
      dynamic statuse,
      required String role}) {
    _id = id;
    _knownName = knownName;
    _createdAt = createdAt;
    _city = city;
    _country = country;
    _fullName = fullName;
    _statuse = statuse;
    _role = role;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _knownName = json['knownName'];
    _createdAt = json['createdAt'];
    _city = json['city'];
    _country = json['country'];
    _fullName = json['fullName'];
    _statuse = json['statuse'];
    _role = json['role'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['knownName'] = _knownName;
    map['createdAt'] = _createdAt;
    map['city'] = _city;
    map['country'] = _country;
    map['fullName'] = _fullName;
    map['statuse'] = _statuse;
    map['role'] = _role;
    return map;
  }
}
