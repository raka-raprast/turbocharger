// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:turbocharger/models/profile.dart';
import 'package:turbocharger/screens/menu_page.dart';
import 'package:turbocharger/style/colors.dart';
import 'package:turbocharger/widget/gradient_background_body.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController id = TextEditingController();
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackgroundBody(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Log In",
                style: TextStyle(
                    color: yellow(), fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: yellow()),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Name"),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: yellow()),
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: role,
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: "Role"),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: yellow()),
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: id,
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: "ID"),
              )),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MenuPage(
                            profile: Profile(
                                name: name.text, role: role.text, id: id.text),
                          )));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 25),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: yellow(), borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 20, color: grey()),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
