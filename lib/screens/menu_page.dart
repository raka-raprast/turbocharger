// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:turbocharger/models/profile.dart';
import 'package:turbocharger/screens/inspection_page.dart';
import 'package:turbocharger/style/colors.dart';
import 'package:turbocharger/widget/gradient_background_body.dart';
import 'package:turbocharger/widget/profile_widget.dart';
import 'package:turbocharger/widget/top_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<String> garretList = [
    'BTV7506',
    'BTV7510',
    'BTV7511',
    'BTV8501',
    'BTV8503',
    'Other',
  ];

  List<String> holsetList = [
    'HX50M',
    'HX55',
    'HX55W',
    'HX60',
    'HX82',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: GradientBackgroundBody(children: [
            TopWidget(title: "Menu"),
            ProfileWidget(
              profile: Profile(
                  name: widget.profile.name,
                  role: widget.profile.role,
                  id: widget.profile.id),
            ),
            Text(
              "Inspeksi & Repair Cost\nTurboCharge",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500, color: grey()),
            ),
            SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrimaryPage(
                                  type: "Holset",
                                  profile: widget.profile,
                                  valueList: holsetList,
                                )));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: yellow(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      "lib/assets/holset.png",
                      width: 120,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Holset TurboCharger",
              style: TextStyle(color: grey(), fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrimaryPage(
                                  type: "Garret",
                                  profile: widget.profile,
                                  valueList: garretList,
                                )));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: yellow(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      "lib/assets/garret.png",
                      width: 120,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Garret TurboCharger",
              style: TextStyle(color: grey(), fontWeight: FontWeight.bold),
            ),
          ]),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
