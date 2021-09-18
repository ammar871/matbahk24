import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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