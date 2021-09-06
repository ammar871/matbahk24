import 'package:flutter/cupertino.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/pages/details_product/componts/texts_details.dart';

import 'images_product_list.dart';
import 'my_custom_clipper.dart';

class AllDetailsProducts extends StatelessWidget {
  const AllDetailsProducts({
    Key? key,
    required this.types,
    required this.dec,
  }) : super(key: key);

  final List<String> types;
  final String dec;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .47,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 320,
                    color: KYellowColor,
                  ),
                  clipper: MyCustomClipper(),
                ),
              ),
              NameProductText(types: types),
            ],
          ),
        ),
        Container(
          height: 70,
          child: ImagesProductsList(),
        ),
        SizedBox(
          height: 20,
        ),
        TitleText('وصف عام'),
        SizedBox(
          height: 15,
        ),
        TextDetails(
            text: '$dec\n'
                'البرياني هو طبق من اللحم والخضروات المطهية مع الأرز والذي تُستخدم في طهيه خلطة بهـارات البرياني الهندية، وهو اسم يُطلق في شبه القارة الهندية على الأرز الذي يُطهى بطرق مخصوصة'),
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
                'افراد  6',
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
        DescOrder(),
        SizedBox(
          height: 15,
        ),
        TitleTextOrder('ملاحظات'),
        SizedBox(
          height: 10,
        ),
        TextDetails(
          text:
          "بامكانك طلبه حار مع فلفل اترك أي ملاحظات في خانه الملاحظات اثناء الطلب",
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}