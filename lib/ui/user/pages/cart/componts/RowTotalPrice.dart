import 'package:flutter/cupertino.dart';

class RowTotalPrice extends StatelessWidget {
  const RowTotalPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(

            TextSpan(

                children: [
                  TextSpan(
                      text: ' ر.س ',

                      style: TextStyle(

                        fontFamily: 'home',
                        fontSize: 10,
                        color: const Color(0xffff0000),
                        fontWeight: FontWeight.w700,
                      )),
              TextSpan(
                text: '169.2 ',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 19,
                  color: const Color(0xffff0000),
                  fontWeight: FontWeight.w700,
                ),
              ),

            ]),
          ),
          Text(
            'المجموع',
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 10,
              color: const Color(0xff200e32),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}