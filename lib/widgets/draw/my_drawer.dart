

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/shared_editor.dart';
import 'package:matbahk24/helpers/styels.dart';

import '../rich_title_text.dart';
import 'clipper_path.dart';
import 'item_draw.dart';

class MyDrawer extends StatelessWidget {
ShardEditor shardEditor=ShardEditor();

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
            color: Color(0xFFF5833C),
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
                        onTap: (){
                          shardEditor.remove(UserLogin);
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(login_screen);

                        } ,
                        child: StylesWidget.getSvg(
                            "assets/icons/cancel.svg", 30, 30)),
                  ],
                ),
                Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        ItemDraw(
                            icon: "home_draw.svg",
                            text: "الرئيسية",
                            press: () {},
                            color: Colors.white),
                        SizedBox(
                          height: 10,
                        ),
                        ItemDraw(
                            icon: "category_draw.svg",
                            text: "الفئات",
                            press: () {},
                            color: Colors.white),
                        SizedBox(
                          height: 10,
                        ),
                        ItemDraw(
                            icon: "fav.svg",
                            text: "المفضلة",
                            press: () {},
                            color: Colors.white),
                        SizedBox(
                          height: 10,
                        ),
                        ItemDraw(
                            icon: "Notification_draw.svg",
                            text: "التنبيهات",
                            press: () {},
                            color: Colors.white),
                        SizedBox(
                          height: 10,
                        ),
                        ItemDraw(
                            icon: "Wallet.svg",
                            text: "محفظتي",
                            press: () {},
                            color: Colors.white),
                        SizedBox(
                          height: 10,
                        ),
                        ItemDraw(
                            icon: "order.svg",
                            text: "الطلبات",
                            press: () {},
                            color: Colors.white),
                        SizedBox(
                          height: 10,
                        ),
                        ItemDraw(
                            icon: "Location.svg",
                            text: "عناويني",
                            press: () {},
                            color: Colors.white),
                        SizedBox(
                          height: 10,
                        ),
                        ItemDraw(
                          icon: "Profile.svg",
                          text: "بيانات الحساب",
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
                  height: 70,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}