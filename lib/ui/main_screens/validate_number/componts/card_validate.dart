import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'otp_form.dart';

class CardValidate extends StatelessWidget {
  final String code, phone;


  CardValidate({required this.code,required this.phone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 2.5,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/icons/validate_icon.svg",
              ),
              Text(
                ' ادخل رمز التحقق المرسل : $code',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 16,
                  color: const Color(0xff878787),
                  letterSpacing: 0.8,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              OtpForm(code:code,phone:phone),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "1:59",
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 18,
                      color: const Color(0xff878787),
                      letterSpacing: 0.9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 10),


                  Text(
                    'ارسل رمز جديد',
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 16,
                      color: const Color(0xff878787),
                      letterSpacing: 0.8,
                    ),
                    textAlign: TextAlign.center,
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
