import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

import 'componts/body_second_page.dart';

class SecondPage extends StatelessWidget {
  static String id = "/SecondPage";

  final String name, imag1, imageBanner;
  List<String> fileds;

  SecondPage(
      {required this.name,
      required this.imag1,
      required this.imageBanner,
      required this.fileds});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
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
      backgroundColor: Color(0xffF2F4F3),
      body: BodySecondPage(name:name,imag1 :imag1
          ,image2: imageBanner,fileds:fileds),
      endDrawer: MyDrawer(),
    );
  }
}
