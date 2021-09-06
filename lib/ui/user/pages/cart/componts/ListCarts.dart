import 'package:flutter/cupertino.dart';

import 'ItemCartList.dart';

class ListCarts extends StatelessWidget {
  const ListCarts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 20,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return ItemCartList();
          }),
    );
  }
}