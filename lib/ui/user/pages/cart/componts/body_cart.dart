import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/styels.dart';
import 'package:matbahk24/widgets/default_button.dart';

import 'BarCart.dart';
import 'ContainerDetailsPrice.dart';
import 'DetailsCart.dart';
import 'ListCarts.dart';

class BodyCart extends StatefulWidget {
  @override
  _BodyCartState createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
  final CarouselController _controller = CarouselController();
  final List<String> imageList = [
    "assets/images/vis1.png",
    "assets/images/vis2.png",
    "assets/images/visa3.png",
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .60,
          child: SingleChildScrollView(
              child: Column(
            children: [
              BarCart(),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    DetailsCart(),
                    SizedBox(
                      height: 20,
                    ),
                    ListCarts()
                  ],
                ),
              )
            ],
          )),
        ),
        ContainerDetailsPrice(
          controller: _controller,
          images: imageList,
        )
      ],
    );
  }
}
















