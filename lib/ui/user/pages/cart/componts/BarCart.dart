import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/styels.dart';

class BarCart extends StatefulWidget {
  @override
  _BarCartState createState() => _BarCartState();
}

class _BarCartState extends State<BarCart> {
   String? currentValue;
   List<Widget>icons=[

   ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 10),
      decoration: BoxDecoration(
          color: KYellowColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'سلة الطلبات',
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 20,
              color: const Color(0xff200e32),
              letterSpacing: 0.15000000953674317,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric( horizontal: 8.0),
                    child: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Color(0xFF000000),
                      size: 15.0,
                    ),
                  ),
                  DropdownButton<String>(
                      hint: Text(" اختارالمحافظة",style: TextStyle(
                        fontFamily: 'home3',
                        fontSize: 9,

                        color: const Color(0xff383838),
                        fontWeight: FontWeight.w300,
                        height: 2,
                      ),),
                      isExpanded: false,
                      value: currentValue,
                      icon: Visibility(visible: false, child: SizedBox(),),
                      underline: SizedBox(),
                      onChanged: (value) {
                        setState(() {
                          currentValue = value!;
                        });
                      },
                      items: <String>['منزل العائلة', 'منزل القصيم ', 'منزل الاولاد']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              SvgPicture.asset("assets/icons/etite.svg",color: Colors.black,width: 9,
                              height: 9,),
                              SizedBox(width: 20,),
                          Text(
                            value,
                            style: TextStyle(
                              fontFamily: 'home3',
                              fontSize: 9,
                              color: const Color(0xff383838),
                              fontWeight: FontWeight.w300,
                              height: 2,
                            ),
                            textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                          ),
                            ],
                          ),
                        );
                      }).toList()),

                ],
              ),
              Text(
                ' التوصيل علي : ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'home3',
                  fontSize: 9,
                  color: const Color(0xff383838),
                  fontWeight: FontWeight.w300,
                  height: 2,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.left,
              ),

              SizedBox(
                width: 20,
              ),
              StylesWidget.getSvg("assets/icons/pin.svg", 15, 15)
            ],
          ),
        ],
      ),
    );
  }
}
