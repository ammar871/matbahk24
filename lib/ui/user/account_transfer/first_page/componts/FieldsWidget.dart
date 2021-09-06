import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/account_transfer/second_page/second_page.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal1/componts/FormAddMeal1.dart';
import 'package:matbahk24/widgets/custom_text_field.dart';
import 'package:matbahk24/widgets/default_button.dart';

import 'FieldUploadFills.dart';

class FieldsWidget extends StatelessWidget {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  late String currentValue;
  List<String> list = ["one", "two", "three"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'انت الان علي وشك تقديم طلب لادارة التطبيق لكي تكون مقدم للخدمة كما الحال لكل مقدمي الخدمة. هذا الطلب سيرسل لادارة التطبيق ليقومو بدورهم بالتدقيق في الطلب و  التأكد من استيفاء الشروط اللازمه ومن ثم ياتيك اشعار بالموافقة او عدم الموافقة. قد يستغرق الطلب حتي 73 ساعه . يتعين عليك ملئ الطلب التالي',
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 10,
              color: const Color(0x99000000),
              height: 2.2,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'بعد قبول حسابك ! تقوم الإدارة بمراجعة كل طبخة تقوم بتسجيلها علي النظام قبل نشرها للتاكد من مطابقتها للمواصفات',
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 10,
              color: const Color(0xffff0000),
              fontWeight: FontWeight.w700,
              height: 2.2,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            hint: "الاسم الاول",
            hieght: 55,
            controller: controller1,
            validator: checkFieldEmpty,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            hint: "الاسم الاخير",
            hieght: 55,
            controller: controller2,
            validator: checkFieldEmpty,
          ),
          SizedBox(
            height: 10,
          ),
          CustomDropDownWidget(
            list: list,
            onSelect: (value) {
              currentValue = value;
            },
            hint: "تاريخ الميلاد",
          ),
          SizedBox(
            height: 10,
          ),
          CustomDropDownWidget(
            list: list,
            onSelect: (value) {
              currentValue = value;
            },
            hint: "الجنس",
          ),
          SizedBox(
            height: 10,
          ),
          CustomDropDownWidget(
            list: list,
            onSelect: (value) {
              currentValue = value;
            },
            hint: "نوع الطبخات التي تقدمها - اختر اكثر من واحدة",
          ),
          SizedBox(
            height: 10,
          ),
          CustomDropDownWidget(
            list: list,
            onSelect: (value) {
              currentValue = value;
            },
            hint: "البلدان التي تطبخ اكلاتها",
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            hint: "رقم الايبان الخاص بك",
            hieght: 55,
            controller: controller2,
            validator: checkFieldEmpty,
          ),
          SizedBox(
            height: 10,
          ),
          FieldUploadFills(
            text: "صورة الهوية التي بحوزتك",
            isFound: false,
            onPress: () {},
          ),
          SizedBox(
            height: 10,
          ),
          FieldUploadFills(
            text: "صورة الحساب",
            isFound: true,
            onPress: () {},
          ),
          SizedBox(
            height: 10,
          ),
          FieldUploadFills(
            text: "صورة البروفايل الترويجية",
            isFound: true,
            onPress: () {},
          ),
          SizedBox(
            height: 10,
          ),
          FieldUploadFills(
            text: "صورة المطبخ للمعاينة",
            isFound: true,
            onPress: () {},
          ),
          SizedBox(
            height: 15,
          ),
          DefaultButton(
              height: 55,
              text: "التالى",
              onPress: () {
                Navigator.of(context).pushNamed(SecondPage.id);
              },
              color: KHomeColor,
              colorText: Colors.white),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  String? checkFieldEmpty(String? fieldContent) {
    //<-- add String? as a return type
    if (fieldContent!.isEmpty) {
      return 'Ce champ est obligatoire.';
    }
    return null;
  }
}
