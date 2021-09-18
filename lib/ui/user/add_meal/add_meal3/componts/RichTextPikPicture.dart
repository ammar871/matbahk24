import 'package:flutter/cupertino.dart';

class RichTextPikPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 15,
              color: const Color(0xff200e32),
              letterSpacing: 0.15000000953674317,
            ),
            children: [
              TextSpan(
                text: 'الصور',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: ' - حتي 5 صور',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 0.08250000524520874,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          textHeightBehavior:
          TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}