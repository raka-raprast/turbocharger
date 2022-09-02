// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:turbocharger/data/temporary_data.dart';
import 'package:turbocharger/models/payment.dart';
import 'package:turbocharger/style/colors.dart';
import 'package:turbocharger/widget/custom_textfield.dart';
import 'package:turbocharger/widget/gradient_background_body.dart';
import 'package:turbocharger/widget/part_payment_widget.dart';
import 'package:turbocharger/widget/top_widget.dart';

class AddPaymentWidget extends StatefulWidget {
  const AddPaymentWidget({Key? key}) : super(key: key);

  @override
  State<AddPaymentWidget> createState() => _AddPaymentWidgetState();
}

class _AddPaymentWidgetState extends State<AddPaymentWidget> {
  List<File> imageFiles = [];
  TextEditingController partNumberController = TextEditingController();
  TextEditingController woNumberController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();
  int qty = 0;
  String dropdownValue = 'Gasket Kit';
  Payment selectedPayment = Payment();
  @override
  void initState() {
    setState(() {
      selectedPayment = temporaryPaymentData
          .where((element) => element.description == dropdownValue)
          .first;
      partNumberController.text = selectedPayment.partNo!;
      woNumberController.text = selectedPayment.woNo!;
      priceController.text = selectedPayment.price!.toString();
      descController.text = selectedPayment.description!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GradientBackgroundBody(children: [
                TopWidget(title: "Inspection Holset"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                      color: yellow()),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: RotatedBox(
                        quarterTurns: 3,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                        )),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        selectedPayment = temporaryPaymentData
                            .where((element) =>
                                element.description == dropdownValue)
                            .first;
                        partNumberController.text = selectedPayment.partNo!;
                        woNumberController.text = selectedPayment.woNo!;
                        priceController.text =
                            selectedPayment.price!.toString();
                        descController.text = selectedPayment.description!;
                      });
                    },
                    items: <String>[
                      ...temporaryPaymentData
                          .map((e) => e.description!)
                          .toList()
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                CustomTextField(
                    title: "Part Number",
                    readOnly: true,
                    controller: partNumberController),
                CustomTextField(
                    title: "WO Number",
                    readOnly: true,
                    controller: woNumberController),
                CustomTextField(
                  title: "Price",
                  controller: priceController,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                ),
                // CustomTextField(
                //   title: "Qty",
                //   controller: qtyController,
                //   keyboardType: TextInputType.number,
                // ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Text("Qty"),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (qty != 0) {
                            setState(() {
                              qty = qty - 1;
                            });
                          }
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: yellow(),
                              borderRadius: BorderRadius.circular(200)),
                          child: Center(
                            child: Text(
                              "-",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "$qty",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (qty != 99) {
                            setState(() {
                              qty = qty + 1;
                            });
                          }
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: yellow(),
                              borderRadius: BorderRadius.circular(200)),
                          child: Center(
                            child: Text(
                              "+",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // CustomTextField(
                //   title: "Description",
                //   controller: descController,
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(
                              context,
                              Payment(
                                  partNo: partNumberController.text,
                                  description: descController.text,
                                  woNo: woNumberController.text,
                                  price: int.parse(priceController.text),
                                  qty: qty));
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: yellow().withOpacity(.65)),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(child: Text("Done")),
                        ),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
