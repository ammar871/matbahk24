import 'package:matbahk24/data/models/models_home/model_home.dart';

class ModelMarkets {
  late Market market;
  late List<Fields> fields;
  late Null foods;

  ModelMarkets({required this.market, required this.fields, this.foods});

  ModelMarkets.fromJson(Map<String, dynamic> json) {
    market = Market.fromJson(json['market']);
    if (json['fields'] != null) {
      fields = [];
      json['fields'].forEach((v) {
        fields.add(new Fields.fromJson(v));
      });
    }
    foods = json['foods'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['market'] = this.market.toJson();

    data['fields'] = this.fields.map((v) => v.toJson()).toList();

    data['foods'] = this.foods;
    return data;
  }
}

class Market {
  late int id;
  late String title;
  late String userId;
  late int balance;
  late String image;
  late String bannarImage;
  late int lat;
  late int isClosed;
  late int lng;
  late String phone;
  late int status;
  late String summary;
  late int rate;
  late int orderCount;

  Market(
      {required this.id,
      required this.title,
      required this.userId,
      required this.balance,
      required this.image,
      required this.bannarImage,
      required this.lat,
      required this.isClosed,
      required this.lng,
      required this.phone,
      required this.status,
      required this.summary,
      required this.rate,
      required this.orderCount});

  Market.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    userId = json['user_id'];
    balance = json['balance'];
    image = json['image'];
    bannarImage = json['bannarImage'];
    lat = json['lat'];
    isClosed = json['isClosed'];
    lng = json['lng'];
    phone = json['phone'];
    status = json['status'];
    summary = json['summary'];
    rate = json['rate'];
    orderCount = json['order_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['user_id'] = this.userId;
    data['balance'] = this.balance;
    data['image'] = this.image;
    data['bannarImage'] = this.bannarImage;
    data['lat'] = this.lat;
    data['isClosed'] = this.isClosed;
    data['lng'] = this.lng;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['summary'] = this.summary;
    data['rate'] = this.rate;
    data['order_count'] = this.orderCount;
    return data;
  }
}
