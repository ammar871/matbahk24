import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal1/componts/BarAddMeal.dart';
import 'package:matbahk24/ui/user/add_meal/successAddMeal/success_add_meal_screen.dart';
import 'package:matbahk24/widgets/default_button.dart';

class BodyAddMeal3 extends StatelessWidget {
final  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(

        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                BarAddMeal(3,'اضافة وجبة جديدة'),
                SizedBox(
                  height: 20,
                ),
                FormAddMeal3(controller),

                SizedBox(
                  height: 70,
                )

              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                margin: EdgeInsets.only(bottom: 5,left: 25,right: 25),
                child: DefaultButton(height: 50, text: "التالى", onPress: (){
                    Navigator.of(context).pushNamed(SuccessAddMealScreen.id);

                }, color: KHomeColor, colorText: Colors.white)),
          )

        ],
      ),
    );
  }
}

class FormAddMeal3 extends StatefulWidget {
 late final  TextEditingController controller;


  FormAddMeal3(this.controller);

  @override
  _FormAddMeal3State createState() => _FormAddMeal3State();
}

class _FormAddMeal3State extends State<FormAddMeal3> {
 double CardRadius = 35.0;
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
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(35)),
          child: Column(
            children: [
              TextFormField(
                onSaved: (newValue) => newValue = newValue!,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller:widget.controller,
                onChanged: (value) {

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
                  hintText: "اكتب ملاحظات عن الوجبة",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ],
          ),
        ),
            SizedBox(
              height: 5,
            ),
            Container(
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
            ),
            SizedBox(
              height: 15,
            ),
            RichTextPikPicture(),
            SizedBox(
              height: 10,
            ),
            DottedBorder(
              color: Colors.black.withOpacity(.5),
              strokeWidth: 1.2,
              radius: Radius.circular(CardRadius),
              dashPattern: [3, 2],
              customPath: (size) {
                return Path()
                  ..moveTo(CardRadius, 0)
                  ..lineTo(size.width - CardRadius, 0)
                  ..arcToPoint(Offset(size.width, CardRadius), radius: Radius.circular(CardRadius))
                  ..lineTo(size.width, size.height - CardRadius)
                  ..arcToPoint(Offset(size.width - CardRadius, size.height), radius: Radius.circular(CardRadius))
                  ..lineTo(CardRadius, size.height)
                  ..arcToPoint(Offset(0, size.height - CardRadius), radius: Radius.circular(CardRadius))
                  ..lineTo(0, CardRadius)
                  ..arcToPoint(Offset(CardRadius, 0), radius: Radius.circular(CardRadius));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(35),

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
            SizedBox(height: 10,)
            ,ListPickImages()
          ],
        ),
      ),
    );
  }
}

class ListPickImages extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (_,index){
      return ItemListPickImage();
    });
  }
}

class ItemListPickImage extends StatelessWidget {
  const ItemListPickImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
        margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
          color: Colors.white
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.asset("assets/images/image.png",height: 55,width: 55,fit: BoxFit.cover,),
          ),
           Expanded(child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 5),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 SizedBox(

                   width: 100,child:
                 Text(
                     'MyNewDish01.jpgaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                     maxLines: 1,

                     style: TextStyle(

                       fontFamily: 'home',
                       fontSize: 10,
                       color: const Color(0xff000000),
                       height: 2.2,

                     ),
                     textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                     textAlign: TextAlign.left,
                   overflow: TextOverflow.ellipsis,
                   ),
                 ),
                 Text(
                   '155  KB',
                   style: TextStyle(
                     fontFamily: 'home',
                     fontSize: 10,
                     color: const Color(0x99000000),
                     height: 2.2,
                   ),
                   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                   textAlign: TextAlign.left,
                 ),

               ],
             ),
           )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset("assets/icons/close_image.svg"))

        ],
      ),
    );
  }
}


class RichTextPikPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 15,
              color: const Color(0xff200e32),
              letterSpacing: 0.15000000953674317,
            ),
            children: [
              TextSpan(
                text: 'الصور',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: ' - حتي 5 صور',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 0.08250000524520874,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
