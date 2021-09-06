import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/styels.dart';

import 'package:matbahk24/widgets/draw/clipper_path.dart';
import 'package:matbahk24/widgets/draw/item_draw.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

class MyDrawMandop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      child: ClipPath(
        clipper: MyClipperDraw(),
        child: Container(
          height: 300.0,
          decoration: BoxDecoration(
            color: KGreenColor,
            //image: DecorationImage(image: NetworkImage('https://www.viajejet.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada-1440x810.jpg'))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichTextTitle(Colors.white),
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: StylesWidget.getSvg(
                            "assets/icons/cancel.svg", 30, 30)),
                  ],
                ),
                Expanded(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    DetialsStatusMandopDraw(),


                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [


                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'اسم الدخول',
                                  style: TextStyle(
                                    fontFamily: 'home3',
                                    fontSize: 10,
                                    color: const Color(0xffffdd2c),
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 3),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'GamalSamer99',
                                      style: TextStyle(
                                        fontFamily: 'home3',
                                        fontSize: 14,
                                        color: const Color(0xffffffff),
                                        letterSpacing: 0.7000000000000001,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),

                                  ],
                                )
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'الحالة',
                                  style: TextStyle(
                                    fontFamily: 'home3',
                                    fontSize: 10,
                                    color: const Color(0xffffdd2c),
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 3),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'متصل',
                                      style: TextStyle(
                                        fontFamily: 'home3',
                                        fontSize: 14,
                                        color: const Color(0xffffffff),
                                        letterSpacing: 0.7000000000000001,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(

                                        borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                                        color: const Color(0xff7cac21),
                                        border: Border.all(width: 1.0, color: const Color(0xffffffff)),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'عدد الطلبات',
                                  style: TextStyle(
                                    fontFamily: 'home3',
                                    fontSize: 10,
                                    color: const Color(0xffffdd2c),
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 3),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '120 طلب ناجح ',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontFamily: 'home3',
                                        fontSize: 14,
                                        color: const Color(0xffffffff),
                                        letterSpacing: 0.7000000000000001,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),

                                  ],
                                )
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'الرصيد',
                                  style: TextStyle(
                                    fontFamily: 'home3',
                                    fontSize: 10,
                                    color: const Color(0xffffdd2c),
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 3),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      ' 980 رس',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontFamily: 'home3',
                                        fontSize: 14,
                                        color: const Color(0xffffffff),
                                        letterSpacing: 0.7000000000000001,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),


                                  ],
                                )
                              ],
                            ),



                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ItemDraw(
                        icon: "home_draw.svg",
                        text: "الرئيسية",
                        press: () {},
                        color: Colors.white),
                    SizedBox(
                      height: 5,
                    ),
                    ItemDraw(
                        icon: "category_draw.svg",
                        text: "حسابي",
                        press: () {},
                        color: Colors.white),
                    SizedBox(
                      height: 5,
                    ),
                    ItemDraw(
                        icon: "Notification_draw.svg",
                        text: "التنبيهات",
                        press: () {},
                        color: Colors.white),
                    SizedBox(
                      height:5,
                    ),
                    ItemDraw(
                        icon: "Wallet.svg",
                        text: "محفظتي",
                        press: () {},
                        color: Colors.white),
                    SizedBox(
                      height: 5,
                    ),
                    ItemDraw(
                        icon: "order.svg",
                        text: "الطلبات",
                        press: () {},
                        color: Colors.white),
                    SizedBox(
                      height: 5,
                    ),
                    ItemDraw(
                        icon: "Location.svg",
                        text: "عناويني",
                        press: () {},
                        color: Colors.white),
                    SizedBox(
                      height: 5,
                    ),
                    ItemDraw(
                      icon: "sitting.svg",
                      text: "اعدات التطبيق",
                      press: () {},
                      color: Colors.white,
                    ),
                  ],
                )),
                ItemDraw(
                  icon: "logout.svg",
                  text: "تسجيل الخروج ",
                  press: () {},
                  color: Color(0xffffdd2c),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetialsStatusMandopDraw extends StatelessWidget {
  const DetialsStatusMandopDraw({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        Column(
          children: [
            Text(
              'جمال سامر',
              style: TextStyle(
                fontFamily: 'home3',
                fontSize: 14,
                color: const Color(0xffffffff),
                letterSpacing: 0.7000000000000001,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 8,),
            Text(
              'رقم 2522369',
              textDirection: TextDirection.rtl,
              style: TextStyle(

                fontFamily: 'home3',
                fontSize: 14,
                color: const Color(0xffffffff),
                letterSpacing: 0.7000000000000001,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
        SizedBox(
          width: 10,
        ),
        LogoDrawMandop(),

      ],
    );
  }
}

class LogoDrawMandop extends StatelessWidget {
  const LogoDrawMandop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/images/person.png",
              height: 59,
              width: 59,
            ),
          ),
          Positioned(
              right: 8,
              top: 5,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    border: Border.all(
                        color: Colors.white, width: 1)),
              ))
        ],
      ),
    );
  }
}
