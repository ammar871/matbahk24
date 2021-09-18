import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matbahk24/data/models/ModelMarkets/model_markets.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/rating_bar_best.dart';
import 'package:matbahk24/ui/user/pages/page_details_client/details_client_screen.dart';

import 'container_type.dart';

class ItemLastedClients extends StatelessWidget {
  final ModelMarkets marker;

  ItemLastedClients({required this.marker});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsClientScreen(
                    marketId: marker.market.id.toString())));
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
                "assets/icons/icon_best.svg",
                height: 18,
                width: 18,
              ),
            ),
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RatingBarBest(
                        rate: marker.market.rate,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Adobe XD layer: 'Home' (text)
                      Text(
                        marker.market.title,
                        style: TextStyle(
                          fontFamily: 'home',
                          fontSize: 12,
                          color: const Color(0xff200e32),
                          fontWeight: FontWeight.w700,
                          height: 1.4166666666666667,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
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
                    marker.fields.length > 0?  Container(
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          child: ContainerType(marker.fields[0].name)):SizedBox()
                  /*    Row(
                        mainAxisSize: MainAxisSize.min,
                        children: marker.fields
                            .map((e) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                child: ContainerType(e.name)))
                            .toList(),
                      )*/,
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
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
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
              height: 66,
              width: 66,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: marker.market.image.isEmpty
                  ? Container(
                      child: Center(
                          child: Icon(
                        Icons.error,
                        size: 25,
                      )),
                    )
                  : Container(
                      height: 66,
                      width: 66,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          imageUrl: base_url_image + marker.market.image,
                          height: 66,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: Container(
                                width: 25,
                                height: 25,
                                child: CircularProgressIndicator()),
                          ),
                          errorWidget: (context, url, error) => Container(
                              height: 66,
                              child: Center(
                                  child: Icon(
                                Icons.error,
                                size: 25,
                              ))),
                        ),
                      ),
                    ),

              /*Image.asset(
                "assets/images/image2.png",
                fit: BoxFit.cover,
              )*/
            )
          ],
        ),
      ),
    );
  }
}
