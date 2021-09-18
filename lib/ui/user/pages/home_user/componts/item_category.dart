import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';
import 'package:matbahk24/ui/user/pages/best_claint/best_claint_screen.dart';

class ItemCategory extends StatelessWidget {
  final Fields fields;


  ItemCategory({required this.fields});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                BestClientsScreen(fieldId: fields.id.toString()))
        );

      },
      child: Container(
        margin: EdgeInsets.all(3),
        width: 96.0,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.0),
          color: const Color(0xFFE2E2E2),
        ),
        child: // Adobe XD layer: 'Home' (text)
            Center(
          child: SizedBox(
            width: 60,

            child: Text(

              fields.name,
              maxLines: null,
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 11,
                color: const Color(0xff200e32),
                height: 1.4545454545454546,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
