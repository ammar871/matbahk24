import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/bussincc_logic/providers/user/home_providers/home_providers.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal2/add_meal2_screen.dart';

import 'package:matbahk24/widgets/default_button.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';
import 'CustomDropDownWidget.dart';

class FormAddMeal1 extends StatefulWidget {
  @override
  _FormAddMeal1State createState() => _FormAddMeal1State();
}

class _FormAddMeal1State extends State<FormAddMeal1> {
  final _formKey = GlobalKey<FormState>();
  late String addressMeal = "";
  String? currentValue1;

  late String nameMeal, descMeal;
  List<String> fileds = [];
  double hieght = 50;
  double hieghtDesc = 220;
  List<String> list1 = ["dfhd", "ddd", "dhdhd"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<HomeProviders>().getDataHome().whenComplete(() {
      fieldsList = context.read<HomeProviders>().fields;
      setState(() {});
    });
  }

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
          buildTextField(
            hint: 'عنوان الوجبة - حتي 120 حرف',
          ),
          SizedBox(
            height: 15,
          ),
          buildMultiSelection()

          // SizedBox(
          //   height: 15,
          // ),
          // CustomDropDownWidget(list: list2, onSelect: (value) {
          //   currentValue2=value;
          // },hint:  "بلد الوجبة - اختياري",),

          // CustomDropDawnWidget(currentValue2??  ,list2),
          // SizedBox(
          //   height: 15,
          // ),
          //    CustomDropDownWidget(list: list3, onSelect: (value) {
          //      currentValue3=value;
          //    },hint: "طبيعة الوجبة - اختياري",)
          // ,
          ,
          SizedBox(
            height: 15,
          ),
          buildTextFieldDesc(),
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
                if (!_formKey.currentState!.validate()) {
                  setState(() {
                    hieght = 80;
                    hieghtDesc = 250;
                  });
                  return;
                } else {
                  setState(() {
                    hieght = 50;
                  });
                  _formKey.currentState!.save();
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=>AddMeal2Screen(nameMeal:nameMeal,
                      fields:fileds,descMeal:descMeal)));

                }


              },
              color: KHomeColor,
              colorText: Colors.white)
        ],
      ),
    );
  }

  List<Fields> fieldsList = [];

  Container buildMultiSelection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Center(
        child: MultiSelectDialogField<Fields?>(
          cancelText: Text("الغاء"),
          confirmText: Text("تم"),
          backgroundColor: Colors.white,
          items: fieldsList
              .map((string) => MultiSelectItem<Fields?>(string, string.name))
              .toList(),
          title: Text("الانواع"),
          selectedColor: Colors.black,
          itemsTextStyle: TextStyle(
            fontFamily: 'home',
            fontSize: 8,
            height: 1,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          buttonIcon: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Colors.green,
          ),
          selectedItemsTextStyle: TextStyle(
            fontFamily: 'home',
            fontSize: 10,
            color: Colors.black,
            height: 2.2,
          ),
          buttonText: Text(
            "نوع الطبخات التي تقدمها - اختر اكثر من واحدة",
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 10,
              color: const Color(0x99000000),
              height: 2.2,
            ),
          ),
          onConfirm: (List<Fields?> results) {
            setState(() {
              results.forEach((element) {
                int id = element!.id;
                print(id);
                fileds.add(id.toString());
              });
            });
          },
        ),
      ),
    );
  }

  Container buildTextField({required String hint}) {
    return Container(
      height: hieght,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: TextFormField(
        textAlign: TextAlign.right,
        onSaved: (newValue) => nameMeal = newValue!,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            nameMeal = value;
          });
          return null;
        },
        validator: (String? value) {
          return (value != null && value.isEmpty) ? 'مطلوب * ' : null;
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
          hintText: " عنوان الوجبه _ حتى  120 حرف",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  Container buildTextFieldDesc() {
    return Container(
      height: hieghtDesc,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: TextFormField(
        textAlign: TextAlign.right,
        onSaved: (newValue) => descMeal = newValue!,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            descMeal = value;
          });
          return null;
        },
        validator: (String? value) {
          return (value != null && value.isEmpty) ? 'مطلوب * ' : null;
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
          hintText: "وصف مختصر _ حتى  200 كلمة",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
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
