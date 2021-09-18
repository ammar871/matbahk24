import 'package:matbahk24/data/models/models_home/model_home.dart';

class CartModel {
  late int id;
 late int quantity;
 late Foods food;

  CartModel({required this.id, required this.quantity, required this.food});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    food =  Foods.fromJson(json['food']) ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;

      data['food'] = this.food.toJson();

    return data;
  }
}

