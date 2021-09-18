import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/pages/details_product/componts/texts_details.dart';

import 'TitleText.dart';
import 'images_product_list.dart';
import 'my_custom_clipper.dart';

class AllDetailsProducts extends StatelessWidget {
 final Foods foods;


 AllDetailsProducts({required this.foods});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          height: MediaQuery.of(context).size.height * .56,
          child: Stack(
            children: [
              Positioned(

                top: 0,
                child: ClipPath(
                  child: Container(

                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width*.83,
                    color: KYellowColor,
                  ),
                  clipper: MyCustomClipper(),
                ),
              ),
              NameProductText(food: foods),
              Positioned(
                  bottom:0,
                  left: 0,
                  right: 0,
                  child: ImagesProductsList(photos:foods.photos)),
            ],

          ),
        ),



        SizedBox(
          height: 20,
        ),
        TitleText('وصف عام'),
        SizedBox(
          height: 15,
        ),
        TextDetails(
            text: foods.food.desc),
        SizedBox(
          height: 25,
        ),
        TitleText('وصف الطلب'),
        SizedBox(
          height: 15,
        ),
        TitleTextOrder("الحجم "),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "${foods.food.persons} افراد ",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'home3',
                  fontSize: 12,
                  color: const Color(0xffffffff),
                  letterSpacing: 0.09000000572204589,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        DescWayOrder(foods.food),
        SizedBox(
          height: 15,
        ),
        TitleTextOrder('ملاحظات'),
        SizedBox(
          height: 10,
        ),
        TextDetails(
          text:
          foods.food.notes,
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}