import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/pages/page_details_client/componts/body_details_client.dart';
import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

class DetailsClientScreen extends StatelessWidget {
  static String id = "/details_client";
final String marketId;


  DetailsClientScreen({required this.marketId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBlack2Color,

      appBar:  AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.arrow_back,color: KBluColor,
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
      body: BodyDetailsClient(marketId:marketId),
      endDrawer: MyDrawer(),
    );
  }
}
