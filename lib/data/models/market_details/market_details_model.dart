import 'package:matbahk24/data/models/ModelMarkets/model_markets.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';

class MarketDetailsModel {
 late Market market;

 late List<Fields> fields;
 late List<Foods> foods;



  MarketDetailsModel({
      required ModelMarkets market,
      required List<Fields> fields,
      required List<Foods> foods}){
   market = market;
    fields = fields;
    foods = foods;
}

  MarketDetailsModel.fromJson(dynamic json) {
  market=  Market.fromJson(json['market']) ;

      json['fields'].forEach((v) {
       fields.add(Fields.fromJson(v));
      });


      foods = [];
      json['foods'].forEach((v) {
        foods.add(Foods.fromJson(v));
      });

  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};

      map['market'] = market.toJson();


      map['fields'] = fields.map((v) => v.toJson()).toList();


      map['foods'] = foods.map((v) => v.toJson()).toList();

    return map;
  }

}

