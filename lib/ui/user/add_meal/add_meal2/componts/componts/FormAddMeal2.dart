import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal3/add_meal3_screen.dart';
import 'package:matbahk24/widgets/default_button.dart';

class FormAddMeal2 extends StatefulWidget {
  @override
  _FormAddMeal2State createState() => _FormAddMeal2State();
}

class _FormAddMeal2State extends State<FormAddMeal2> {
  String? currentVale;
  String? currentVale2;
  String? info;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 30),
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(35)),
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.green,
                      )),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("حجم الوجبة",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'home',
                                  fontSize: 10,
                                  color: const Color(0x99000000),
                                  height: 2.2,
                                )),
                          ],
                        ),
                        style: TextStyle(
                          fontFamily: 'home',
                          fontSize: 10,
                          color: const Color(0x99000000),
                          height: 2.2,
                        ),
                        value: currentVale,
                        icon: SizedBox(),
                        iconSize: 25,
                        underline: SizedBox(),
                        onChanged: (value) {
                          setState(() {
                            currentVale = value!;
                          });
                        },
                        items: <String>[
                          'مكة المكرمة',
                          'المدينة المنورة',
                          'مدينة الرياض',
                          'مدينة جدة'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  value,
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          );
                        }).toList()),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'المرفقات',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 20,
                  color: const Color(0xff200e32),
                  letterSpacing: 0.15000000953674317,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: count,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  height: 55,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        height: 55,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35)),
                        child: Center(
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Colors.green,
                                  )),
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("العدد",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontFamily: 'home',
                                              fontSize: 10,
                                              color: const Color(0x99000000),
                                              height: 2.2,
                                            )),
                                      ],
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'home',
                                      fontSize: 10,
                                      color: const Color(0x99000000),
                                      height: 2.2,
                                    ),
                                    value: currentVale2,
                                    icon: SizedBox(),
                                    iconSize: 25,
                                    underline: SizedBox(),
                                    onChanged: (value) {
                                      setState(() {
                                        currentVale2 = value!;
                                      });
                                    },
                                    items: <String>['1', '2', '3', '4']
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  value,
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList()),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35)),
                          child: TextFormField(
                            onSaved: (newValue) => info = newValue!,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                info = value;
                              });
                              return null;
                            },
                            validator: (value) {
                              return null;
                            },
                            textAlign: TextAlign.right,
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
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              hintText: "اكتب اسم المرفق",
                              floatingLabelBehavior:
                              FloatingLabelBehavior.always,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          InkWell(
            onTap: () {
              setState(() {
                count++;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'اضف مرفق بالوجبة',
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 12,
                    color: const Color(0xff200e32),
                    letterSpacing: 0.09000000572204589,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.add,
                  color: Colors.green,
                  size: 20,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'طريقة التقديم',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 20,
                  color: const Color(0xff200e32),
                  letterSpacing: 0.15000000953674317,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
              ),

            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(35)
            ),child:  TextFormField(
            onSaved: (newValue) => newValue = newValue!,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (value) {
              setState(() {

              });
              return null;
            },
            validator: (value) {
              return null;
            },
            textAlign: TextAlign.right,
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
              hintText: "وصف مختصر عن الوجبة - حتي 200 كلمة",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
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
                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DefaultButton(height: 55, text: "التالى", onPress: (){
            Navigator.of(context).pushNamed(AddMeal3Screen.id);
          }, color: KHomeColor, colorText: Colors.white)
        ],
      ),
    );
  }
}