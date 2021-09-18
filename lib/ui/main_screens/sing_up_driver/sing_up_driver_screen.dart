import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matbahk24/ui/main_screens/complete_accounte_screen/componts/body_complete.dart';
import 'package:matbahk24/ui/main_screens/sing_up_driver/componts/card_driver.dart';

class SignUpDriverScreen extends StatelessWidget {
  const SignUpDriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                right: -10,
                top: 200,
                child: SvgPicture.asset(
                  "assets/icons/path2.svg",

                ) ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 110,
                  ),
                  SvgPicture.asset(
                    "assets/icons/MainLogo.svg",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CardSignDriver(),
                  SizedBox(
                    height: 8,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
