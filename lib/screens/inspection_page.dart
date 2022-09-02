// ignore_for_file: prefer_const_constructors, nullable_type_in_catch_clause

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turbocharger/models/detail.dart';
import 'package:turbocharger/models/image_file.dart';
import 'package:turbocharger/models/inspections.dart';
import 'package:turbocharger/models/payment.dart';
import 'package:turbocharger/models/profile.dart';
import 'package:turbocharger/screens/pdf_preview_screen.dart';
import 'package:turbocharger/screens/photo_picker_screen.dart';
import 'package:turbocharger/style/colors.dart';
import 'package:turbocharger/widget/add_inspection_details.dart';
import 'package:turbocharger/widget/add_payment.dart';
import 'package:turbocharger/widget/custom_textfield.dart';
import 'package:turbocharger/widget/gradient_background_body.dart';
import 'package:turbocharger/widget/inspection_widget.dart';
import 'package:turbocharger/widget/part_payment_widget.dart';
import 'package:turbocharger/widget/photo_widget.dart';
import 'package:turbocharger/widget/top_widget.dart';
import 'package:turbocharger/widget/underheadline_component.dart';

class PrimaryPage extends StatefulWidget {
  const PrimaryPage(
      {Key? key,
      required this.profile,
      required this.type,
      required this.valueList})
      : super(key: key);
  final Profile profile;
  final String type;
  final List<String> valueList;

  @override
  State<PrimaryPage> createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  List<String> valueList = [];
  String dropdownValue = '';
  TextEditingController inspectionModel = TextEditingController();
  @override
  void initState() {
    setState(() {
      valueList = widget.valueList;
      dropdownValue = widget.valueList.first;
    });
    super.initState();
  }

  bool enableOther = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GradientBackgroundBody(enListView: true, children: [
        TopWidget(title: widget.type),
        SizedBox(
          height: 20,
        ),
        Image.asset(
          "lib/assets/${widget.type.toLowerCase()}.png",
          height: MediaQuery.of(context).size.width * .6,
          width: MediaQuery.of(context).size.width * .6,
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * .1,
        // ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InspectionPrimaryFirstPage(
                            profile: widget.profile,
                            type: widget.type,
                            model: inspectionModel.text.isNotEmpty
                                ? inspectionModel.text
                                : dropdownValue,
                          )));
            },
            child: Column(
              children: [
                Image.asset("lib/assets/inspect_icon.png"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Inspeksi",
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold, color: grey()),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: yellow(), borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: RotatedBox(
                        quarterTurns: 3,
                        child: const Icon(Icons.arrow_back_ios_new)),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                      if (dropdownValue == "Other") {
                        setState(() {
                          enableOther = true;
                        });
                      } else {
                        setState(() {
                          enableOther = false;
                        });
                      }
                    },
                    items: <String>[...valueList]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white),
                    color: enableOther ? yellow() : Colors.grey,
                  ),
                  child: TextField(
                    readOnly: !enableOther,
                    controller: inspectionModel,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ))
      ]),
    );
  }
}

class InspectionPrimaryFirstPage extends StatefulWidget {
  const InspectionPrimaryFirstPage(
      {Key? key,
      required this.profile,
      required this.type,
      required this.model})
      : super(key: key);
  final Profile profile;
  final String type;
  final String model;
  @override
  State<InspectionPrimaryFirstPage> createState() =>
      _InspectionPrimaryFirstPageState();
}

class _InspectionPrimaryFirstPageState
    extends State<InspectionPrimaryFirstPage> {
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();
  TextEditingController attController = TextEditingController();
  TextEditingController custReffController = TextEditingController();
  TextEditingController sjNumberController = TextEditingController();
  TextEditingController quoteNumberController = TextEditingController();
  TextEditingController componentMakeController = TextEditingController();
  TextEditingController partNumberController = TextEditingController();
  TextEditingController serialNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          GradientBackgroundBody(children: [
            TopWidget(title: "Inspection ${widget.type}"),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              title: 'Customer Name',
              controller: customerNameController,
            ),
            CustomTextField(
              title: 'Customer Address',
              controller: customerAddressController,
            ),
            CustomTextField(
              title: 'Att',
              controller: attController,
            ),
            CustomTextField(
              title: 'Cust. Reff',
              controller: custReffController,
            ),
            CustomTextField(
              title: 'SJ Number',
              controller: sjNumberController,
            ),
            CustomTextField(
              title: 'Quote Number',
              controller: quoteNumberController,
            ),
            CustomTextField(
              title: 'Component Make',
              controller: componentMakeController,
            ),
            CustomTextField(
              title: 'Part Number',
              controller: partNumberController,
            ),
            CustomTextField(
              title: 'Serial Number',
              controller: serialNumberController,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InspectionPrimarySecondPage(
                                    type: widget.type,
                                    inspection: Inspection(
                                        type: widget.type == "Holset"
                                            ? InspectionType.holset
                                            : InspectionType.garret,
                                        customerName:
                                            customerNameController.text,
                                        customerAddress:
                                            customerAddressController.text,
                                        att: attController.text,
                                        custReff: custReffController.text,
                                        sjNumber: sjNumberController.text,
                                        quoteNumber: quoteNumberController.text,
                                        componentMake:
                                            componentMakeController.text,
                                        partNumber: partNumberController.text,
                                        serialNumber:
                                            serialNumberController.text),
                                    profile: widget.profile,
                                    model: widget.model,
                                  )));
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
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
          ]),
        ],
      ),
    );
  }
}

class InspectionPrimarySecondPage extends StatefulWidget {
  const InspectionPrimarySecondPage(
      {Key? key,
      required this.inspection,
      required this.profile,
      required this.type,
      required this.model})
      : super(key: key);
  final Inspection inspection;
  final Profile profile;
  final String type;
  final String model;
  @override
  State<InspectionPrimarySecondPage> createState() =>
      _InspectionPrimarySecondPageState();
}

class _InspectionPrimarySecondPageState
    extends State<InspectionPrimarySecondPage> {
  TextEditingController quotationYearController = TextEditingController();
  TextEditingController quotationMonthController = TextEditingController();
  TextEditingController quotationDateController = TextEditingController();
  TextEditingController cardIdController = TextEditingController();
  TextEditingController unitNumberController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackgroundBody(children: [
        TopWidget(title: "Inspection ${widget.type}"),
        SizedBox(
          height: 20,
        ),
        CustomTextField(
          title: 'Quotation Year',
          controller: quotationYearController,
        ),
        CustomTextField(
          title: 'Quotation Month',
          controller: quotationMonthController,
        ),
        CustomTextField(
          title: 'Quotation Date',
          controller: quotationDateController,
        ),
        CustomTextField(
          title: 'Card ID',
          controller: cardIdController,
        ),
        CustomTextField(
          title: 'Unit Number',
          controller: unitNumberController,
        ),
        // CustomTextField(title: "Model", controller: modelController),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  var ins = widget.inspection;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InspectionPrimaryThirdPage(
                                type: widget.type,
                                inspection: Inspection(
                                  type: widget.type == "Holset"
                                      ? InspectionType.holset
                                      : InspectionType.garret,
                                  customerName: ins.customerName,
                                  customerAddress: ins.customerAddress,
                                  att: ins.att,
                                  custReff: ins.custReff,
                                  sjNumber: ins.sjNumber,
                                  quoteNumber: ins.quoteNumber,
                                  componentMake: ins.componentMake,
                                  partNumber: ins.partNumber,
                                  serialNumber: ins.serialNumber,
                                  quotationYear: quotationYearController.text,
                                  quotationMonth: quotationMonthController.text,
                                  quotationDate: quotationDateController.text,
                                  cardId: cardIdController.text,
                                  unitNumber: unitNumberController.text,
                                  model: widget.model,
                                ),
                                profile: widget.profile,
                              )));
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
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
      ]),
    );
  }
}

class InspectionPrimaryThirdPage extends StatefulWidget {
  const InspectionPrimaryThirdPage(
      {Key? key,
      required this.inspection,
      required this.profile,
      required this.type})
      : super(key: key);
  final Inspection inspection;
  final Profile profile;
  final String type;
  @override
  State<InspectionPrimaryThirdPage> createState() =>
      _InspectionPrimaryThirdPageState();
}

class _InspectionPrimaryThirdPageState
    extends State<InspectionPrimaryThirdPage> {
  List<Detail> detailList = [];
  Detail compressor = Detail(title: "Compressor Housing", partDetails: []);
  Detail turbine = Detail(title: "Turbine Housing", partDetails: []);
  Detail chra =
      Detail(title: "Center Housing Rotating Assembly", partDetails: []);
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GradientBackgroundBody(children: [
              TopWidget(title: "Inspection ${widget.type}"),
              SizedBox(
                height: 20,
              ),
              DetailsWidget(
                title: "Compressor Housing",
                detail: compressor,
                onTap: () async {
                  var val = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddInspectionDetails(
                                detail: compressor,
                              )));

                  setState(() {
                    compressor = val;
                  });
                },
              ),
              DetailsWidget(
                title: "Turbine Housing",
                detail: turbine,
                onTap: () async {
                  var val = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddInspectionDetails(
                                detail: turbine,
                              )));

                  setState(() {
                    turbine = val;
                  });
                },
              ),
              DetailsWidget(
                title: "Center Housing Rotating Assembly",
                detail: chra,
                onTap: () async {
                  var val = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddInspectionDetails(
                                detail: chra,
                              )));
                  setState(() {
                    chra = val;
                  });
                },
              ),
              Text("Comment"),
              Container(
                margin: EdgeInsets.all(15),
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.white),
                  color: yellow(),
                ),
                child: TextField(
                  controller: commentController,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InspectionPrimaryForthPage(
                                      type: widget.type,
                                      detailList: [compressor, turbine, chra],
                                      inspection: widget.inspection,
                                      comment: commentController.text,
                                      profile: widget.profile,
                                    )));
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
          ),
        ],
      ),
    );
  }
}

class InspectionPrimaryForthPage extends StatefulWidget {
  const InspectionPrimaryForthPage(
      {Key? key,
      required this.detailList,
      required this.inspection,
      required this.comment,
      required this.profile,
      required this.type})
      : super(key: key);
  final List<Detail> detailList;
  final Inspection inspection;
  final String comment;
  final Profile profile;
  final String type;
  @override
  State<InspectionPrimaryForthPage> createState() =>
      _InspectionPrimaryForthPageState();
}

class _InspectionPrimaryForthPageState
    extends State<InspectionPrimaryForthPage> {
  List<ImageFile> imageFiles = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GradientBackgroundBody(children: [
              TopWidget(title: "Inspection ${widget.type}"),
              GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(25),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: 6,
                  itemBuilder: (context, i) {
                    return PhotoWidget(
                      imageFile:
                          i < imageFiles.length ? imageFiles[i].image : null,
                      onTap: () async {
                        var val = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => PhotoPickerScreen()));
                        setState(() {
                          imageFiles.add(val);
                        });
                      },
                      onHoldTap: (image) {},
                      description:
                          i < imageFiles.length ? imageFiles[i].desc : "",
                    );
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InspectionPrimaryFifthPage(
                                      type: widget.type,
                                      detailList: widget.detailList,
                                      imageFiles: imageFiles,
                                      insepction: widget.inspection,
                                      comment: widget.comment,
                                      profile: widget.profile,
                                    )));
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
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class InspectionPrimaryFifthPage extends StatefulWidget {
  const InspectionPrimaryFifthPage(
      {Key? key,
      required this.imageFiles,
      required this.detailList,
      required this.insepction,
      required this.comment,
      required this.profile,
      required this.type})
      : super(key: key);
  final List<ImageFile> imageFiles;
  final List<Detail> detailList;
  final Inspection insepction;
  final String comment;
  final Profile profile;
  final String type;
  @override
  State<InspectionPrimaryFifthPage> createState() =>
      _InspectionPrimaryFifthPageState();
}

class _InspectionPrimaryFifthPageState
    extends State<InspectionPrimaryFifthPage> {
  TextEditingController mainDescriptionController = TextEditingController();
  List<Payment> paymentList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GradientBackgroundBody(children: [
                TopWidget(title: "Inspection ${widget.type}"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: grey().withOpacity(.2),
                      border: Border.all(color: yellow())),
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * .4,
                  child: ListView(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: paymentList.length,
                          itemBuilder: (context, i) {
                            return PartPaymentWidget(payment: paymentList[i]);
                          }),
                      TextButton(
                          onPressed: () async {
                            var val = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPaymentWidget()));
                            setState(() {
                              paymentList.add(val);
                            });
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(color: yellow()),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                CustomTextField(
                  title: "Description",
                  controller: mainDescriptionController,
                  height: 120,
                  maxLines: null,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          createPDF(
                              context,
                              widget.profile,
                              widget.detailList,
                              widget.insepction,
                              widget.imageFiles,
                              paymentList,
                              mainDescriptionController.text,
                              widget.comment);
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: yellow().withOpacity(.65)),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(child: Text("Preview PDF")),
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
