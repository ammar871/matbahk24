import 'package:flutter/cupertino.dart';

import 'item_list_best_clients.dart';

class ListBestClients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return ItemListBestClient();
          }),
    );
  }
}