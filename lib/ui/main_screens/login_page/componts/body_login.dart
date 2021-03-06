import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/ui/main_screens/sign_up/sign_up_screen.dart';


import 'login_card.dart';

class BodyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                  right: -10,
                  top: 200,
                  child: SvgPicture.asset(
                    "assets/icons/path.svg",

                  ) ),
              Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  SvgPicture.asset(
                    "assets/icons/MainLogo.svg",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CardLogin(),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(SignUpScreen.id);
                    },
                    child: Text(
                      'اريد ان انشاء حساب جديد',
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 12,
                        color: const Color(0xff464646),
                        letterSpacing: 0.7000000000000001,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



