import 'package:flutter/cupertino.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';

import 'item_products.dart';

class ListProducts extends StatelessWidget {

  final List<Foods> foods;


  ListProducts({required this.foods});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: foods.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: MediaQuery.of(context).size.height / 800,
            crossAxisSpacing: 8,
            mainAxisSpacing: 2),
        itemBuilder: (BuildContext context, int index) {
          return ItemProduct(foods:foods[index]);
        },
      ),
    );
  }
}