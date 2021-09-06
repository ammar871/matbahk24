import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/pages/details_product/product_details.screen.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(ProductDetailsScreen.id);
      },
      child: Container(
        decoration: BoxDecoration(

        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/image.png",
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      color: KYellowColor,
                      child: Column(
                        children: [
                          Text(
                            '980\n رس',
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 10,
                              color: Color(0xff1d1d1d),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'خروف محشي ',
              style: TextStyle(
                fontFamily: 'home3',
                fontSize: 12,
                color: const Color(0xff7cac21),
                fontWeight: FontWeight.w700,
                height: 1.0833333333333333,
              ),
              textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'سوري    .   حلويات شرقية',
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 8,
                color: const Color(0x9e1d1d1d),
                height: 1.7142857142857142,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}