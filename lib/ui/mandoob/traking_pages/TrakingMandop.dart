import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/mandoob/widgets_mandop/drraw/my_draw_mandop.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

import 'componts/BodyTrakingMandop.dart';

class TrakingMandop extends StatelessWidget {

static String id="/TrakingMandop";
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        leading: Center(
          child: Stack(
            children: [
              Positioned(
                top: 9,
                right: 0,
                child: Text(
                  '9',
                  style: TextStyle(
                    fontFamily: 'mons',
                    fontSize: 12,
                    color: const Color(0xffff0000),
                    fontWeight: FontWeight.w700,
                    height: 1.0833333333333333,
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 30,
                top: 0,
                bottom: 0,
                child: Icon(
                  Icons.notifications,
                  size: 20,
                ),
              )
            ],
          ),
        ),
        backgroundColor: KGreenColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichTextTitle(Colors.white),
          ],
        ),
      ),
      body: BodyTrakingMandop(),
      endDrawer: MyDrawMandop(),
    );
  }
}
