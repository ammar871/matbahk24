import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/bussincc_logic/providers/user/home_providers/home_providers.dart';

import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/styels.dart';
import 'package:matbahk24/ui/user/pages/home_user/componts/title_bar_home.dart';
import 'package:matbahk24/widgets/show_indicator.dart';
import 'package:provider/provider.dart';
import 'RichTextCategories.dart';
import 'list_categries.dart';
import 'list_products.dart';

class BodyUserHome extends StatefulWidget {
  @override
  _BodyUserHomeState createState() => _BodyUserHomeState();
}

class _BodyUserHomeState extends State<BodyUserHome> {
  late HomeProviders homeProviders = HomeProviders();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    Future.delayed(Duration(milliseconds: 100), () async {
      context.read<HomeProviders>().getDataHome();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarHomeUser(),
          context.watch<HomeProviders>().isLoading
              ? Container(
                  height: MediaQuery.of(context).size.height * .66,
                  child:
                      ShowIndicator(color: KYellowColor, width: 50, height: 50))
              : Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          StylesWidget.getSvg(
                              "assets/icons/back_left.svg", 20, 20),
                          Expanded(
                              child: ListCategories(
                                  fields: context
                                      .watch<HomeProviders>()
                                      .fields)),
                          StylesWidget.getSvg(
                              "assets/icons/back_reight.svg", 20, 20),
                        ],
                      ),
                    ),
                    RichTextCategories(),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'احدث الاضافات',
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 16,
                            color: const Color(0xff383838),
                            fontWeight: FontWeight.w700,
                            height: 1.625,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'نعرض لك في هذا الجزء احدث ما اضيف من اكلات خلال الفترة السابقة نحن متاكدين انك ستجد الأنسب لك هنا',
                        style: TextStyle(
                          fontFamily: 'home',
                          fontSize: 12,
                          color: const Color(0x9e383838),
                          height: 1.6666666666666667,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListProducts(foods :context
                        .watch<HomeProviders>()
                        .foods)
                  ],
                )
        ],
      ),
    );
  }
}
