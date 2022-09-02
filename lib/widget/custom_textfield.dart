// ignore_for_file: prefer_const_constructors, unnecessary_null_in_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:turbocharger/style/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.title,
      required this.controller,
      this.keyboardType,
      this.height = 50,
      this.maxLines,
      this.readOnly = false})
      : super(key: key);
  final String title;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final double height;
  final int? maxLines;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white),
              color: yellow(),
            ),
            child: TextField(
              readOnly: readOnly,
              controller: controller,
              keyboardType: keyboardType ?? TextInputType.text,
              maxLines: maxLines,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
