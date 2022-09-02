// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:turbocharger/screens/profile_page.dart';
import 'package:turbocharger/screens/sign_in_screen.dart';
import 'package:turbocharger/style/colors.dart';
import 'package:turbocharger/widget/gradient_background_body.dart';
import 'package:turbocharger/widget/top_widget.dart';

class FirstSplashScreen extends StatefulWidget {
  const FirstSplashScreen({Key? key}) : super(key: key);

  @override
  State<FirstSplashScreen> createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.direction > 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SecondSplashScreen()));
        }
      },
      child: Scaffold(
        body: GradientBackgroundBody(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(child: Image.asset("lib/assets/splash_1.png")),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: yellow()),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                        color: grey()),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondSplashScreen()));
              },
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Swipe",
                      style: TextStyle(color: grey(), fontSize: 17),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "lib/assets/arrow_right.png",
                      width: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondSplashScreen extends StatefulWidget {
  SecondSplashScreen({Key? key}) : super(key: key);

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.direction > 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ThirdSplashScreen()));
        }
        if (details.delta.direction <= 0) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        body: GradientBackgroundBody(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SafeArea(child: Image.asset("lib/assets/splash_2.png")),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: yellow(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "To help you for report\n turbocharger service",
                      style: TextStyle(fontSize: 20, color: grey()),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThirdSplashScreen()));
              },
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Swipe",
                      style: TextStyle(color: grey(), fontSize: 17),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "lib/assets/arrow_right.png",
                      width: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ThirdSplashScreen extends StatefulWidget {
  ThirdSplashScreen({Key? key}) : super(key: key);

  @override
  State<ThirdSplashScreen> createState() => _ThirdSplashScreenState();
}

class _ThirdSplashScreenState extends State<ThirdSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.direction > 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInScreen()));
        }
        if (details.delta.direction <= 0) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        body: GradientBackgroundBody(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                ),
                SafeArea(child: Image.asset("lib/assets/splash_3.png")),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    decoration: BoxDecoration(
                        color: yellow(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Inspect & Repair\nTurbocharge In\nEverywhere",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: grey()),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Swipe",
                      style: TextStyle(color: grey(), fontSize: 17),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "lib/assets/arrow_right.png",
                      width: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
