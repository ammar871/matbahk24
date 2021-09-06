import 'package:flutter/cupertino.dart';

class ImageProduct extends StatelessWidget {
  const ImageProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      height: 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "assets/images/image.png",
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}