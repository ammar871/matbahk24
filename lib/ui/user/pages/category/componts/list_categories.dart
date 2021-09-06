import 'package:flutter/cupertino.dart';

import 'item_list_categories.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 21,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: MediaQuery.of(context).size.height / 800,
            crossAxisSpacing: .5,
            mainAxisSpacing: 1),
        itemBuilder: (BuildContext context, int index) {
          return ItemListCategories();
        },
      ),
    );
  }
}
