// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turbocharger/models/image_file.dart';
import 'package:turbocharger/style/colors.dart';
import 'package:turbocharger/widget/custom_textfield.dart';
import 'package:turbocharger/widget/gradient_background_body.dart';
import 'package:turbocharger/widget/photo_widget.dart';

class PhotoPickerScreen extends StatefulWidget {
  const PhotoPickerScreen({Key? key}) : super(key: key);

  @override
  State<PhotoPickerScreen> createState() => _PhotoPickerScreenState();
}

class _PhotoPickerScreenState extends State<PhotoPickerScreen> {
  Future<File> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return File("");
      final imageTemp = File(image.path);
      return imageTemp;
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
      return File("");
    }
  }

  TextEditingController descController = TextEditingController();
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GradientBackgroundBody(children: [
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () async {
                var val = await pickImage();
                setState(() {
                  selectedImage = val;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .7,
                height: MediaQuery.of(context).size.width * .7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: yellow()),
                child: selectedImage != null
                    ? Image.file(
                        selectedImage!,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.camera_enhance,
                        size: 80,
                      ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(title: "Description", controller: descController),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(
                          context,
                          ImageFile(
                              image: selectedImage!,
                              desc: descController.text));
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: yellow().withOpacity(.65)),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(child: Text("Next")),
                    ),
                  ),
                )),
          ]),
        )
      ]),
    );
  }
}
