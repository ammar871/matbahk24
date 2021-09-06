import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FieldUploadFills extends StatelessWidget {
  final String text;
  final Function onPress;
  bool isFound = false;

  FieldUploadFills(
      {required this.text, required this.onPress, required this.isFound});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(35)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: onPress(),
                    child: SvgPicture.asset("assets/icons/Icon_upload.svg")),
                Text(
                  text,
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
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isFound
                ? Text(
              'مقاس  200x200 px',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 8,
                color: const Color(0xff000000),
                height: 2.75,
              ),
              textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
            )
                : SizedBox(),
            SizedBox(
              width: 50,
            ),
            Text(
              '  jpg, png  تقبل الملفات من النوع-فقط',
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 8,
                color: const Color(0xff000000),
                height: 2.75,
              ),
              textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        )
      ],
    );
  }
}