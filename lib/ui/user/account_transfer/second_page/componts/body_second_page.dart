import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/account_transfer/success_transfer/success_transfer.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal1/componts/FormAddMeal1.dart';
import 'package:matbahk24/widgets/custom_text_field.dart';
import 'package:matbahk24/widgets/default_button.dart';

import '../../BarAccountTransfer.dart';

class BodySecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarAccountTransfer(),
          SizedBox(
            height: 20,
          ),
          FormField()
        ],
      ),
    );
  }
}

class FormField extends StatefulWidget {
  @override
  _FormFieldState createState() => _FormFieldState();
}

class _FormFieldState extends State<FormField> {
  final TextEditingController controller = TextEditingController();


  final List<String> list = ["one", "two", "three"];

  late final String currentValue;
  bool isAccept = false;
    late int selected=5;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomTextField(
              controller: controller,
              hint: "وصف مختصر عنك وعن مايمكن ان تقدمه",
              hieght: 150),
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
          SizedBox(
            height: 20,
          ),
          CustomDropDownWidget(
            list: list,
            onSelect: (value) {
              currentValue = value;
            },
            hint: "تاريخ الميلاد",
          ),
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
          SizedBox(
            height: 30,
          ),
          DefaultButton(
              height: 55,
              text: "التالى",
              onPress: () {

                Navigator.of(context).pushNamed(SuccessTransfer.id);
              },
              color: KHomeColor,
              colorText: Colors.white),
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
    );
  }
}
