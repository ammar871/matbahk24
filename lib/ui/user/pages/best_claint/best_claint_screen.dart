import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

import 'componts/body_best_client.dart';

class BestClientsScreen extends StatefulWidget {
 static String id ="/best_client";

 final String fieldId;

 BestClientsScreen({required this.fieldId});

  @override
  _BestClientsScreenState createState() => _BestClientsScreenState();
}

class _BestClientsScreenState extends State<BestClientsScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return  Scaffold(
      backgroundColor: Color(0xFFF2F4F3),
      key: _key,
      appBar:  AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.arrow_back,color: KBluColor,
          ),
        ),
        backgroundColor: KYellowColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichTextTitle(Color(0xff000000)),
          ],
        ),
      ),
     body: BodyBestClient(fieldId:widget.fieldId),
      endDrawer: MyDrawer(),
    );
  }
}
