import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'componts/body_complete.dart';

class CompleteAccountScreen extends StatelessWidget {
final String phone;

CompleteAccountScreen({required this.phone});

  static String id="/complete";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyCompleteAccount(phone :phone),
    );
  }
}
