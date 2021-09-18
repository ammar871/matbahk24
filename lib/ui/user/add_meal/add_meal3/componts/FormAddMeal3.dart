import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matbahk24/bussincc_logic/providers/upload_image/upload_image.dart';
import 'package:provider/provider.dart';
import 'BodyAddMeal3.dart';
import 'ItemListPickImage.dart';
import 'RichTextPikPicture.dart';

class FormAddMeal3 extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  final String nameMeal, descMeal, attachments, severWay;
  final List<String> fields;

  FormAddMeal3(
      {required this.nameMeal,
      required this.descMeal,
      required this.attachments,
      required this.severWay,
      required this.fields});

  @override
  _FormAddMeal3State createState() => _FormAddMeal3State();
}

class _FormAddMeal3State extends State<FormAddMeal3> {
  double CardRadius = 35.0;
  File? image;
  XFile _file2 = XFile("path");
  XFile _file1 = XFile("path");
  List<String> imagesApi = [];
  List<XFile> images = [];
  late String nots;

  //late File _imageTwo;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'الملاحظات',
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 15,
                    color: const Color(0xff200e32),
                    letterSpacing: 0.15000000953674317,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.right,
                )
              ],
            ),
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
                      print("jkjds");
                      setState(() {
                        images.remove(images[index]);
                        imagesApi.removeAt(index);
                      });
                    },
                  );
                })
          ],
        ),
      ),
    );
  }

  _choseImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      // file = pickedFile!;
      setState(() {
        images.add(pickedFile!);

        context
            .read<UploadImageMarketProvider>()
            .startUploadImageMeal(pickedFile.path, "food")
            .whenComplete(() {
          imagesApi.add(context.read<UploadImageMarketProvider>().image1);
        });
      });
    } catch (e) {
      print(e);
    }
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
            controller: widget.controller,
            onChanged: (value) {
              nots = value;
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
              hintText: "اكتب ملاحظات عن الوجبة",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }

  DottedBorder buildPickImages() {
    return DottedBorder(
      color: Colors.black.withOpacity(.5),
      strokeWidth: 1.2,
      radius: Radius.circular(CardRadius),
      dashPattern: [3, 2],
      customPath: (size) {
        return Path()
          ..moveTo(CardRadius, 0)
          ..lineTo(size.width - CardRadius, 0)
          ..arcToPoint(Offset(size.width, CardRadius),
              radius: Radius.circular(CardRadius))
          ..lineTo(size.width, size.height - CardRadius)
          ..arcToPoint(Offset(size.width - CardRadius, size.height),
              radius: Radius.circular(CardRadius))
          ..lineTo(CardRadius, size.height)
          ..arcToPoint(Offset(0, size.height - CardRadius),
              radius: Radius.circular(CardRadius))
          ..lineTo(0, CardRadius)
          ..arcToPoint(Offset(CardRadius, 0),
              radius: Radius.circular(CardRadius));
      },
      child: InkWell(
        onTap: () {
          _choseImage();
          setState(() {});
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
