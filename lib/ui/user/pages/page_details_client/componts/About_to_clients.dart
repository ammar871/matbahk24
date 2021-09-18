import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/data/models/ModelMarkets/model_markets.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';
import 'list_products_clients.dart';

class AboutToClients extends StatelessWidget {
  final Market markets;
  final List<Foods> foods;

  AboutToClients({required this.markets,required this.foods});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'نبذة',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 15,
                  color: const Color(0xffffd700),
                  letterSpacing: 0.11250000715255737,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Text(
             markets.summary,
              textAlign: TextAlign.right,
              style:  TextStyle(
                fontFamily: 'home',
                fontSize: 13,
                color: Colors.white,
                letterSpacing: 0.11250000715255737,
                fontWeight: FontWeight.w700,
              )
          ),

          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'الطبخات المعروضة للطلب',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 15,
                  color: const Color(0xffffd700),
                  letterSpacing: 0.11250000715255737,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ListProductsOfClints(foods:foods),
        ],
      ),
    );
  }
}