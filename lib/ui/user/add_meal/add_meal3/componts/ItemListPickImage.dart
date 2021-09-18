import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ItemListPickImage extends StatefulWidget {
  final XFile fileImage;
  final List<XFile> images;
  final Function onTap;
  final List<String> imagesApi;

  ItemListPickImage(
      {required this.onTap,
        required this.fileImage,
        required this.images,
        required this.imagesApi});

  @override
  _ItemListPickImageState createState() => _ItemListPickImageState();
}

class _ItemListPickImageState extends State<ItemListPickImage> {
  String size = "";

  getFileSize(String filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    size =
        ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFileSize(widget.fileImage.path, 1).whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.file(
              File(widget.fileImage.path),
              height: 55,
              width: 55,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        widget.fileImage.name,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'home',
                          fontSize: 10,
                          color: const Color(0xff000000),
                          height: 2.2,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      size,
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 10,
                        color: const Color(0x99000000),
                        height: 2.2,
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              )),
          // InkWell(
          //   onTap: () => widget.onTap(),
          //   child: Container(
          //       margin: EdgeInsets.symmetric(horizontal: 10),
          //       child: SvgPicture.asset("assets/icons/close_image.svg")),
          // )
        ],
      ),
    );
  }
}
