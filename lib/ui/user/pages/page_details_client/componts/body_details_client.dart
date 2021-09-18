import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/bussincc_logic/providers/user/market_detail_provider/market_details_provider.dart';

import 'package:matbahk24/ui/user/pages/best_claint/componts/container_type.dart';
import 'package:matbahk24/widgets/show_indicator.dart';

import 'About_to_clients.dart';
import 'header_details_clients.dart';
import 'package:provider/provider.dart';

class BodyDetailsClient extends StatefulWidget {
  final String marketId;

  BodyDetailsClient({required this.marketId});

  @override
  _BodyDetailsClientState createState() => _BodyDetailsClientState();
}

class _BodyDetailsClientState extends State<BodyDetailsClient> {


  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    Future.delayed(Duration(milliseconds: 100), () async {
      context.read<MarketDetailsProvider>().getData(widget.marketId);

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
       context.watch<MarketDetailsProvider>().isLoading?Container(
         height:   MediaQuery.of(context).size.height * .90,
         child: Center(
           child: ShowIndicator(color: Colors.white, width: 30, height: 30),
         ),
       ) : Column(
           children: [
             HeaderDetailsClients(market:context.watch<MarketDetailsProvider>().market!),

             Text(
               'التصنيف',
               style: TextStyle(
                 fontFamily: 'home',
                 fontSize: 6,
                 color: const Color(0xfff2f4f3),
                 height: 2.8333333333333335,
               ),
               textHeightBehavior:
               TextHeightBehavior(applyHeightToFirstAscent: false),
               textAlign: TextAlign.right,
             ),
             SizedBox(
               height: 10,
             ),
             Row(
               mainAxisSize: MainAxisSize.min,
               children: context.watch<MarketDetailsProvider>().fields.map((e) {
                 return Container(
                     margin: EdgeInsets.symmetric(horizontal: 2),
                     child: ContainerType(e.name));
               }).toList(),
             ),
             SizedBox(
               height: 40,
             ),
             // Adobe XD layer: '✏️ Page Title' (text)
             AboutToClients(markets:context.watch<MarketDetailsProvider>().market!,foods:
             context.watch<MarketDetailsProvider>().foods),
             Container(
               color: Colors.red,
             )
           ],
         )
        ],
      ),
    );
  }
}
