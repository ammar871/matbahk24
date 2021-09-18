import 'package:flutter/cupertino.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';

import 'item_list_product_of_client.dart';

class ListProductsOfClints extends StatelessWidget {
  final List<Foods> foods;


  ListProductsOfClints({required this.foods});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount:foods.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: MediaQuery.of(context).size.height / 800,
          crossAxisSpacing: 8,
          mainAxisSpacing: 2),
      itemBuilder: (BuildContext context, int index) {
        return ItemListProductsOfClient(foods:foods[index]);
      },
    );
  }
}
