import 'package:flutter/cupertino.dart';

class DetailsCart extends StatelessWidget {
  const DetailsCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'قبل البدء في خطوات إتمام الطلب برجاء مراجعة الطلب جيدا و كذلك يتعين عليك مراجعة الأسعار و الكميات و المرفقات لكل طلب ',
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
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'تفاصيل طلبك',
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
      ],
    );
  }
}