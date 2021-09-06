import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/ui/user/pages/details_product/componts/row_activate.dart';

import 'image_product.dart';

class NameProductText extends StatelessWidget {
  const NameProductText({
    Key? key,
    required this.types,
  }) : super(key: key);

  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          RowActivate(),
          SizedBox(
            height: 10,
          ),
          // Adobe XD layer: '✏️ Page Title' (text)
          SizedBox(
            height: 80,
            child: Text(
              ' خروف محشي مشوي علي الطريقة '
                  'السعودية '
                  'الحائلية',
              maxLines: 3,
              style: TextStyle(
                fontFamily: 'home3',
                fontSize: 20,
                color: const Color(0xff200e32),
                letterSpacing: 0.15000000953674317,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          DescProductTexts(types: types),
          SizedBox(
            height: 18,
          ),
          ImageProduct(),
        ],
      ),
    );
  }
}

class TextDetails extends StatelessWidget {
  const TextDetails({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 12,
          fontFamily: "home3",
          color: Colors.white,
          letterSpacing: 0.09000000572204589,
        ),
      ),
    );
  }
}

class TitleTextOrder extends StatelessWidget {
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'home3',
              fontSize: 12,
              color: const Color(0xffffd700),
              letterSpacing: 0.09000000572204589,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  TitleTextOrder(this.text);
}

class TitleText extends StatelessWidget {
  final String text;

  TitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'home3',
              fontSize: 20,
              color: const Color(0xffffffff),
              letterSpacing: 0.15000000953674317,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
class DescProductTexts extends StatelessWidget {
  const DescProductTexts({
    Key? key,
    required this.types,
  }) : super(key: key);

  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "دقيقة 55",
            style: TextStyle(
              fontFamily: 'home3',
              fontSize: 10,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.underline,
              height: 2,
            ),
            textHeightBehavior:
            TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.right,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: types.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                e,
                style: TextStyle(
                  fontFamily: 'home3',
                  fontSize: 10,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.underline,
                  height: 2,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.right,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class DescOrder extends StatelessWidget {
  const DescOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
              children: [
                TitleTextOrder("طريقة التقديم "),
                SizedBox(
                  height: 10,
                ),
                TextDetails(
                  text:
                  "بصحن كبير2 كيلو غرام - يغلف بورق قصدير - اللحم المقدم طلي عربي و يوصل حار جاهز للاكل.",
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.symmetric(horizontal: .35),
          width: 2,
          color: Color(0xFF707070),
          height: 100,
        ),
        Expanded(
            child: Column(
              children: [
                TitleTextOrder("المرفقات "),
                SizedBox(
                  height: 10,
                ),
                TextDetails(
                  text:
                  "2 بيبسي - 4 دقوس - 2 لبن - 1 خدمة - 5مناديل - 4 مناشف - 9 صحون بلاستيك او ورقية",
                ),
              ],
            ))
      ],
    );
  }
}