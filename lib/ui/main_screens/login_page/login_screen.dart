import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'componts/body_login.dart';

class LoginScreen extends StatelessWidget {
  static const String id="/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyLogin(),
    );
  }
}
