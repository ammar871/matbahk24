import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/data/models/ModelMarkets/model_markets.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/rating_bar_best.dart';

import 'my_clipper.dart';

class HeaderDetailsClients extends StatelessWidget {
  final Market market;

  HeaderDetailsClients({required this.market});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      child: Stack(
        children: [
          ClipPath(
              clipper: MyClipper(),
              child: market.bannarImage == "" && market.bannarImage.isEmpty
                  ? Container(
                      height: 250,
                      padding: EdgeInsets.only(top: 30),
                      child: Center(
                          child: Icon(
                        Icons.error,
                        size: 25,
                      )),
                    )
                  : CachedNetworkImage(
                      imageUrl: base_url_image + market.bannarImage,
                      height: 250,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: Container(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => Container(
                          height: 250,
                          child: Center(
                              child: Icon(
                            Icons.error,
                            size: 25,
                          ))),
                    )

              /*Container(
              child: Image.asset(
                "assets/images/image.png",
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),*/
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
                            child:
                            market.image == "" && market.image.isEmpty
                                ? Container(
                              height: 70,
                              width: 70,

                              child: Center(
                                  child: Icon(
                                    Icons.error,
                                    size: 25,
                                  )),
                            )
                                : CachedNetworkImage(
                              imageUrl: base_url_image + market.image,
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                child: Container(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator()),
                              ),
                              errorWidget: (context, url, error) => Container(
                                  height: 70,
                                  width: 70,
                                  child: Center(
                                      child: Icon(
                                        Icons.error,
                                        size: 25,
                                      ))),
                            )

                          /*Image.asset(
                              "assets/images/image2.png",
                              fit: BoxFit.cover,
                              height: 70,
                              width: 70,
                            )*/),
                      ),
                    ),

                    RatingBarBest(
                      rate: market.rate,
                    ),
                    // Adobe XD layer: 'Home' (text)
                    SizedBox(
                      height: 45,
                      child: Text(
                        market.title,
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
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
