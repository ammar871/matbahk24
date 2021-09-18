import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';
import 'package:matbahk24/helpers/constans.dart';

import 'image_product.dart';

class ImagesProductsList extends StatefulWidget {
final List<Photos>photos;

ImagesProductsList({required this.photos});

  @override
  _ImagesProductsListState createState() => _ImagesProductsListState();
}

// Adobe XD layer: '01' (shape)


class _ImagesProductsListState extends State<ImagesProductsList> {
  int? posstion=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageProduct(photo :widget.photos[posstion!].url),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 70,
          child: ListView.builder(
              itemCount:widget.photos.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return  InkWell(
                  onTap: (){
                    setState(() {
                      posstion=index;
                    });
                  },
                  child: Container(

                    decoration: BoxDecoration(
                      boxShadow: posstion==index?[
                        BoxShadow(
                          color: const Color(0xd9000000),
                          offset: Offset(0, 9),
                          blurRadius: 4,
                        ),
                      ]:null,
                       borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.symmetric(horizontal: 3.5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl:  base_url_image + widget.photos[index].url,
                          height:posstion==index?70: 68,
                          width: posstion==index?82:80,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: Container(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => Container(
                            height: 68,
                            width: 80,
                            child: Center(
                                child: Icon(
                                  Icons.error,
                                  size: 25,
                                ))),
                      )/*Image.asset(
                        "assets/images/img.png",
                        fit: BoxFit.cover,
                        height: 68,
                        width: 80,
                      )*/,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

