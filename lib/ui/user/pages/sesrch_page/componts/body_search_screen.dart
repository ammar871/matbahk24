import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/bussincc_logic/providers/user/search_provider/search_provider.dart';
import 'package:matbahk24/helpers/constans.dart';

import 'package:matbahk24/ui/user/pages/home_user/componts/list_products.dart';
import 'package:matbahk24/widgets/show_indicator.dart';
import 'package:provider/provider.dart';

class BodySearchScreen extends StatefulWidget {
  @override
  _BodySearchScreenState createState() => _BodySearchScreenState();
}

class _BodySearchScreenState extends State<BodySearchScreen> {
  TextEditingController controller = new TextEditingController();

  getData(String text) {
    Future.delayed(Duration(milliseconds: 100), () async {
      context.read<SearchProvider>().getData(text);

      setState(() {});
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ابحث عن اكلة تحبها',
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.4285714285714286,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5,
                ),
                Center(child: Icon(Icons.search)),
                Expanded(
                    child: Center(
                  child: TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'ابحث عن اكلة تحبها',
                        border: InputBorder.none),
                    onChanged: (value) {
                      getData(value);

                    },
                  ),
                )),
                controller.text.isEmpty
                    ? SizedBox()
                    : IconButton(
                        icon: new Icon(Icons.cancel),
                        onPressed: () {
                          controller.clear();

                          setState(() {});
                          // onSearchTextChanged('');
                        },
                      ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ),
        context.watch<SearchProvider>().isLoading
            ? Container(
            height: MediaQuery.of(context).size.height*.8,
            child: Center(child: ShowIndicator(color: KYellowColor, width: 30, height: 30)))
            : ListProducts(foods: context.watch<SearchProvider>().foods)
      ],
    ));
  }
}
