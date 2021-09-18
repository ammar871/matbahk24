import 'package:flutter/cupertino.dart';
import 'package:matbahk24/data/models/ModelMarkets/model_markets.dart';

import 'item_list_best_clients.dart';

class ListBestClients extends StatelessWidget {

  final List<ModelMarkets> list;


  ListBestClients({required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 160,
      child: ListView.builder(
          itemCount: list.length<=5?list.length:5,
          shrinkWrap: true,

          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return ItemListBestClient(market:list[index]);
          }),
    );
  }
}