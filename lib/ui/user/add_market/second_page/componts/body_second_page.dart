import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/bussincc_logic/providers/market/add_market_provider/add_market_provider.dart';

import 'package:matbahk24/helpers/constans.dart';

import 'package:matbahk24/widgets/show_indicator.dart';
import 'package:provider/provider.dart';
import '../../BarAccountTransfer.dart';

class BodySecondPage extends StatefulWidget {
  final String name, imag1, image2;
  final List<String> fileds;

  BodySecondPage(
      {required this.name,
      required this.imag1,
      required this.image2,
      required this.fileds});

  @override
  _BodySecondPageState createState() => _BodySecondPageState();
}

class _BodySecondPageState extends State<BodySecondPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarAccountTransfer(),
          SizedBox(
            height: 20,
          ),
          FormField(
            name: widget.name,
            imag1: widget.imag1,
            image2: widget.image2,
            fileds: widget.fileds,
          )
        ],
      ),
    );
  }
}

class FormField extends StatefulWidget {
  final String name, imag1, image2;
  List<String> fileds;

  FormField(
      {required this.name,
      required this.imag1,
      required this.image2,
      required this.fileds});

  @override
  _FormFieldState createState() => _FormFieldState();
}

class _FormFieldState extends State<FormField> {
  final TextEditingController controller = TextEditingController();

  late String summery;

  late final String currentValue;
  bool isAccept = false;
  late int selected = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          buildTextFieldSummery(),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '200 كلمة متاح',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 10,
                  color: const Color(0xff000000),
                  height: 2.2,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                width: 30,
              )
            ],
          ),


          /*  SizedBox(
            height: 20,
          ),
         */ /* CustomDropDownWidget(
            list: list,
            onSelect: (value) {
              currentValue = value;
            },
            hint: "تاريخ الميلاد",
          ),*/ /*
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'هل توفر هذه الخدمات ام لا؟',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 10,
                  color: const Color(0xff000000),
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'بوفيه',
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 10,
                      color: const Color(0xff878787),
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: (){
                        setState(() {
                          selected=0;
                        });
                      },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: selected==0 ? KHomeColor : Color(0xffe2e2e2),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'حلويات',
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 10,
                      color: const Color(0xff878787),
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: (){
                        setState(() {
                          selected=1;
                        });
                      },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color:  selected==1  ? KHomeColor : Color(0xffe2e2e2),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'طبخات ',
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 10,
                      color: const Color(0xff878787),
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected=3;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color:  selected==3  ? KHomeColor : Color(0xffe2e2e2),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          */
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 55,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                onPressed: () {
                  print(widget.fileds[0]);
                  context.read<AddMarketProvider>().addMarket(
                      name: widget.name,
                      image: widget.image2,
                      imageBanner: widget.image2,
                      summery: summery,
                      fields: widget.fileds).whenComplete((){
                    if (context.read<AddMarketProvider>().isSuccess) {
                      setState(() {
                        Navigator.of(context).pushReplacementNamed(success_trans_account_screen);
                      });
                    } else {
                      setState(() {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.black.withOpacity(.5),
                            content: Text("خطأ فى العملية",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "home")));

                        ScaffoldMessenger.of(context).showSnackBar(
                            snackBar);
                      });
                    }


                  });

                },
                color: KHomeColor,
                child: context.watch<AddMarketProvider>().isLoading
                    ? ShowIndicator(color: Colors.white, width: 24, height: 25)
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
          buildRowIsAccept()
        ],
      ),
    );
  }

  Container buildTextFieldSummery() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: TextFormField(
        textAlign: TextAlign.right,
        onSaved: (newValue) => summery = newValue!,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            summery = value;
          });
          return null;
        },
        validator: (String? value) {
          return null;
        },
        style: TextStyle(
          fontFamily: 'home',
          fontSize: 10,
          color: const Color(0x99000000),
          height: 2.2,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          hintText: "وصف مختصر عنك وعن ما يمكن ان تقدمه",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  Row buildRowIsAccept() {
    return Row(
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
              color: isAccept ?  Color(0xffe2e2e2):KHomeColor,
            ),
          ),
        )
      ],
    );
  }
}
