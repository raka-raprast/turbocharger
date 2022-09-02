// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:turbocharger/style/colors.dart';
import 'package:turbocharger/widget/underheadline_component.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: SafeArea(
              child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 20, color: yellow()),
            ),
          )),
        ),
        underHeadlineDecoration(context),
      ],
    );
  }
}
