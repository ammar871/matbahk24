import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/title_text1.dart';
import 'package:matbahk24/ui/user/pages/home_user/componts/title_bar_home.dart';

import 'list_best_clients.dart';
import 'list_lasted_clients.dart';

class BodyBestClient extends StatefulWidget {
  const BodyBestClient({Key? key}) : super(key: key);

  @override
  _BodyBestClientState createState() => _BodyBestClientState();
}

class _BodyBestClientState extends State<BodyBestClient> {
  List<String> eats = ["سعودية", "خليجية", "أمريكية"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarHomeUser(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                TitleText1("افضل المقدمين"),
                SizedBox(
                  height: 10,
                ),
                ListBestClients(),
                SizedBox(
                  height: 10,
                ),
                TitleText1("تصفح مقدمي الوصفات"),
                SizedBox(
                  height: 10,
                ),
                ListLastedClients(eats: eats)
              ],
            ),
          )
        ],
      ),
    );
  }
}
