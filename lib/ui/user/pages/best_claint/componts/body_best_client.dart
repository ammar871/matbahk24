import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/bussincc_logic/providers/user/markets_provider/markets_provider.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/title_text1.dart';
import 'package:matbahk24/ui/user/pages/home_user/componts/title_bar_home.dart';
import 'package:matbahk24/widgets/show_indicator.dart';

import 'list_best_clients.dart';
import 'list_lasted_clients.dart';
import 'package:provider/provider.dart';
class BodyBestClient extends StatefulWidget {
  final String fieldId;


  BodyBestClient({required this.fieldId});

  @override
  _BodyBestClientState createState() => _BodyBestClientState();
}

class _BodyBestClientState extends State<BodyBestClient> {
  List<String> eats = ["سعودية", "خليجية", "أمريكية"];




  getData() {
    Future.delayed(Duration(milliseconds: 100), () async {
      context.read<MarketsProvider>().getMarkets(widget.fieldId);


      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(

        children: [
          BarHomeUser(),
          SizedBox(
            height: 30,
          ),
         context.watch<MarketsProvider>().isLoading?

         Container(
             height: MediaQuery.of(context).size.height * .66,
             child: Center(child: ShowIndicator(color: KYellowColor, width: 30, height: 30))): Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                TitleText1("افضل المقدمين"),
                SizedBox(
                  height: 10,
                ),

                ListBestClients(list:context.watch<MarketsProvider>().markets),
                SizedBox(
                  height: 10,
                ),
                TitleText1("تصفح مقدمي الوصفات"),
                SizedBox(
                  height: 10,
                ),
                ListLastedClients(list:context.watch<MarketsProvider>().markets)
              ],
            ),
          )
        ],
      ),
    );
  }
}
