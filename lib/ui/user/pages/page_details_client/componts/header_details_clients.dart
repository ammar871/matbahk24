import 'package:flutter/cupertino.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/rating_bar_best.dart';

import 'my_clipper.dart';

class HeaderDetailsClients extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              child: Image.asset(
                "assets/images/image.png",
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
          ),
          Positioned(
              bottom: -7,
              left: 0,
              right: 0,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          color: KBlack2Color, shape: BoxShape.circle),
                      child: Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/images/image2.png",
                              fit: BoxFit.cover,
                              height: 70,
                              width: 70,
                            )),
                      ),
                    ),

                    RatingBarBest(),
                    // Adobe XD layer: 'Home' (text)
                    Text(
                      'ام تيسيير',
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 25,
                        color: const Color(0xffffd700),
                        fontWeight: FontWeight.w700,
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}