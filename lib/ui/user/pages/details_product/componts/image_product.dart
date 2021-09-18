import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';

class ImageProduct extends StatelessWidget {
final String photo;


ImageProduct({required this.photo});

  @override
  Widget build(BuildContext context) {

    return photo.isEmpty?Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      height: 180,
      child: Center(
        child: // Adobe XD layer: '✏️ Page Title' (text)
        Text(
          'صورة غير صالحة',
          style: TextStyle(
            fontFamily: 'home',
            fontSize: 20,
            color: const Color(0xffffffff),
            letterSpacing: 0.15000000953674317,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    ): Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      height: 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child:CachedNetworkImage(
          imageUrl:  base_url_image + photo,
          height:  180,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: Container(
                width: 25,
                height: 25,
                child: CircularProgressIndicator()),
          ),
          errorWidget: (context, url, error) => Container(
              height: 180,
              child: Center(
                  child: Icon(
                    Icons.error,
                    size: 25,
                  ))),
        )


        /* Image.asset(
          "assets/images/image.png",
          height: 200,
          fit: BoxFit.cover,
        )*/,
      ),
    );
  }
}