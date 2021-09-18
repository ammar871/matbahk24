
class ModelHome {
 late List<Fields> _fields;
  late List<Foods> _foods;

  List<Fields> get fields => _fields;
  List<Foods> get foods => _foods;

  ModelHome({
      required List<Fields> fields,
      required List<Foods> foods}){
    _fields = fields;
    _foods = foods;
}

  ModelHome.fromJson(dynamic json) {
    if (json['fields'] != null) {
      _fields = [];
      json['fields'].forEach((v) {
        _fields.add(Fields.fromJson(v));
      });
    }
    if (json['foods'] != null) {
      _foods = [];
      json['foods'].forEach((v) {
        _foods.add(Foods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};

      map['fields'] = _fields.map((v) => v.toJson()).toList();


      map['foods'] = _foods.map((v) => v.toJson()).toList();

    return map;
  }

}



class Foods {
 late Food _food;
 late List<Photos> _photos;

  Food get food => _food;
  List<Photos> get photos => _photos;

  Foods({
      required Food food,
      required List<Photos> photos}){
    _food = food;
    _photos = photos;
}

  Foods.fromJson(dynamic json) {
    _food =  Food.fromJson(json['food']) ;
    _photos = [];
    json['photos'].forEach((v) {
      _photos.add(Photos.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};

      map['food'] = _food.toJson();


      map['photos'] = _photos.map((v) => v.toJson()).toList();

    return map;
  }

}


class Photos {
  late int _id;
  late String _url;
 late String _modleId;
 late String _modle;

  int get id => _id;
  String get url => _url;
  String get modleId => _modleId;
  String get modle => _modle;

  Photos({
      required int id,
      required String url,
      required String modleId,
      required String modle}){
    _id = id;
    _url = url;
    _modleId = modleId;
    _modle = modle;
}

  Photos.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
    _modleId = json['modleId'];
    _modle = json['modle'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    map['modleId'] = _modleId;
    map['modle'] = _modle;
    return map;
  }

}


class Food {
  late int id;
  late String name;
  late String desc;
 late String attatchments;
  late String serveWay;
 late String notes;
 late int price;
 late int persons;
 late int preparationTime;
 late int categoryId;
  late int marketId;
//late int fieldId;



  Food({
      required int id,
      required String name,
      required String desc,
      required String attatchments,
      required String serveWay,
      required String notes,
      required int price,
      required int persons,
      required int preparationTime,
      required int categoryId,
      required int marketId,
      //required int fieldId

  }){
    id = id;
    name = name;
    desc = desc;
    attatchments = attatchments;
    serveWay = serveWay;
    notes = notes;
    price = price;
    persons = persons;
    preparationTime = preparationTime;
    categoryId = categoryId;
    marketId = marketId;
   // fieldId = fieldId;
}

  Food.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    attatchments = json['attatchments'];
    serveWay = json['serve_way'];
    notes = json['notes'];
    price = json['price'];
    persons = json['persons'];
    preparationTime = json['preparation_time'];
    categoryId = json['category_id'];
    marketId = json['market_id'];
  //  fieldId = json['field_id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['desc'] = desc;
    map['attatchments'] = attatchments;
    map['serve_way'] = serveWay;
    map['notes'] = notes;
    map['price'] =price;
    map['persons'] = persons;
    map['preparation_time'] = preparationTime;
    map['category_id'] = categoryId;
    map['market_id'] = marketId;
  //  map['field_id'] = fieldId;
    return map;
  }

}



class Fields {
  late int _id;
  late String _name;
  late int _status;

  int get id => _id;
  String get name => _name;
  int get status => _status;

  Fields({
      required int id,
      required String name,
      required int status}){
    _id = id;
    _name = name;
    _status = status;
}

  Fields.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['status'] = _status;
    return map;
  }

}