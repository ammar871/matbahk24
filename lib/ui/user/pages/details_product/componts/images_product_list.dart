import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagesProductsList extends StatelessWidget {

int? posstion;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, indes) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.symmetric(horizontal: 3.5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/img.png",
                fit: BoxFit.cover,
                height: 68,
                width: 80,
              ),
            ),
          );
        });
  }
}

