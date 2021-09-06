import 'package:flutter/cupertino.dart';

import 'item_lasted_clints.dart';

class ListLastedClients extends StatelessWidget {
  const ListLastedClients({
    Key? key,
    required this.eats,
  }) : super(key: key);

  final List<String> eats;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return ItemLastedClients(eats: eats);
        });
  }
}
