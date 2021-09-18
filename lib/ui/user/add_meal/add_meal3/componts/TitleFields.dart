import 'package:flutter/cupertino.dart';

class TitleFields extends StatelessWidget {
  final String text;

  TitleFields(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'home',
            fontSize: 15,
            color: const Color(0xff200e32),
            letterSpacing: 0.15000000953674317,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.right,
        )
      ],
    );
  }
}
