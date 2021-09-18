import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/bussincc_logic/providers/user/add_to_cart/add_cart_provider.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/pages/cart/cart_screen.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:matbahk24/widgets/show_indicator.dart';
import 'package:provider/provider.dart';
import 'all_details_product.dart';

class BodyProductDetails extends StatefulWidget {
  final Foods foods;

  BodyProductDetails({required this.foods});

  @override
  _BodyProductDetailsState createState() => _BodyProductDetailsState();
}

class _BodyProductDetailsState extends State<BodyProductDetails> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            AllDetailsProducts(foods: widget.foods),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              width: double.infinity,
              color: Colors.black.withOpacity(.5),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.foods.food.price.toString(),
                      style: TextStyle(
                        fontFamily: 'home3',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                        letterSpacing: 0.11250000715255737,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DefaultButton(
                      colorText: Colors.black,
                      height: 40,
                      text: "أضف للسلة",
                      color: KYellowColor,
                      onPress: () {
                        showBottomSheetCart(context);
                      },
                    ),
                    SizedBox(height: 8),
                    // Adobe XD layer: '↳ ✏️ Label' (text)
                    Text(
                      'اضف للمفضلة',
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 16,
                        color: const Color(0xff989898),
                        height: 1,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showBottomSheetCart(BuildContext contexth) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext ctx, StateSetter sts) {
              return Container(
                  height: 280,
                  padding: EdgeInsets.only(
                    left: 5.0,
                    right: 5.0,
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  decoration: new BoxDecoration(
                      color: KYellowColor,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0))),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      children: [
                        // Adobe XD layer: '✏️ Page Title' (text)
                        Text(
                          'برجاء تحديد العدد',
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 20,
                            color: const Color(0xff022c43),
                            letterSpacing: 0.15000000953674317,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                sts(() {
                                  if (counter != 1) {
                                    counter--;
                                  }
                                });
                              },
                              height: 40,
                              color: Colors.white,
                              shape: CircleBorder(),
                              child: Icon(
                                Icons.remove,
                                color: Color(0xFF022C43),
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            // Adobe XD layer: '✏️ Page Title' (text)
                            Text(
                              "$counter",
                              style: TextStyle(
                                fontFamily: 'home',
                                fontSize: 40,
                                color: const Color(0xff022c43),
                                letterSpacing: 0.30000001907348633,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            MaterialButton(
                              onPressed: () {
                                sts(() {
                                  counter++;
                                });
                              },
                              height: 40,
                              color: Colors.white,
                              shape: CircleBorder(),
                              child: Icon(
                                Icons.add,
                                color: Color(0xFF022C43),
                                size: 30,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Container(
                          width: double.infinity,
                          height: 47,
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35)),
                              onPressed: () {
                                context.read<AddCartProvider>().addToCart(
                                    price: widget.foods.food.price.toString(),
                                    foodId: widget.foods.food.id.toString(),
                                    quantity: counter.toString());
                                Navigator.of(context).pop();
                                Navigator.of(contexth).pushNamed(cart_screen);
                                sts(() {

                                });
                              },
                              color: KBluColor,
                              child: context.watch<AddCartProvider>().isLoading
                                  ? ShowIndicator(
                                      color: Colors.white,
                                      width: 30,
                                      height: 30)
                                  : Text(
                                      "تابع الى السلة",
                                      style: TextStyle(
                                        fontFamily: 'home',
                                        fontSize: 17,
                                        color: Colors.white,
                                        letterSpacing: 0.8500000000000001,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'متابعة التسوق',
                            style: TextStyle(
                              fontFamily: 'home',
                              fontSize: 15,
                              color: const Color(0xff022c43),
                              letterSpacing: 0.11250000715255737,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ));
            },
          );
        });
  }
}
