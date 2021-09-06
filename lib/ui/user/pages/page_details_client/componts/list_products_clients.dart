import 'package:flutter/cupertino.dart';

import 'item_list_product_of_client.dart';

class ListProductsOfClints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: MediaQuery.of(context).size.height / 800,
          crossAxisSpacing: 8,
          mainAxisSpacing: 2),
      itemBuilder: (BuildContext context, int index) {
        return ItemListProductsOfClient();
      },
    );
  }
}
