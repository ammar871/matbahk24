import 'package:flutter/cupertino.dart';

import 'item_category.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.0,
      child: Center(
        child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return ItemCategory();
            }),
      ),
    );
  }
}
