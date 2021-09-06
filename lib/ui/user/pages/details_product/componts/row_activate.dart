import 'package:flutter/cupertino.dart';

class RowActivate extends StatelessWidget {
  const RowActivate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'منيرة الحاتم',
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
        SizedBox(
          width: 10,
        ),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff7cac21),
          ),
        ),
      ],
    );
  }
}