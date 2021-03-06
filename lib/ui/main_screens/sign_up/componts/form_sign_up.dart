import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/bussincc_logic/providers/user/auth_providers/providers_validate_number.dart';

import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/main_screens/complete_accounte_screen/complete_accounte_screen.dart';
import 'package:provider/provider.dart';

class FormSignUp extends StatefulWidget {
  @override
  _FormSignUpState createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  final _formKey = GlobalKey<FormState>();

  late String codeCountry;
  late String phone;
  late String response = "";

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
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: KTextColor.withOpacity(.5)),
                ),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          radius: 20.0,
                          child: Image.asset("assets/images/flag.png"),
                        )),
                    Text(
                      'السعودية +965',
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 16,
                        color: const Color(0xff878787),
                        letterSpacing: 0.8,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
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
                      SignValidateProvider dataProvider =
                      Provider.of<SignValidateProvider>(context,
                          listen: false);
                      dataProvider
                          .validateNumber("+966$phone")
                          .whenComplete(() {
                        setState(() {
                          print(dataProvider.responseData);
                          String responseValidate = dataProvider.responseData!;




                          if (responseValidate=="success"){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  CompleteAccountScreen(phone:phone)),
                            );

                          }else{
                            final snackBar = SnackBar(
                                backgroundColor: KGreenColor,
                                content: Text(dataProvider.responseData!,
                                  style: TextStyle(color: Colors.white
                                      ,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "home"),));

                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        });
                      });
                      // if(response!=""){
                      //   final snackBar = SnackBar(
                      //       backgroundColor: KGreenColor,
                      //       content: Text(response,style: TextStyle(color: Colors.white
                      //           ,fontWeight: FontWeight.bold,fontFamily: "home"),));
                      //
                      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // }

                    }
                  },
                  color: KHomeColor,
                  child: Provider
                      .of<SignValidateProvider>(context)
                      .isLoading
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
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }

  Container buildTextFieldPhone() {
    return Container(
      height: 50,
      child: TextFormField(
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
