import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/data/models/ModelMarkets/model_markets.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/rating_bar_best.dart';
import 'package:matbahk24/ui/user/pages/page_details_client/details_client_screen.dart';

import 'container_type.dart';

class ItemListBestClient extends StatelessWidget {
final ModelMarkets market;


ItemListBestClient({required this.market});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                DetailsClientScreen(marketId: market.market.id.toString()))
        );
      },
      child: Container(

        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Container(
              height: 66,
              width: 66,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: market.market.image.isEmpty?Container(
                child: Center(
                    child: Icon(
                      Icons.error,
                      size: 25,
                    )),
              ): Container(
                height: 66,
                width: 66,
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl:  base_url_image + market.market.image,
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
            ),
            SizedBox(
              height: 10,
            ),
            RatingBarBest(rate:market.market.rate),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 80,
              child: Text(
                market.market.title,
                maxLines: 2,
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 10,
                  color: const Color(0xff200e32),
                  fontWeight: FontWeight.w700,
                  height: 1.7,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
           // Row(
           //   children: market.fields.map((e) =>  ContainerType(e.name)).toList(),
           // ),
            market.fields.length > 0?  Container(
                margin: EdgeInsets.symmetric(horizontal: 2),
                child: ContainerType(market.fields[0].name)):SizedBox()
          ],
        ),
      ),
    );
  }
}
