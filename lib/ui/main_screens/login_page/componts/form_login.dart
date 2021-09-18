import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/bussincc_logic/providers/user/auth_providers/login_provider.dart';

import 'package:matbahk24/data/models/login.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/main_screens/validate_number/validte_number_screen.dart';
import 'package:provider/provider.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  bool isLoading = false;
  Login data = Login(status: 3, code: "dddd");

  Widget showLoadingIndicator() {
    return Container(
      width: 30,
      height: 30,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  String? phone;
  int status = 3;

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
              Container(
                width: double.infinity,
                height: 50,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      } else {
                        _formKey.currentState!.save();
                        LoginProvider dataProvider =
                            Provider.of<LoginProvider>(context, listen: false);
                        dataProvider
                            .checkUserPhone("+966$phone")
                            .whenComplete(() {
                          setState(() {
                            String code = dataProvider.loginData!.code;
                            print(code);
                            if (dataProvider.loginData!.status == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ValidateNumberScreen(
                                        code: code, phone: phone!)),
                              );
                            } else if (dataProvider.loginData!.status == 0) {
                              Navigator.of(context).pushNamed(signup_screen);
                            }
                          });
                        });
                        // data=dataProvider.loginData;

                      }
                    },
                    color: KHomeColor,
                    child: Provider.of<LoginProvider>(context).isLoading
                        ? showLoadingIndicator()
                        : Text(
                            "دخول",
                            style: TextStyle(
                              fontFamily: 'home',
                              fontSize: 17,
                              color: Colors.white,
                              letterSpacing: 0.8500000000000001,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          )),
              ),
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
      validator: (String? value) {
        return (value != null && value.length < 10)
            ? 'من فضلك أدخل رقم صحيح '
            : null;
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

/*  TextFormField buildTextFieldPassword() {
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
  }*/
}
