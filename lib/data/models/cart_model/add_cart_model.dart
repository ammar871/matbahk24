class AddCartModel {
  late int id;
  late int price;
  late  String userId;
  late int quantity;
  late int foodId;
  late int orderId;

  AddCartModel(
      {required this.id,
        required this.price,
        required this.userId,
        required this.quantity,
        required this.foodId,
        required this.orderId});

  AddCartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    userId = json['user_id'];
    quantity = json['quantity'];
    foodId = json['food_id'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['user_id'] = this.userId;
    data['quantity'] = this.quantity;
    data['food_id'] = this.foodId;
    data['order_id'] = this.orderId;
    return data;
  }
}