import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/bussincc_logic/providers/user/auth_providers/complete_provider.dart';
import 'package:matbahk24/bussincc_logic/providers/user/auth_providers/sing_up_divder_provider.dart';

import 'package:matbahk24/data/models/sign_model.dart';
import 'package:matbahk24/helpers/constans.dart';

import 'package:provider/provider.dart';

class FormSignDriver extends StatefulWidget {






  @override
  _FormSignDriverState createState() => _FormSignDriverState();
}

class _FormSignDriverState extends State<FormSignDriver> {
  final _formKey = GlobalKey<FormState>();

  late String codeCountry;
  late String allName;
  late String phone,email,identityNumber,address,ibanNumber,knowName;
  late int accountType = 0;
  late bool isAccept = false;
  double hieght=50;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              buildTextFieldAllName(),
              SizedBox(
                height: 10,
              ),
              buildTextFieldEmail(),
              SizedBox(
                height: 10,
              ),
              buildTextFieldIdentityNumber(),
              SizedBox(
                height: 10,
              ),
              buildTextFieldPhone(),

              SizedBox(
                height: 10,
              ),
              buildTextFieldKnowName(),

              SizedBox(
                height: 10,
              ),
              buildTextFieldIdentityNumber(),

              SizedBox(
                height: 10,
              ),
              buildTextFieldAddress(),

              SizedBox(
                height: 10,
              ),
              buildTextFieldIbanNumber(),

              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        setState(() {
                          hieght=80;
                        });
                        return;
                      } else {
                        setState(() {
                          hieght=50;
                        });
                        _formKey.currentState!.save();
                        context.read<SignDriverProvider>().SignUpDriver(
                            fullName: allName, phone: phone, email: email, knowName: knowName,
                            identity: identityNumber, iban: ibanNumber, address: address);
                        if(context.read<SignDriverProvider>().isSuccess){

                          Navigator.of(context).pushNamed(login_screen);
                        }
                      }
                    },
                    color: KHomeColor,
                    child: context.watch<SignDriverProvider>().isLoading
                        ? showLoadingIndicator()
                        : Text(
                      "التالى",
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
            ],
          ),
        ));
  }

  Container buildTextFieldAllName() {
    return Container(
      height: hieght,
      child: TextFormField(
        onSaved: (newValue) => allName = newValue!,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            allName = value;
          });
          return null;
        },
        validator: (String? value) {
          return (value != null && value.isEmpty)
              ? '* مطلوب '
              : null;
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: "home", fontSize: 15, color: KTextColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: "الاسم بالكامل ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  Container buildTextFieldEmail() {
    return Container(
      height: hieght,
      child: TextFormField(
        onSaved: (newValue) => email = newValue!,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
          return null;
        },
        validator: (String? value) {
          return (value != null && value.isEmpty)
              ? '* مطلوب'
              : null;
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: "home", fontSize: 15, color: KTextColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: "البريد الالكترونى ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
  Container buildTextFieldPhone() {
    return Container(
      height: hieght,
      child: TextFormField(
        onSaved: (newValue) => phone = newValue!,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            phone = value;
          });
          return null;
        },
        validator: (String? value) {
          return (value != null && value.isEmpty)
              ? '* مطلوب'
              : null;
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: "home", fontSize: 15, color: KTextColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: "رقم الهاتف ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
  Container buildTextFieldKnowName() {
    return Container(
      height: hieght,
      child: TextFormField(
        onSaved: (newValue) => knowName = newValue!,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            knowName = value;
          });
          return null;
        },
        validator: (String? value) {
          return (value != null && value.isEmpty)
              ? '* مطلوب '
              : null;
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: "home", fontSize: 15, color: KTextColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: "اسم الشهرة",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
  Container buildTextFieldAddress() {
    return Container(
      height: hieght,
      child: TextFormField(
        onSaved: (newValue) => address = newValue!,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            address = value;
          });
          return null;
        },
        validator: (String? value) {
          return (value != null && value.isEmpty)
              ? '* مطلوب '
              : null;
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: "home", fontSize: 15, color: KTextColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: "العنوان ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
  Container buildTextFieldIdentityNumber() {
    return Container(
      height: hieght,
      child: TextFormField(
        onSaved: (newValue) => identityNumber = newValue!,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            identityNumber = value;
          });
          return null;
        },
        validator: (String? value) {
          return (value != null && value.isEmpty)
              ? '* مطلوب '
              : null;
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: "home", fontSize: 15, color: KTextColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: "Identity Number ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
  Container buildTextFieldIbanNumber() {
    return Container(
      height: hieght,
      child: TextFormField(
        onSaved: (newValue) => ibanNumber = newValue!,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            ibanNumber = value;
          });
          return null;
        },
        validator: (String? value) {
          return (value != null && value.isEmpty)
              ? '* مطلوب '
              : null;
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: "home", fontSize: 15, color: KTextColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: "Iban Number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
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
}
