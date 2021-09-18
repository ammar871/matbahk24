import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

import 'componts/componts/BodyAddMeal2.dart';

class AddMeal2Screen extends StatelessWidget {
final String nameMeal,descMeal;
final List<String> fields;


AddMeal2Screen({required this.nameMeal, required this.descMeal, required this.fields});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return  Scaffold(
      appBar:  AppBar(
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
      body: BodyAddMeal2(nameMeal:nameMeal,descMeal:descMeal,fields:fields),
      backgroundColor: Color(0xffF2F4F3),
      endDrawer: MyDrawer(),
    );
  }
}
