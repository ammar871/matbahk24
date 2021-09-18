import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'componts/body_user_home.dart';

class HomeUserScreen extends StatefulWidget {
  static String id = "/home_user";

  @override
  _HomeUserScreenState createState() => _HomeUserScreenState();
}

class _HomeUserScreenState extends State<HomeUserScreen> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return WillPopScope(
      onWillPop: () async => false,

      child: Scaffold(

        backgroundColor: Color(0xFFF2F4F3),

        body:BodyUserHome(),

      ),
    );
  }
}


