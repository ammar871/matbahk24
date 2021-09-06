import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/mandoob/home_mandop/home_mandop_screen.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/widgets/default_button.dart';

class FormCompleted extends StatefulWidget {
  @override
  _FormCompletedState createState() => _FormCompletedState();
}

class _FormCompletedState extends State<FormCompleted> {
  final _formKey = GlobalKey<FormState>();

  late String codeCountry;
  late String firstName;
  late String lastName;
  late int accountType = 0;
  late bool isAccept = false;

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
              buildTextFieldFirstName(),
              SizedBox(
                height: 10,
              ),
              buildTextFieldLastName(),
              SizedBox(
                height: 10,
              ),
              Text(
                'نوع الحساب',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 16,
                  color: const Color(0xFF878787),
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          accountType = 2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.0),
                          color: accountType == 2
                              ? KGreenColor
                              : Color(0x00000000),
                          border: Border.all(
                              width: 1.0, color: const Color(0x1f000000)),
                        ),
                        child: Center(
                          child: // Adobe XD layer: '✏️ Label' (text)
                              Text(
                            'مقدم خدمة',
                            style: TextStyle(
                              fontFamily: 'home',
                              fontSize: 14,
                              color: accountType == 2
                                  ? Colors.white
                                  : Color(0x6f000000),
                              letterSpacing: 0.252,
                              height: 1.4285714285714286,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          accountType = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.0),
                          color: accountType == 1
                              ? KGreenColor
                              : Color(0x00000000),
                          border: Border.all(
                              width: 1.0, color: const Color(0x1f000000)),
                        ),
                        child: Center(
                          child: // Adobe XD layer: '✏️ Label' (text)
                              Text(
                            'مستخدم',
                            style: TextStyle(
                              fontFamily: 'home',
                              fontSize: 14,
                              color: accountType == 1
                                  ? Colors.white
                                  : Color(0x6f000000),
                              letterSpacing: 0.252,
                              height: 1.4285714285714286,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    accountType = 3;
                  });
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.0),
                    color: accountType == 3 ? KGreenColor : Color(0x00000000),
                    border:
                        Border.all(width: 1.0, color: const Color(0x1f000000)),
                  ),
                  child: Center(
                    child: // Adobe XD layer: '✏️ Label' (text)
                        Text(
                      'مندوب توصيل ',
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 14,
                        color:
                            accountType == 3 ? Colors.white : Color(0x6f000000),
                        letterSpacing: 0.252,
                        height: 1.4285714285714286,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DefaultButton(
                colorText: Color(0xffffffff),
                height: 50,
                text: "التالى ",
                onPress: () {
                  if(accountType==1)
                  Navigator.of(context).pushReplacementNamed(NavigationPage.id);
                  else if(accountType==3){
                    Navigator.of(context).pushReplacementNamed(HomeMandopScreen.id);
                  }
                },
                color: KHomeColor,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'أوافق علي تعليمات و قواعد المنصة',
                    style: TextStyle(
                      fontFamily: 'home2',
                      fontSize: 12,
                      color: const Color(0xff878787),
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isAccept = !isAccept;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: isAccept ? KHomeColor : Color(0xffe2e2e2),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Container buildTextFieldFirstName() {
    return Container(
      height: 50,
      child: TextFormField(
        onSaved: (newValue) => firstName = newValue!,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            firstName = value;
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
          hintText: "الاسم الأول ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  Container buildTextFieldLastName() {
    return Container(
      height: 50,
      child: TextFormField(
        onSaved: (newValue) => lastName = newValue!,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            lastName = value;
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
          hintText: "الاسم الأخير ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
