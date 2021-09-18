import 'package:flutter/cupertino.dart';

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