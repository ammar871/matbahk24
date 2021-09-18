import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowIndicator extends StatelessWidget {
  final Color color;
 final double width ,height;


  ShowIndicator({required this.color, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return    Container(
        width: width,
        height: height,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 4,
            color: color,
          ),
        ),
      );

  }
}
