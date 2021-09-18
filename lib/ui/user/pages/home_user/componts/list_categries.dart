import 'package:flutter/cupertino.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';

import 'item_category.dart';

class ListCategories extends StatelessWidget {

  final List<Fields> fields;




  ListCategories({ required this.fields});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.0,
      child: Center(
        child: ListView.builder(
            itemCount: fields.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return ItemCategory(fields:fields[index]);
            }),
      ),
    );
  }
}
