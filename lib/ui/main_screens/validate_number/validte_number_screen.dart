import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'componts/body_validate.dart';

class ValidateNumberScreen extends StatefulWidget {
static const String id="/validate";
final String code , phone;


ValidateNumberScreen({required this.code,required this.phone});

  @override
  _ValidateNumberState createState() => _ValidateNumberState();
}

class _ValidateNumberState extends State<ValidateNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: BodyValidate(code:widget.code, phone:widget.phone),
    );
  }
}
