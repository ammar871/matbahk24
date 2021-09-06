import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/pages/completd_order/CompleteOrderScreen.dart';
import 'package:matbahk24/widgets/default_button.dart';

import 'AddPaymentMethod.dart';
import 'RowTotalPrice.dart';
import 'SliderPayMethod.dart';
import 'TextsTotal.dart';

class ContainerDetailsPrice extends StatelessWidget {
  final List<String> images;
  final CarouselController controller;

  ContainerDetailsPrice({required this.images, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .28,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                TextsTotal(text1: "اجمالى الطلب", text2: "140"),
                SizedBox(
                  height: 5,
                ),
                TextsTotal(text1: "التوصيل", text2: "10"),
                SizedBox(
                  height: 5,
                ),
                TextsTotal(text1: "الضريبة", text2: "15"),
                SizedBox(
                  height: 5,
                ),
                TextsTotal(text1: "عموله 3 بالمية", text2: "1.2"),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          RowTotalPrice(),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: DefaultButton(
                height: 50,
                text: "التالى",
                onPress: () {
                  showBottomSheetPaymentCart(context);
                },
                color: KHomeColor,
                colorText: Colors.white),
          )
        ],
      ),
    );
  }

  void showBottomSheetPaymentCart(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext ctx, StateSetter sts) {
              return Container(
                  height: 350,
                  padding: EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  decoration: new BoxDecoration(
                      color: KYellowColor,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(30.0),
                          topRight: const Radius.circular(30.0))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      AddPaymentMethod(),
                      SliderPayMethod(images: images),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: DefaultButton(
                            height: 50,
                            text: "اتمم عملية الشراء",
                            onPress: () {
                              Navigator.of(context).pushNamed(CompleteOrderScreen.id);
                            },
                            color: KBluColor,
                            colorText: KYellowColor),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed(CompleteOrderScreen.id);
                        },
                        child: Text(
                          'الدفع عن الاستلام',
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 15,
                            color: const Color(0xff022c43),
                            letterSpacing: 0.11250000715255737,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ));
            },
          );
        });
  }
}