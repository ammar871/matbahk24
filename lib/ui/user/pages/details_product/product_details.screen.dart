import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

import 'componts/body_product_details.dart';

class ProductDetailsScreen extends StatelessWidget {

  final Foods food;


  ProductDetailsScreen({required this.food});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      backgroundColor: KBlack2Color,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: KBluColor,
          ),
        ),
        backgroundColor: KYellowColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichTextTitle(Color(0xff000000)),
          ],
        ),
      ),
      body: BodyProductDetails(foods:food),
      endDrawer: MyDrawer(),
    );
  }
}
