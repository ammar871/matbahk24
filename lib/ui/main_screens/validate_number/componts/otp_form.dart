

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/bussincc_logic/providers/user/auth_providers/otp_provider.dart';

import 'package:matbahk24/data/models/confirm_code/confirm__code.dart';
import 'package:matbahk24/helpers/commen.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/shared_editor.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpForm extends StatefulWidget {
  final String code, phone;

  OtpForm({required this.code, required this.phone});

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late ConfirmCode confirmCode;
  late String otpCode;
  ShardEditor editor = ShardEditor();

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
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Container(
            width: 180,
            child: PinCodeTextField(
              appContext: context,
              length: 4,
              autoFocus: true,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              obscureText: false,
              textStyle: TextStyle(
                  color: KHomeColor, fontSize: 14, fontFamily: "home"),
              animationType: AnimationType.scale,
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 35,
                  borderWidth: 1,
                  activeColor: Color(0xFFE2E2E2),
                  inactiveColor: Color(0xFFE2E2E2),
                  inactiveFillColor: Color(0xFFE2E2E2),
                  activeFillColor: Color(0xFFE2E2E2),
                  selectedColor: Color(0xFFE2E2E2),
                  selectedFillColor: Colors.white),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.white,
              enableActiveFill: true,
              onCompleted: (code) {
                print("Completed");
                otpCode = code;
              },
              onChanged: (value) {
                print(value);
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              width: double.infinity,
              height: 50,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                onPressed: () {
                  if (otpCode == widget.code) {
                    OtpProvider dataprovider =
                        Provider.of<OtpProvider>(context, listen: false);

                    dataprovider
                        .confirmCode("+966${widget.phone}", widget.code)
                        .whenComplete(() {
                      User user = dataprovider.confirmCodeData!.user;
                      setState(() {
                        editor.setPhone("+966${widget.phone}");
                        editor.setIsLogin(true);
                        editor.setName(user.fullName);
                        editor.setToken(dataprovider.confirmCodeData!.token);
                        editor.setUserId(dataprovider.confirmCodeData!.user.id);
                        editor.setUserRole(dataprovider.confirmCodeData!.user.role);
                        if(dataprovider.confirmCodeData!.user.role=="provider"){
                          editor.setMarket(dataprovider.confirmCodeData!.market);

                        }

                        Cemmon.UserToken=dataprovider.confirmCodeData!.token;
                        Cemmon.UserId=dataprovider.confirmCodeData!.user.id;
                        Future.delayed(Duration(milliseconds: 100), (

                            ) {
                          Navigator.of(context).pushReplacementNamed(navigation_screen);

                        });

                      });
                    });
                  } else {
                    final snackBar = SnackBar(
                        content: Text("الكود غير صحيح ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "home")));

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                color: KHomeColor,
                child: Provider.of<OtpProvider>(context).isLoading
                    ? showLoadingIndicator()
                    : Text(
                        "تحقق",
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
          )
        ],
      ),
    );
  }
}

/*
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Container(
decoration: BoxDecoration(
color: Color(0xFFE2E2E2),
borderRadius: BorderRadius.circular(9.0)),
width: 35,
height: 50,
child: TextFormField(
autofocus: true,
obscureText: true,
style: TextStyle(fontSize: 24),
keyboardType: TextInputType.number,
textAlign: TextAlign.center,
decoration: new InputDecoration(
border: InputBorder.none,
focusedBorder: InputBorder.none,
enabledBorder: InputBorder.none,
errorBorder: InputBorder.none,
disabledBorder: InputBorder.none,
contentPadding:
EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
),
onChanged: (value) {
nextField(value, pin2FocusNode);
},
),
),
SizedBox(
width: 5,
),
Container(
decoration: BoxDecoration(
color: Color(0xFFE2E2E2),
borderRadius: BorderRadius.circular(9.0)),
width: 35,
height: 50,
child: TextFormField(
autofocus: true,
focusNode: pin2FocusNode,
obscureText: true,
style: TextStyle(fontSize: 24),
keyboardType: TextInputType.number,
textAlign: TextAlign.center,
decoration: new InputDecoration(
border: InputBorder.none,
focusedBorder: InputBorder.none,
enabledBorder: InputBorder.none,
errorBorder: InputBorder.none,
disabledBorder: InputBorder.none,
contentPadding:
EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
),
onChanged: (value) {
nextField(value, pin3FocusNode);
},
),
),
SizedBox(
width: 5,
),
Container(
decoration: BoxDecoration(
color: Color(0xFFE2E2E2),
borderRadius: BorderRadius.circular(9.0)),
width: 35,
height: 50,
child: TextFormField(
autofocus: true,
focusNode: pin3FocusNode,
obscureText: true,
style: TextStyle(fontSize: 24),
keyboardType: TextInputType.number,
textAlign: TextAlign.center,
decoration: new InputDecoration(
border: InputBorder.none,
focusedBorder: InputBorder.none,
enabledBorder: InputBorder.none,
errorBorder: InputBorder.none,
disabledBorder: InputBorder.none,
contentPadding:
EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
),
onChanged: (value) {
nextField(value, pin4FocusNode);
},
),
),
SizedBox(
width: 5,
),
Container(
decoration: BoxDecoration(
color: Color(0xFFE2E2E2),
borderRadius: BorderRadius.circular(9.0)),
width: 35,
height: 50,
child: TextFormField(
focusNode: pin4FocusNode,
autofocus: true,
obscureText: true,
style: TextStyle(fontSize: 24),
keyboardType: TextInputType.number,
textAlign: TextAlign.center,
decoration: new InputDecoration(
border: InputBorder.none,
focusedBorder: InputBorder.none,
enabledBorder: InputBorder.none,
errorBorder: InputBorder.none,
disabledBorder: InputBorder.none,
contentPadding:
EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
),
onChanged: (value) {
if (value.length == 1) {
pin4FocusNode.unfocus();
// Then you need to check is the code is correct or not
}
},
),
),

],
),*/
