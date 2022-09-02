import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:turbocharger/style/colors.dart';

class GradientBackgroundBody extends StatelessWidget {
  const GradientBackgroundBody(
      {Key? key,
      required this.children,
      this.crossAxisAlignment,
      this.mainAxisAlignment,
      this.enListView = false})
      : super(key: key);
  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool enListView;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: enListView ? MediaQuery.of(context).size.height : null,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.4, 0.8],
                colors: [lightGreen(), darkGreen()])),
        child: enListView
            ? ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisAlignment:
                        mainAxisAlignment ?? MainAxisAlignment.start,
                    crossAxisAlignment:
                        crossAxisAlignment ?? CrossAxisAlignment.center,
                    children: children,
                  ),
                ],
              )
            : Column(
                children: [
                  Column(
                    mainAxisAlignment:
                        mainAxisAlignment ?? MainAxisAlignment.start,
                    crossAxisAlignment:
                        crossAxisAlignment ?? CrossAxisAlignment.center,
                    children: children,
                  ),
                ],
              ),
      ),
    );
  }
}
