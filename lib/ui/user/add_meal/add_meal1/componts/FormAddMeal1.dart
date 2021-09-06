import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal2/add_meal2_screen.dart';
import 'package:matbahk24/widgets/default_button.dart';

class FormAddMeal1 extends StatefulWidget {
  @override
  _FormAddMeal1State createState() => _FormAddMeal1State();
}

class _FormAddMeal1State extends State<FormAddMeal1> {
  final _formKey = GlobalKey<FormState>();
  late String addressMeal = "";
  String? currentValue1;
  List<String> list1 = [

    "dfhd",
    "ddd",
    "dhdhd"
  ];
  List<String> list2 = ["بلد الوجبة - اختياري", "dfhd", "ddd", "dhdhd"];
  List<String> list3 = ["طبيعة الوجبة - اختياري", "dfhd", "ddd", "dhdhd"];
  String? currentValue2;
  String? currentValue3;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          getTextField(
              hint: 'عنوان الوجبة - حتي 120 حرف',
              controller: controller,
              newValue: addressMeal),
          SizedBox(
            height: 15,
          ),

          CustomDropDownWidget(list: list1, onSelect: (value) {
            currentValue1=value;
          },hint:  "نوع الوجبة - اختر اكثر من واحدة",),

          SizedBox(
            height: 15,
          ),
          CustomDropDownWidget(list: list2, onSelect: (value) {
            currentValue2=value;
          },hint:  "بلد الوجبة - اختياري",),

          // CustomDropDawnWidget(currentValue2??  ,list2),
          SizedBox(
            height: 15,
          ),
          CustomDropDownWidget(list: list3, onSelect: (value) {
            currentValue3=value;
          },hint: "طبيعة الوجبة - اختياري",)
       ,

          SizedBox(
            height: 15,
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(35)),
            child: TextFormField(
              onSaved: (newValue) => newValue = newValue!,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (value) {
                setState(() {});
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
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                hintText: "وصف مختصر عن الوجبة - حتي 200 كلمة",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
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
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DefaultButton(
              height: 55,
              text: "التالى",
              onPress: () {
                Navigator.of(context).pushNamed(AddMeal2Screen.id);
              },
              color: KHomeColor,
              colorText: Colors.white)
        ],
      ),
    );
  }

  Container getTextField(
      {required String hint,
      required String newValue,
      required TextEditingController controller}) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: TextFormField(
        onSaved: (newValue) => newValue = newValue!,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            newValue = value;
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
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}

class CustomDropDownWidget extends StatefulWidget {
final  List<String> list;
 final Function onSelect;
 final String hint;

  CustomDropDownWidget({required this.list, required this.onSelect,required this.hint});

  @override
  _CustomDroopDownWidgetState createState() => _CustomDroopDownWidgetState();
}

class _CustomDroopDownWidgetState extends State<CustomDropDownWidget> {
  String? currentValue;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      Text(widget.hint,
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
                  value: currentValue,
                  icon: SizedBox(),
                  iconSize: 25,
                  underline: SizedBox(),
                  onChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });

                    widget.onSelect(value!);
                  },
                  items:
                      widget.list.map<DropdownMenuItem<String>>((String value) {
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
    );
  }
}
