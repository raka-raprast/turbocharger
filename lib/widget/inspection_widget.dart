// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:turbocharger/style/colors.dart';

class InspectionWidget extends StatelessWidget {
  const InspectionWidget(
      {Key? key, required this.title, required this.onUpload})
      : super(key: key);
  final String title;
  final Function onUpload;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white),
              color: yellow(),
            ),
            width: MediaQuery.of(context).size.width * .5,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: title,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Material(
              child: InkWell(
                onTap: () {
                  onUpload();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white),
                    color: yellow(),
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.width * .3,
                  child: Center(child: Text("Upload Image")),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
