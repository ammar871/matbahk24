import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/helpers/commen.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/shared_editor.dart';
import 'package:matbahk24/helpers/styels.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal1/add_meal_screen.dart';

import 'package:matbahk24/ui/user/pages/category/category_screen.dart';
import 'package:matbahk24/ui/user/pages/home_user/home_user_screen.dart';

import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

class NavigationPage extends StatefulWidget {
  static String id = "/nav";

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final List<Widget> screens = [
    HomeUserScreen(),
    CategoryScreen(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.brown,
    )
  ];
  ShardEditor shardEditor = ShardEditor();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<String> authToken = shardEditor.getToken(UserToken);
    authToken.then((data) {
      Cemmon.UserToken = data;
    }, onError: (e) {
      print(e);
    });
    Future<String> authUserId = shardEditor.getUserId();
    authUserId.then((data) {
      Cemmon.UserId = data;
    }, onError: (e) {
      print(e);
    });

    Future<String> authUserPhone = shardEditor.getUserId();
    authUserPhone.then((data) {
      Cemmon.Userphone = data;
    }, onError: (e) {
      print(e);
    });
    Future<String> authUserRole = shardEditor.getUserRole();
    authUserRole.then((data) {
      Cemmon.UserRole = data;
    }, onError: (e) {
      print(e);
    });
    Future<String> marketId = shardEditor.getMarket(MarketId);
    marketId.then((data) {
      Cemmon.MarketId = data;
    }, onError: (e) {
      print(e);
    });
    print(" id:${Cemmon.UserId} \n token :${Cemmon.UserToken}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: KYellowColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
                onTap:(){
                  Navigator.of(context).pushNamed(cart_screen);
                },child: RichTextTitle(Color(0xff000000))),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      floatingActionButton: getFloatButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: buildBottomAppBar(),
      endDrawer: MyDrawer(),
    );
  }

  Padding getFloatButton() {
    return Padding(
      padding: EdgeInsets.only(top: 70),
      child: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            if(Cemmon.UserRole=="provider"){
              Navigator.of(context).pushNamed(add_meal1_screen);
            }else{
              Navigator.of(context).pushNamed(trans_account1_screen);

            }

          },
          child: Container(
            padding: EdgeInsets.all(20),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: KBluColor,
            ),
            child: SvgPicture.asset(
              "assets/icons/plus.svg",
              width: 23,
              height: 23,
            ),
          ),
        ),
      ),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: KYellowColor, borderRadius: BorderRadius.circular(15)),
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: StylesWidget.getSvg("assets/icons/Home.svg", 23, 23)),
            InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child:
                    StylesWidget.getSvg("assets/icons/Category.svg", 23, 23)),
            StylesWidget.getSvg("assets/icons/Home.svg", 23, 23),
            SvgPicture.asset(
              "assets/icons/Document.svg",
              width: 23,
              height: 23,
              color: KBluColor,
            ),
            InkWell(
                onTap: () {
                  showBottomSheetNotifications();
                },
                child: StylesWidget.getSvg(
                    "assets/icons/Notification.svg", 23, 23))
          ],
        ),
      ),
    );
  }

  void showBottomSheetNotifications() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext ctx, StateSetter sts) {
              return Container(
                  height: MediaQuery.of(context).size.height * .9,
                  padding: EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  decoration: new BoxDecoration(
                      color: KYellowColor,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0))),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        TitleNotification(),
                        SizedBox(
                          height: 20,
                        ),
                        ListNotification()
                      ],
                    ),
                  ));
            },
          );
        });
  }
}

class ListNotification extends StatelessWidget {
  const ListNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (_, index) {
            return ItemListNotification();
          }),
    );
  }
}

class ItemListNotification extends StatelessWidget {
  const ItemListNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFE2E2E2), borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 90,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                ' 2 د',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 13,
                  color: const Color(0x99000000),
                  letterSpacing: 0.121875,
                  fontWeight: FontWeight.w700,
                  height: 1.5384615384615385,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                '256698',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 13,
                  color: const Color(0xffff0000),
                  letterSpacing: 0.121875,
                  fontWeight: FontWeight.w700,
                  height: 1.5384615384615385,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.right,
              )),
              SizedBox(
                width: 20,
              ),
              Text(
                'الطلب رقم',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 13,
                  color: const Color(0x99000000),
                  letterSpacing: 0.121875,
                  fontWeight: FontWeight.w700,
                  height: 1.5384615384615385,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.right,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'الطلب الان في طور التوصيل برجاء الرد علي الهاتف لعملية تةصيل سلسة',
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 10,
              color: const Color(0x99000000),
              letterSpacing: 0.09375,
              height: 1.2,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.right,
          )
        ],
      ),
    );
  }
}

class TitleNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '2 جديد',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'home',
            fontSize: 13,
            color: const Color(0xff200e32),
            letterSpacing: 0.09750000619888305,
            fontWeight: FontWeight.w700,
            height: 1.6923076923076923,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.right,
        ),
        Text(
          'التنبيهات',
          style: TextStyle(
            fontFamily: 'home',
            fontSize: 25,
            color: const Color(0xff200e32),
            letterSpacing: 0.18750001192092894,
            fontWeight: FontWeight.w700,
            height: 1.72,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.right,
        )
      ],
    );
  }
}
