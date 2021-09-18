import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/pages/details_product/product_details.screen.dart';

class ItemProduct extends StatelessWidget {
  final Foods foods;

  ItemProduct({required this.foods});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                ProductDetailsScreen(food: foods)));


      },
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 110,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: foods.photos.length == 0 ?Container(
                        height: 110,
                        child: Center(
                          child: Center(
                            child: Icon(
                              Icons.error,
                              size: 25,
                            ))
                        ),
                      ):CachedNetworkImage(
                        imageUrl:  base_url_image + foods.photos[0].url,
                        height: 110,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: Container(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => Container(
                            height: 110,
                            child: Center(
                                child: Icon(
                              Icons.error,
                              size: 25,
                            ))),
                      ),
                      // :foods.photos.length==0? Image.asset("assets/images/img.png",
                      //
                      //
                      //   height: 110,
                      //   fit: BoxFit.cover,
                      // )
                      //
                      // :Image.network(base_url_image+foods.photos[0].url,
                      //
                      //
                      //   height: 110,
                      //   fit: BoxFit.cover,
                      // ),
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
                            '${foods.food.price}\n رس',
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
              foods.food.name,
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
              'سوري . حلويات شرقية',
              textDirection: TextDirection.rtl,
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
