import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/ui/main_screens/sign_up/componts/form_sign_up.dart';

class CardSignUp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text(
                'حساب جديد',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 32,
                  color: const Color(0xff200e32),
                  height: 1.40625,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
              FormSignUp(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
