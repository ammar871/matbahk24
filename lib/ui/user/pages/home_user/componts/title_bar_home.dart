import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/styels.dart';

class BarHomeUser extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 10),
      decoration: BoxDecoration(
          color: KYellowColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Column(
        children: [

          Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            height: 35,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'اكتب اسم المقدم الذي تبحث عنه',
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 12,
                      color: const Color(0xffb7bec6),
                      height: 1.4285714285714286,
                    ),
                    textHeightBehavior: TextHeightBehavior(
                        applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.search, color: const Color(0xffb7bec6)),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مقدمي خدمة في منطقتي و مناطق قريبة',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 9,
                  color: const Color(0xff200e32),
                  height: 2,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: 20,
              ),
              StylesWidget.getSvg("assets/icons/pin.svg", 15, 15)
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}