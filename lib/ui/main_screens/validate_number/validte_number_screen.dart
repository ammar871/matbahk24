import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'componts/body_validate.dart';

class ValidateNumberScreen extends StatefulWidget {
static String id="/validate";

  @override
  _ValidateNumberState createState() => _ValidateNumberState();
}

class _ValidateNumberState extends State<ValidateNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: BodyValidate(),
    );
  }
}
