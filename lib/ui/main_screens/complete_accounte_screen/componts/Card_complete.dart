import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/ui/main_screens/complete_accounte_screen/componts/form_comlete.dart';

class CardComplete extends StatelessWidget {
final String phone;


CardComplete({required this.phone});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                'بيانات الحساب',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 32,
                  color: const Color(0xff200e32),

                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
              FormCompleted(phone:phone),
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
