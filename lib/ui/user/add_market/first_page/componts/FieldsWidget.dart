import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matbahk24/bussincc_logic/providers/market/add_market_provider/add_market_provider.dart';
import 'package:matbahk24/bussincc_logic/providers/upload_image/upload_image.dart';
import 'package:matbahk24/bussincc_logic/providers/user/home_providers/home_providers.dart';
import 'package:matbahk24/data/models/models_home/model_home.dart';
import 'package:matbahk24/helpers/commen.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/add_market/second_page/second_page.dart';

import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';
import 'package:matbahk24/widgets/default_button.dart';

import 'FieldUploadFills.dart';

class FieldsWidget extends StatefulWidget {
  @override
  _FieldsWidgetState createState() => _FieldsWidgetState();
}

class _FieldsWidgetState extends State<FieldsWidget> {
  final TextEditingController controller1 = TextEditingController();

  final TextEditingController controller2 = TextEditingController();

  XFile _file2 = XFile("path");
  XFile _file1 = XFile("path");

  //late File _imageTwo;
  final ImagePicker _picker = ImagePicker();

  late String currentValue;
  late String firstName;
  late String lastName;
  late String imagePerson = '';
  late String imageBanner = '';
  List<String> list = ["one", "two", "three"];

  List<String> selcte = [];
  final _formKey = GlobalKey<FormState>();
  List<String> fileds = [];
  List<Fields> fieldsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<HomeProviders>().getDataHome().whenComplete(() {
      fieldsList = context.read<HomeProviders>().fields;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              '?????? ???????? ?????? ?????? ?????????? ?????? ???????????? ?????????????? ?????? ???????? ???????? ???????????? ?????? ?????????? ?????? ?????????? ????????????. ?????? ?????????? ?????????? ???????????? ?????????????? ???????????? ???????????? ???????????????? ???? ?????????? ??  ???????????? ???? ?????????????? ???????????? ?????????????? ?????? ???? ?????????? ?????????? ?????????????????? ???? ?????? ????????????????. ???? ???????????? ?????????? ?????? 73 ???????? . ?????????? ???????? ?????? ?????????? ????????????',
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
              '?????? ???????? ?????????? ! ???????? ?????????????? ?????????????? ???? ???????? ???????? ???????????????? ?????? ???????????? ?????? ?????????? ???????????? ???? ???????????????? ??????????????????',
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
            buildTextFieldFirstName(),
            SizedBox(
              height: 10,
            ),
            buildTextFieldLastName(),
            SizedBox(
              height: 10,
            ),
            buildMultiSelection(),
            /*SizedBox(
              height: 10,
            ),
            CustomDropDownWidget(
              list: list,
              onSelect: (value) {
                currentValue = value;
              },
              hint: "??????????",
            ),
            SizedBox(
              height: 10,
            ),*/
            /*  CustomDropDownWidget(
              list: list,
              onSelect: (value) {
                currentValue = value;
              },
              hint: "?????? ?????????????? ???????? ???????????? - ???????? ???????? ???? ??????????",
            ),*/
            /*    SizedBox(
              height: 10,
            ),
            CustomDropDownWidget(
              list: list,
              onSelect: (value) {
                currentValue = value;
              },
              hint: "?????????????? ???????? ???????? ??????????????",
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hint: "?????? ?????????????? ?????????? ????",
              hieght: 55,
              controller: controller2,
              validator: checkFieldEmpty,
            ),
            SizedBox(
              height: 10,
            ),
            FieldUploadFills(
              text: "???????? ???????????? ???????? ????????????",
              isFound: false,
              onPress: () {},
            ),
            SizedBox(
              height: 10,
            ),*/
            /*  FieldUploadFills(
              text: "???????? ????????????",
              isFound: true,
              onPress: () {},
            ),*/
            SizedBox(
              height: 10,
            ),
            buildUploadImagProfile(context),
            SizedBox(
              height: 10,
            ),
            buildUploadImagBanner(context),
            SizedBox(
              height: 15,
            ),


            DefaultButton(
                height: 55,
                text: "????????????",
                onPress: () {
                  if (!_formKey.currentState!.validate()) {
                    print("noo");
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(
                            name: "$firstName $lastName",
                            imag1: context
                                .read<UploadImageMarketProvider>()
                                .image1,
                            imageBanner: context
                                .read<UploadImageMarketProvider>()
                                .image2,
                            fileds: fileds),
                      ),



                    );
                  //   context.read<AddMarketProvider>().addMarket(name: "$firstName  $lastName",
                  //       image: context.read<UploadImageMarketProvider>().image1
                  //       , imageBanner:  context.read<UploadImageMarketProvider>().image2,
                  //       summery: "aaaaaa", fields: ["1","2","3"]);
                   }
                },
                color: KHomeColor,
                colorText: Colors.white),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  InkWell buildUploadImagBanner(BuildContext context) {
    return InkWell(
            onTap: () {
              _choseImage(_file2, 2);
            },
            child: Column(
              children: [
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        context.watch<UploadImageMarketProvider>().isLoadingBanner
                            ?  Container(
                          height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                          color: Colors.green,
                          strokeWidth: 2,

                        ),
                            )
                            : (context
                            .watch<UploadImageMarketProvider>()
                            .isSuccessBanner
                            ? Icon(
                          Icons.check,
                          size: 25,
                          color: Colors.green,
                        )
                            : SvgPicture.asset(
                            "assets/icons/Icon_upload.svg")),
                        Text(
                          "???????? ???????????? ????????????????",
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 10,
                            color: const Color(0x99000000),
                            height: 2.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                NewTitleSelect()
              ],
            ),
          );
  }

  InkWell buildUploadImagProfile(BuildContext context) {
    return InkWell(
            onTap: () {
              _choseImage(_file1, 1);
            },
            child: Column(
              children: [
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        context.watch<UploadImageMarketProvider>().isLoading
                            ?  Container(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            strokeWidth: 2,

                          ),
                        )
                            : (context
                                    .watch<UploadImageMarketProvider>()
                                    .isSuccessImage
                                ? Icon(
                                    Icons.check,
                                    size: 25,
                                    color: Colors.green,
                                  )
                                : SvgPicture.asset(
                                    "assets/icons/Icon_upload.svg")),
                        Text(
                          "???????? ?????????????????? ??????????????????",
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 10,
                            color: const Color(0x99000000),
                            height: 2.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                NewTitleSelect()
              ],
            ),

            // child: FieldUploadFills(
            //   text: "???????? ?????????????????? ??????????????????",
            //   isFound: true,
            //   onPress: () {
            //
            //   },
            // ),
          );
  }

  Container buildMultiSelection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Center(
        child: MultiSelectDialogField<Fields?>(
          cancelText: Text("??????????"),
          confirmText: Text("????"),
          backgroundColor: Colors.white,
          items: fieldsList
              .map((string) => MultiSelectItem<Fields?>(string, string.name))
              .toList(),
          title: Text("??????????????"),
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
            "?????? ?????????????? ???????? ???????????? - ???????? ???????? ???? ??????????",
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

  String? checkFieldEmpty(String? fieldContent) {
    //<-- add String? as a return type
    if (fieldContent!.isEmpty) {
      return '???? ???????? ???????? ????????????????';
    }
    return null;
  }

  _choseImage(XFile file, int typ) async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      // file = pickedFile!;
      setState(() {
        file = pickedFile!;
        print(file.path);
        if (typ == 1) {
          context
              .read<UploadImageMarketProvider>()
              .startUploadImageProfile(file.path, "market");
        } else if (typ == 2) {
          context
              .read<UploadImageMarketProvider>()
              .startUploadImageBanner(file.path, "market");
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Container buildTextFieldFirstName() {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: TextFormField(
        textAlign: TextAlign.right,
        onSaved: (newValue) => firstName = newValue!,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            firstName = value;
          });
          return null;
        },
        validator: (String? value) {
          return (value != null && value.isEmpty)
              ? '???? ???????? ???????? ?????????? ?????????? '
              : null;
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
          hintText: "?????????? ??????????",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  Container buildTextFieldLastName() {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: TextFormField(
        textAlign: TextAlign.right,
        onSaved: (newValue) => lastName = newValue!,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            lastName = value;
          });
          return null;
        },
        validator: (String? value) {
          return (value != null && value.isEmpty)
              ? '???? ???????? ???????? ?????????? ???????????? '
              : null;
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
          hintText: "?????????? ????????????",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}

class NewTitleSelect extends StatelessWidget {
  const NewTitleSelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '????????  200x200 px',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'home',
            fontSize: 8,
            color: const Color(0xff000000),
            height: 2.75,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.right,
        ),
        SizedBox(
          width: 50,
        ),
        Text(
          '  jpg, png  ???????? ?????????????? ???? ??????????-??????',
          style: TextStyle(
            fontFamily: 'home',
            fontSize: 8,
            color: const Color(0xff000000),
            height: 2.75,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.right,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
