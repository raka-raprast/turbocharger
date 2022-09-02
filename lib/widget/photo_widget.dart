// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:turbocharger/style/colors.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget(
      {Key? key,
      this.imageFile,
      this.onTap,
      this.onHoldTap,
      required this.description})
      : super(key: key);
  final File? imageFile;
  final Function()? onTap;
  final Function(File)? onHoldTap;
  final String description;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (imageFile == null) {
          onTap!();
        }
      },
      onLongPress: () {
        if (imageFile != null) {
          onHoldTap!(imageFile!);
        }
      },
      child: imageFile == null
          ? Container(
              decoration: BoxDecoration(color: yellow()),
              child: Icon(
                Icons.camera_enhance,
                size: 80,
              ))
          : Stack(
              children: [
                Image.file(
                  imageFile!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                if (description.isNotEmpty)
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          width: double.infinity,
                          color: Colors.grey.withOpacity(.7),
                          child: Text(
                            description,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          )))
              ],
            ),
    );
  }
}
