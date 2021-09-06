import 'package:flutter/cupertino.dart';

class RichTextCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontFamily: 'home',
          fontSize: 10,
          color: const Color(0xff464646),
          height: 1.7,
        ),
        children: [
          TextSpan(
            text: 'هناك مايزيد عن 50 فئة اضغط ',
          ),
          TextSpan(
            text: 'هنا ',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: 'لتصفحهم جميعا',
          ),
        ],
      ),
      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
      textAlign: TextAlign.center,
    );
  }
}