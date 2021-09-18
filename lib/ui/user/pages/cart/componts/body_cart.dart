import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:matbahk24/bussincc_logic/providers/user/get_carts_provider/get_carts_provider.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/widgets/show_indicator.dart';

import 'BarCart.dart';
import 'ContainerDetailsPrice.dart';
import 'DetailsCart.dart';
import 'ListCarts.dart';
import 'package:provider/provider.dart';

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

  getData() {
    Future.delayed(Duration(milliseconds: 100), () async {
      context.read<GetCartProvider>().getCarts();
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
                   context.watch<GetCartProvider>().isLeading?ShowIndicator(color: KHomeColor,
                       width: 50, height: 50): ListCarts(carts:context.watch<GetCartProvider>().carts)
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
