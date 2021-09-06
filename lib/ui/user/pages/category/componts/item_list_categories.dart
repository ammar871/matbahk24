import 'package:flutter/cupertino.dart';
import 'package:matbahk24/ui/user/pages/best_claint/best_claint_screen.dart';

class ItemListCategories extends StatelessWidget {
  const ItemListCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(BestClientsScreen.id);
      },
      child: Container(
        margin: EdgeInsets.all(2),
        width: 107.0,
        height: 106.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.0),
          color: const Color(0xFFE2E2E2),
        ),
        child: // Adobe XD layer: 'Home' (text)
            Center(
          child: Text(
            'طبخات سعودية',
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
    );
  }
}
