import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'list_products_clients.dart';

class AboutToClients extends StatelessWidget {
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
              "انا ام تيسيير أستاذة في الطبخ السعودي و الخليجي بوجه عام . احب الاكلات اللبنانية و اقدمها لكم بأفضل الصور. جرب اكلاتي و لن تنساها طالما حييت. حتي في منامك .",
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
          ListProductsOfClints(),
        ],
      ),
    );
  }
}