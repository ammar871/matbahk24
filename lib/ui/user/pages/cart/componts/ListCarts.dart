import 'package:flutter/cupertino.dart';
import 'package:matbahk24/data/models/cart_model/get_cart_model.dart';

import 'ItemCartList.dart';

class ListCarts extends StatelessWidget {
final List<CartModel>carts;


ListCarts({required this.carts});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: carts.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return ItemCartList(cart:carts[index]);
          }),
    );
  }
}