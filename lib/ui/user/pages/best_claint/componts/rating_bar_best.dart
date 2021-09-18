import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:matbahk24/helpers/constans.dart';

class RatingBarBest extends StatelessWidget {
final int rate;


RatingBarBest({required this.rate});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: 11,
      initialRating: rate.toDouble(),
      direction: Axis.horizontal,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: KYellowColor,
        ),
        half: Icon(Icons.star_border, color: KYellowColor),
        empty: Icon(Icons.star_border, color: KYellowColor),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}