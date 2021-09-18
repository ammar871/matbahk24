import 'package:flutter/cupertino.dart';
import 'package:matbahk24/data/models/ModelMarkets/model_markets.dart';

import 'item_lasted_clints.dart';

class ListLastedClients extends StatelessWidget {

  final List<ModelMarkets> list;


  ListLastedClients({required this.list});



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return ItemLastedClients(marker: list[index]);
        });
  }
}
