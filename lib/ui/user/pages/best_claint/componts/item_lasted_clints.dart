import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/rating_bar_best.dart';
import 'package:matbahk24/ui/user/pages/page_details_client/details_client_screen.dart';

import 'container_type.dart';

class ItemLastedClients extends StatelessWidget {
  const ItemLastedClients({
    Key? key,
    required this.eats,
  }) : super(key: key);

  final List<String> eats;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(DetailsClientScreen.id);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE2E2E2),
                ))),
        margin: EdgeInsets.all(5),
        height: 80,
        child: Row(
          children: [
            Container(
              height: 110,

              child: SvgPicture.asset(
                  "assets/icons/icon_best.svg",height: 18,width: 18,),
            ),
            Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RatingBarBest(),
                          SizedBox(
                            width: 10,
                          ),
                          // Adobe XD layer: 'Home' (text)
                          Text(
                            'ام تيسيير',
                            style: TextStyle(
                              fontFamily: 'home',
                              fontSize: 12,
                              color: const Color(0xff200e32),
                              fontWeight: FontWeight.w700,
                              height: 1.4166666666666667,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: eats.map((e)  {
                              return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2),

                                  child: ContainerType(e));
                            }).toList(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // Adobe XD layer: 'Home' (text)
                          // Adobe XD layer: 'Home' (text)
                          SizedBox(
                            width: 17.0,
                            child: Text(
                              'اكلات',
                              style: TextStyle(
                                fontFamily: 'home',
                                fontSize: 6,
                                color: const Color(0xff200e32),
                                height: 2.8333333333333335,
                              ),
                              textHeightBehavior:
                              TextHeightBehavior(
                                  applyHeightToFirstAscent:
                                  false),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      )
                    ],
                  ),
                )),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                "assets/images/image2.png",
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}