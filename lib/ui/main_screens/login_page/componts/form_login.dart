import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/main_screens/sign_up/sign_up_screen.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/widgets/custom_suffixicon.dart';
import 'package:matbahk24/widgets/default_button.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();

  late String phone;
  late String pass;

  @override
  Widget build(BuildContext context) {

    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              buildTextFieldPhone(),
              SizedBox(
                height: 20,
              ),
              buildTextFieldPassword(),
              SizedBox(
                height: 20,
              ),
              DefaultButton(colorText:Color(0xffffffff),height: 50,text: "دخول",
                onPress: (){
               Navigator.of(context).pushNamed(SignUpScreen.id);
              },color: KHomeColor,),
              SizedBox(
                height: 10,
              ),
              Text(
                'نسيت كلمة المرور',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 14,
                  color: const Color(0xff022c43),
                  letterSpacing: 0.7000000000000001,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }

  TextFormField buildTextFieldPhone() {
    return TextFormField(
      onSaved: (newValue) => phone = newValue!,
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        setState(() {
          phone = value;
        });
        return null;
      },
      validator: (value) {
        return null;
      },
      textAlign: TextAlign.center,
      style: TextStyle(fontFamily: "home", fontSize: 15, color: KTextColor),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        hintText: "رقم الهاتف بدون مفتاح",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildTextFieldPassword() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => pass = newValue!,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        setState(() {
          pass = value;
        });
        return null;
      },
      validator: (value) {
        return null;
      },
      textAlign: TextAlign.right,
      style: TextStyle(fontFamily: "home", fontSize: 15, color: KTextColor),
      decoration: InputDecoration(
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Eye.svg"),
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        hintText: "كلمة المرور",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
