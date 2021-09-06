import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/rating_bar_best.dart';
import 'package:matbahk24/ui/user/pages/page_details_client/details_client_screen.dart';

import 'container_type.dart';

class ItemListBestClient extends StatelessWidget {
  const ItemListBestClient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(DetailsClientScreen.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Container(
              height: 66,
              width: 66,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                "assets/images/image2.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RatingBarBest(),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 80,
              child: Text(
                'ام تيسيير',
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
            ContainerType("سعودية")
          ],
        ),
      ),
    );
  }
}
