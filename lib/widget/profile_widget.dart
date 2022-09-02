// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:turbocharger/models/profile.dart';
import 'package:turbocharger/style/colors.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key, required this.profile}) : super(key: key);
  final Profile profile;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          profile.name,
          style: TextStyle(fontSize: 20, color: yellow()),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          profile.role,
          style: TextStyle(color: grey()),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
