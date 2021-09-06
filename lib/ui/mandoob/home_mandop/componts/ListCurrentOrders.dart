import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/ui/mandoob/dialog_current_order/current_order_dialog.dart';

class ListCurrentOrders extends StatelessWidget {
  const ListCurrentOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return ItemCurrentOrders();
        });
  }
}

class ItemCurrentOrders extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: .5, color: Color(0xffE2E2E2)))),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 30,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(DailogCurrentOrder.id);
              },
              color: Color(0xff707070),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)),
              child: Text(
                'قبول',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 10,
                  color: const Color(0xffffffff),
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 3),
                          child: Text(
                            '269887',
                            style: TextStyle(
                              fontFamily: 'home',
                              fontSize: 10,
                              color: const Color(0xff200e32),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'طلب توصيل رقم',
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 10,
                            color: const Color(0xff200e32),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: // Adobe XD layer: 'Travel' (text)
                          SizedBox(
                            width: 110,
                            child: Text(
                              'مكة المكرمة 2 شارع الشهداء',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'home',
                                fontSize: 8,
                                color: const Color(0xff200e32),
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'التوصيل من',
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 8,
                            color: const Color(0xff200e32),
                          ),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: // Adobe XD layer: 'Travel' (text)
                          SizedBox(
                            width: 110,
                            child: Text(
                              'مكة المكرمة 2 شارع الشهداء',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'home',
                                fontSize: 8,
                                color: const Color(0xff200e32),
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'التوصيل الى',
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 8,
                            color: const Color(0xff200e32),
                          ),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffFFDD2C)),
            child: Center(
              child: // Adobe XD layer: 'Travel' (text)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' 15.55',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 10,
                      color: const Color(0xfff2f4f3),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    ' م',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 10,
                      color: const Color(0xfff2f4f3),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}