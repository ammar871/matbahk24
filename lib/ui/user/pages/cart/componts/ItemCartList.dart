import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matbahk24/bussincc_logic/providers/user/update_cart_provider/update_cart_provider.dart';
import 'package:matbahk24/data/models/cart_model/get_cart_model.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:provider/provider.dart';

class ItemCartList extends StatefulWidget {
  final CartModel cart;

  ItemCartList({required this.cart});

  @override
  _ItemCartListState createState() => _ItemCartListState();
}

class _ItemCartListState extends State<ItemCartList> {
 late int counter ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.cart.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Colors.black.withOpacity(.1)))),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "  ${widget.cart.food.food.price * counter} رس ",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 10,
                  color: const Color(0xa8ff0000),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (counter > 0)counter--;
                        setState(() {});
                        context.read<UpdateCartProvider>().updateCart(
                            status: 0.toString(),
                            idCart: widget.cart.id.toString());

                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.remove,
                          color: Color(0xFF022C43),
                          size: 15,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 5,
                    ),
                    // Adobe XD layer: '✏️ Page Title' (text)
                    Text(
                      counter.toString(),
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 12,
                        color: const Color(0xff022c43),
                        letterSpacing: 0.30000001907348633,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        counter++;
                        setState(() {

                        });
                        context
                            .read<UpdateCartProvider>()
                            .updateCart(
                                status: 1.toString(),
                                idCart: widget.cart.id.toString())
                            ;
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.add,
                          color: Color(0xFF022C43),
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.cart.food.food.name}",
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 10,
                    color: const Color(0xff200e32),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset("assets/icons/etite.svg"),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.cart.food.food.price} ر.س ",
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 10,
                            color: const Color(0xa8000000),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "x",
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 12,
                            color: const Color(0xa8000000),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.cart.quantity.toString(),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 10,
                            color: const Color(0xa8000000),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: widget.cart.food.photos.length == 0
                ? Container(
                    height: 110,
                    child: Center(
                        child: Center(
                            child: Icon(
                      Icons.error,
                      size: 25,
                    ))),
                  )
                : CachedNetworkImage(
                    imageUrl: base_url_image + widget.cart.food.photos[0].url,
                    height: 70,
                    width: 100,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: Container(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                        height: 70,
                        width: 100,
                        child: Center(
                            child: Icon(
                          Icons.error,
                          size: 25,
                        ))),
                  )

            /*Image.asset(
              "assets/images/image.png",
              height: 70,
              width: 100,
              fit: BoxFit.cover,
            )*/
            ,
          )
        ],
      ),
    );
  }
}
