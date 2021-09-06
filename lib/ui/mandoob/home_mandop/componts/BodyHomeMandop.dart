import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/ui/mandoob/widgets_mandop/bar_mandop.dart';

import 'ListCurrentOrders.dart';
import 'ListFinshedOrders.dart';

class BodyHomeMandop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarMandop(
            text1: "اهلا بك : محمد سالم",
            text2: "",
            isfound: false,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'طلبات قيد الانتظار',
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 20,
                        color: const Color(0xff200e32),
                        letterSpacing: 0.15000000953674317,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                Text(
                  'هذه قائمة بطلبات قيد الانتظار اذا اردت قبول احدها بامكانك الضغط علي قبول وسوف تبدا عملية التوصيل',
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 10,
                    color: const Color(0x99000000),
                    height: 2.2,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.right,
                ),
                ListCurrentOrders(),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'المزيد',
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 10,
                    color: const Color(0x99000000),
                    height: 2.2,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'طلبات سابقة لك',
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 20,
                            color: const Color(0xff200e32),
                            letterSpacing: 0.15000000953674317,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        // Adobe XD layer: 'Food' (text)
                        Text(
                          'هنا قائمة باخر الطلبات التي قمت بالتفاعل معها ',
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 10,
                            color: const Color(0x99000000),
                            height: 2.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ListFinshedOrders(),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'المزيد',
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 10,
                    color: const Color(0x99000000),
                    height: 2.2,
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}






