import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemCartList extends StatelessWidget {
  const ItemCartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          border: Border(
              bottom:
              BorderSide(width: 1, color: Colors.black.withOpacity(.1)))),
      child: Row(
        children: [
          Text(
            '12\nرس',
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 10,
              color: const Color(0xa8ff0000),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'بيتزا خضروات',
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 10,
                        color: const Color(0xff200e32),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset("assets/icons/etite.svg"),
                        SizedBox(
                          width: 10,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "12",
                            style: // Adobe XD layer: 'Travel' (text)
                            TextStyle(
                              fontFamily: 'home',
                              fontSize: 10,
                              color: const Color(0xa8000000),
                            ),
                          ),
                          TextSpan(
                            text: " ر.س ",
                            style: // Adobe XD layer: 'Travel' (text)
                            TextStyle(
                              fontFamily: 'home',
                              fontSize: 10,
                              color: const Color(0xa8000000),
                            ),
                          ),
                          TextSpan(
                            text: " X ",
                            style: // Adobe XD layer: 'Travel' (text)
                            TextStyle(
                              fontFamily: 'home',
                              fontSize: 10,
                              color: const Color(0xa8000000),
                            ),
                          ),
                          TextSpan(
                            text: "1",
                            style: TextStyle(
                              fontFamily: 'home',
                              fontSize: 10,
                              color: const Color(0xa8000000),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]))
                      ],
                    )
                  ],
                ),
              )),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/image.png",
              height: 70,
              width: 100,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}