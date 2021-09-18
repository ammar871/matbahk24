import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/bussincc_logic/providers/upload_image/upload_image.dart';
import 'package:matbahk24/bussincc_logic/providers/user/add_meal_provider/add_meal_provider.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal1/componts/BarAddMeal.dart';

import 'package:matbahk24/widgets/show_indicator.dart';
import 'package:provider/provider.dart';

import 'ItemListPickImage.dart';
import 'RichTextPikPicture.dart';
import 'TitleFields.dart';

class BodyAddMeal3 extends StatefulWidget {
  final String nameMeal, descMeal, attachments, severWay, personSize;
  final List<String> fields;

  BodyAddMeal3(
      {required this.nameMeal,
      required this.descMeal,
      required this.attachments,
      required this.severWay,
      required this.fields,
      required this.personSize});

  @override
  _BodyAddMeal3State createState() => _BodyAddMeal3State();
}

class _BodyAddMeal3State extends State<BodyAddMeal3> {
  final TextEditingController controller = TextEditingController();
  double cardRadius = 35.0;
  File? image;
  List<String> imagesApi = [];
  List<XFile> images = [];
  late String nots, price, time;
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  double hieghtMedim = 55;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    imagesApi = [];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  BarAddMeal(3, 'اضافة وجبة جديدة'),
                  SizedBox(
                    height: 20,
                  ),
                  _formAddMeal3(),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
            buildButton(context)
          ],
        ),
      ),
    );
  }

  Positioned buildButton(BuildContext context) {
    return Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      hieghtMedim = 80;
                      return;
                    } else {
                      hieghtMedim = 55;
                      _formKey.currentState!.save();
                      context
                          .read<AddMealProvider>()
                          .addMarket(
                              name: widget.nameMeal,
                              desc: widget.descMeal,
                              attachments: widget.attachments,
                              price: price,
                              time: time,
                              serveWay: widget.severWay,
                              nots: nots,
                              persons: widget.personSize,
                              images: imagesApi)
                          .whenComplete(() {
                        if (context.read<AddMealProvider>().isSuccess) {
                          setState(() {
                            Navigator.of(context).pushReplacementNamed(
                                success_add_meal_screen);
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

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          });
                        }
                      });
                    }
                  },
                  color: KHomeColor,
                  child: context.watch<AddMealProvider>().isLoading
                      ? ShowIndicator(
                          color: Colors.white, width: 25, height: 25)
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
                        )),
            ),
            // Container(
            //     margin: EdgeInsets.only(bottom: 5, left: 25, right: 25),
            //     child: DefaultButton(
            //         height: 50,
            //         text: "التالى",
            //         onPress: () {
            //
            //           Navigator.of(context).pushNamed(SuccessAddMealScreen.id);
            //         },
            //         color: KHomeColor,
            //         colorText: Colors.white)),
          );
  }

  Container _formAddMeal3() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TitleFields("سعر الوجبه "),
          SizedBox(
            height: 5,
          ),
          buildTextFieldPrice(),
          TitleFields("الوقت "),
          SizedBox(
            height: 5,
          ),
          buildTextFieldTime(),
          SizedBox(
            height: 5,
          ),
          TitleFields("الملاحظات"),
          SizedBox(
            height: 5,
          ),
          buildTextField(),
          SizedBox(
            height: 5,
          ),
          buildBottomTitle(),
          SizedBox(
            height: 15,
          ),
          RichTextPikPicture(),
          SizedBox(
            height: 10,
          ),
          buildPickImages(),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: images.length,
              itemBuilder: (_, index) {
                return ItemListPickImage(
                  fileImage: images[index],
                  images: images,
                  imagesApi: imagesApi,
                  onTap: () {
                    // print('jkjds${images.length} / ${imagesApi.length}');
                    // setState(() {
                    //   images.remove(images[index]);
                    // imagesApi.removeAt(index);
                    //     });
                  },
                );
              })
        ],
      ),
    );
  }

  Container buildBottomTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
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
    );
  }

  _choseImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      // file = pickedFile!;
      setState(() {
        images.add(pickedFile!);
      });
      context
          .read<UploadImageMarketProvider>()
          .startUploadImageMeal(pickedFile!.path, "food")
          .whenComplete(() {
        imagesApi.add(context.read<UploadImageMarketProvider>().imagemeal);
      });
    } catch (e) {
      print(e);
    }
  }

  Container buildTextField() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: Column(
        children: [
          TextFormField(
            onSaved: (newValue) => nots = newValue!,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (value) {
              nots = value;
            },
            validator: (value) {
              return (value != null && value.isEmpty) ? 'مطلوب * ' : null;
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
              hintText: "اكتب ملاحظات عن الوجبة",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }

  Container buildTextFieldPrice() {
    return Container(
      height: hieghtMedim,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: TextFormField(
        onSaved: (newValue) => price = newValue!,
        keyboardType: TextInputType.number,
        maxLines: null,
        onChanged: (value) {
          price = value;
        },
        validator: (value) {
          return (value != null && value.isEmpty) ? 'مطلوب * ' : null;
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
          hintText: "اكتب السعر",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  Container buildTextFieldTime() {
    return Container(
      height: hieghtMedim,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: TextFormField(
        onSaved: (newValue) => time = newValue!,
        keyboardType: TextInputType.text,
        maxLines: null,
        onChanged: (value) {
          time = value;
        },
        validator: (value) {
          return (value != null && value.isEmpty) ? 'مطلوب * ' : null;
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
          hintText: "اكتب وقت ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  DottedBorder buildPickImages() {
    return DottedBorder(
      color: Colors.black.withOpacity(.5),
      strokeWidth: 1.2,
      radius: Radius.circular(cardRadius),
      dashPattern: [3, 2],
      customPath: (size) {
        return Path()
          ..moveTo(cardRadius, 0)
          ..lineTo(size.width - cardRadius, 0)
          ..arcToPoint(Offset(size.width, cardRadius),
              radius: Radius.circular(cardRadius))
          ..lineTo(size.width, size.height - cardRadius)
          ..arcToPoint(Offset(size.width - cardRadius, size.height),
              radius: Radius.circular(cardRadius))
          ..lineTo(cardRadius, size.height)
          ..arcToPoint(Offset(0, size.height - cardRadius),
              radius: Radius.circular(cardRadius))
          ..lineTo(0, cardRadius)
          ..arcToPoint(Offset(cardRadius, 0),
              radius: Radius.circular(cardRadius));
      },
      child: InkWell(
        onTap: () {
          if (images.length >= 5) {
            final snackBar = SnackBar(
                backgroundColor: Colors.black.withOpacity(.5),
                content: Text("لايمكن اختيار اكثر من 5 صور ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "home")));

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            setState(() {});
          } else {
            _choseImage();
            setState(() {});
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            children: [
              SvgPicture.asset("assets/icons/addimage.svg"),
              SizedBox(
                height: 15,
              ),
              // Adobe XD layer: 'Food' (text)
              SizedBox(
                width: 200,
                child: Text(
                  'قم باختيار الصور لرفعها او تصوير صور باستخدام الكاميرا',
                  maxLines: null,
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 10,
                    color: const Color(0xff000000),
                    height: 1.6,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
              ),
              // Adobe XD layer: 'Food' (text)
              SizedBox(
                width: 200,
                child: Text(
                  'تقبل الصور من الأنواع Jpg png jpeg علي ان لا يتخطي الحجم لاكثر من 500 كيلوبايت للصورة الواحدة',
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 8,
                    color: const Color(0x9c000000),
                    height: 1.625,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
