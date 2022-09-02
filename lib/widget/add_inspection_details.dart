// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_function_literals_in_foreach_calls

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:turbocharger/function/extension.dart';
import 'package:turbocharger/models/detail.dart';
import 'package:turbocharger/style/colors.dart';
import 'package:turbocharger/widget/custom_textfield.dart';
import 'package:turbocharger/widget/gradient_background_body.dart';
import 'package:turbocharger/widget/top_widget.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget(
      {Key? key,
      required this.detail,
      required this.onTap,
      required this.title})
      : super(key: key);
  final Detail detail;
  final Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: yellow(), borderRadius: BorderRadius.circular(15)),
        child: detail.title.isEmpty || detail.partDetails.isEmpty
            ? _buildEmptyDetail()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(detail.title),
                      ]),
                  RotatedBox(quarterTurns: 2, child: Icon(Icons.arrow_back_ios))
                ],
              ),
      ),
    );
  }

  Widget _buildEmptyDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        RotatedBox(quarterTurns: 2, child: Icon(Icons.arrow_back_ios))
      ],
    );
  }
}

class AddInspectionDetails extends StatefulWidget {
  const AddInspectionDetails({Key? key, this.detail}) : super(key: key);
  final Detail? detail;

  @override
  State<AddInspectionDetails> createState() => _AddInspectionDetailsState();
}

class _AddInspectionDetailsState extends State<AddInspectionDetails> {
  String title = '';
  bool condition = true;
  String dropdownFirstValue = "good";
  String actionFirstValue = "now";
  String dropdownSecondValue = "good";
  String actionSecondValue = "now";
  String dropdownThirdValue = "good";
  String actionThirdValue = "now";
  String dropdownForthValue = "good";
  String actionForthValue = "now";
  String dropdownFifthValue = "good";
  String actionFifthValue = "now";
  List<PartDetail> inspectionDetails = [];
  List<String> listPartCondition = [
    "good",
    "leaking",
    "bent",
    "worn-out",
    "scratch",
    "cracked",
    "damaged",
    "seepage",
    "chipped"
  ];
  List<String> partAction = ["now", "next repair"];
  @override
  void initState() {
    if (widget.detail!.title.isNotEmpty) {
      setState(() {
        title = widget.detail!.title;
      });
    }
    if (widget.detail!.partDetails.isNotEmpty &&
        widget.detail!.title == "Compressor Housing") {
      String wc = widget.detail!.partDetails
          .where((element) => element.title == "Wheel Compressor")
          .toList()
          .first
          .condition;
      String cp = widget.detail!.partDetails
          .where((element) => element.title == "Compressor Housing")
          .toList()
          .first
          .condition;
      String awc = widget.detail!.partDetails
          .where((element) => element.title == "Wheel Compressor")
          .toList()
          .first
          .action;
      String acp = widget.detail!.partDetails
          .where((element) => element.title == "Compressor Housing")
          .toList()
          .first
          .action;
      setState(() {
        condition = false;
        dropdownFirstValue = wc;
        dropdownSecondValue = cp;
        actionFirstValue = awc;
        actionSecondValue = acp;
      });
    }
    if (widget.detail!.partDetails.isNotEmpty &&
        widget.detail!.title == "Turbine Housing") {
      String wc = widget.detail!.partDetails
          .where((element) => element.title == "Wheel Turbine")
          .toList()
          .first
          .condition;
      String cp = widget.detail!.partDetails
          .where((element) => element.title == "Turbine Housing")
          .toList()
          .first
          .condition;
      String awc = widget.detail!.partDetails
          .where((element) => element.title == "Wheel Turbine")
          .toList()
          .first
          .action;
      String acp = widget.detail!.partDetails
          .where((element) => element.title == "Turbine Housing")
          .toList()
          .first
          .action;
      setState(() {
        condition = false;
        dropdownFirstValue = wc;
        dropdownSecondValue = cp;
        actionFirstValue = awc;
        actionSecondValue = acp;
      });
    }
    if (widget.detail!.partDetails.isNotEmpty &&
        widget.detail!.title == "Center Housing Rotating Assembly") {
      String a = widget.detail!.partDetails
          .where((element) => element.title == "Center Housing")
          .toList()
          .first
          .condition;
      String b = widget.detail!.partDetails
          .where((element) => element.title == "Whell Shaft")
          .toList()
          .first
          .condition;
      String aa = widget.detail!.partDetails
          .where((element) => element.title == "Center Housing")
          .toList()
          .first
          .action;
      String bb = widget.detail!.partDetails
          .where((element) => element.title == "Whell Shaft")
          .toList()
          .first
          .action;
      String c = widget.detail!.partDetails
          .where((element) => element.title == "Repair Kit")
          .toList()
          .first
          .condition;
      String d = widget.detail!.partDetails
          .where((element) => element.title == "Oil Inlet")
          .toList()
          .first
          .condition;
      String cc = widget.detail!.partDetails
          .where((element) => element.title == "Repair Kit")
          .toList()
          .first
          .action;
      String dd = widget.detail!.partDetails
          .where((element) => element.title == "Oil Inlet")
          .toList()
          .first
          .action;
      String e = widget.detail!.partDetails
          .where((element) => element.title == "Seal")
          .toList()
          .first
          .condition;
      String ee = widget.detail!.partDetails
          .where((element) => element.title == "Seal")
          .toList()
          .first
          .action;
      setState(() {
        condition = false;
        dropdownFirstValue = a;
        dropdownSecondValue = b;
        dropdownThirdValue = c;
        dropdownForthValue = d;
        dropdownFifthValue = e;
        actionFirstValue = aa;
        actionSecondValue = bb;
        actionThirdValue = cc;
        actionForthValue = dd;
        actionFifthValue = ee;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GradientBackgroundBody(enListView: true, children: [
              TopWidget(title: "Inspection Holset"),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.detail!.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Main Condition"),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          condition = true;
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                border: Border.all(color: Colors.white)),
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color:
                                      condition ? yellow() : Colors.transparent,
                                  borderRadius: BorderRadius.circular(200),
                                  border: condition
                                      ? Border.all(color: yellow())
                                      : null),
                            ),
                          ),
                          Text("Good"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          condition = false;
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                border: Border.all(color: Colors.white)),
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: !condition
                                      ? yellow()
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(200),
                                  border: !condition
                                      ? Border.all(color: yellow())
                                      : null),
                            ),
                          ),
                          Text("Bad")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!condition) _buildOption(),
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
                          Detail(
                            title: title,
                            partDetails: widget.detail!.title !=
                                    "Center Housing Rotating Assembly"
                                ? [
                                    PartDetail(
                                        title: widget.detail!.title ==
                                                "Compressor Housing"
                                            ? "Wheel Compressor"
                                            : "Wheel Turbine",
                                        condition: dropdownFirstValue,
                                        action: actionFirstValue),
                                    PartDetail(
                                        title: widget.detail!.title ==
                                                "Compressor Housing"
                                            ? "Compressor Housing"
                                            : "Turbine Housing",
                                        condition: dropdownSecondValue,
                                        action: actionSecondValue)
                                  ]
                                : [
                                    PartDetail(
                                        title: "Center Housing",
                                        condition: dropdownFirstValue,
                                        action: actionFirstValue),
                                    PartDetail(
                                      title: "Whell Shaft",
                                      condition: dropdownSecondValue,
                                      action: actionSecondValue,
                                    ),
                                    PartDetail(
                                        title: "Repair Kit",
                                        condition: dropdownThirdValue,
                                        action: actionThirdValue),
                                    PartDetail(
                                      title: "Oil Inlet",
                                      condition: dropdownForthValue,
                                      action: actionForthValue,
                                    ),
                                    PartDetail(
                                        title: "Seal",
                                        condition: dropdownFifthValue,
                                        action: actionFifthValue),
                                  ],
                          ),
                        );
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
    );
  }

  Widget _buildOption() {
    if (title == "Compressor Housing") {
      return Column(
        // shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: ListView(
              shrinkWrap: true,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Wheel Compressor",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Condition"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: yellow()),
                      child: DropdownButton<String>(
                        value: dropdownFirstValue,
                        icon: RotatedBox(
                            quarterTurns: 3,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                            )),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          PartDetail data =
                              PartDetail(title: '', condition: '', action: '');
                          if (inspectionDetails.isNotEmpty) {
                            inspectionDetails.forEach((element) {
                              if (element.title == "Wheel Compressor") {
                                data = element;
                              }
                            });
                          }
                          if (data.title.isNotEmpty) {
                            inspectionDetails.remove(data);
                          }
                          setState(() {
                            dropdownFirstValue = newValue!;
                          });
                          if (dropdownFirstValue == "good") {
                            setState(() {
                              actionFirstValue = "now";
                            });
                          }
                          if (dropdownFirstValue != "good") {
                            inspectionDetails.add(PartDetail(
                                title: "Wheel Compressor",
                                condition: dropdownFirstValue,
                                action: actionFirstValue));
                          }
                        },
                        items: <String>[...listPartCondition]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                if (dropdownFirstValue != "good")
                  SizedBox(
                    height: 10,
                  ),
                if (dropdownFirstValue != "good")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Action"),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            color: yellow()),
                        child: DropdownButton<String>(
                          value: actionFirstValue,
                          icon: RotatedBox(
                              quarterTurns: 3,
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              )),
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? newValue) {
                            PartDetail data = PartDetail(
                                title: '', condition: '', action: '');
                            if (inspectionDetails.isNotEmpty) {
                              inspectionDetails.forEach((element) {
                                if (element.title == "Wheel Compressor") {
                                  data = element;
                                }
                              });
                            }
                            if (data.title.isNotEmpty) {
                              inspectionDetails.remove(data);
                            }
                            setState(() {
                              actionFirstValue = newValue!;
                            });
                            if (dropdownFirstValue != "good") {
                              inspectionDetails.add(PartDetail(
                                  title: "Wheel Compressor",
                                  condition: dropdownFirstValue,
                                  action: actionFirstValue));
                            }
                          },
                          items: <String>[...partAction]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Compressor Housing",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Condition"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: yellow()),
                      child: DropdownButton<String>(
                        value: dropdownSecondValue,
                        icon: RotatedBox(
                            quarterTurns: 3,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                            )),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          PartDetail data =
                              PartDetail(title: '', condition: '', action: '');
                          if (inspectionDetails.isNotEmpty) {
                            inspectionDetails.forEach((element) {
                              if (element.title == "Compressor Housing") {
                                data = element;
                              }
                            });
                          }
                          if (data.title.isNotEmpty) {
                            inspectionDetails.remove(data);
                          }
                          setState(() {
                            dropdownSecondValue = newValue!;
                          });
                          if (dropdownSecondValue == "good") {
                            setState(() {
                              actionSecondValue = "now";
                            });
                          }
                          if (dropdownSecondValue != "good") {
                            inspectionDetails.add(PartDetail(
                                title: "Compressor Housing",
                                condition: dropdownSecondValue,
                                action: actionSecondValue));
                          }
                        },
                        items: <String>[...listPartCondition]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                if (dropdownSecondValue != "good")
                  SizedBox(
                    height: 10,
                  ),
                if (dropdownSecondValue != "good")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Action"),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            color: yellow()),
                        child: DropdownButton<String>(
                          value: actionSecondValue,
                          icon: RotatedBox(
                              quarterTurns: 3,
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              )),
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? newValue) {
                            PartDetail data = PartDetail(
                                title: '', condition: '', action: '');
                            if (inspectionDetails.isNotEmpty) {
                              inspectionDetails.forEach((element) {
                                if (element.title == "Compressor Housing") {
                                  data = element;
                                }
                              });
                            }
                            if (data.title.isNotEmpty) {
                              inspectionDetails.remove(data);
                            }
                            setState(() {
                              actionSecondValue = newValue!;
                            });

                            if (dropdownSecondValue != "good") {
                              inspectionDetails.add(PartDetail(
                                  title: "Compressor Housing",
                                  condition: dropdownSecondValue,
                                  action: actionSecondValue));
                            }
                          },
                          items: <String>[...partAction]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      );
    } else if (title == "Turbine Housing") {
      return Column(
        // shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Wheel Turbine",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Condition"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: yellow()),
                      child: DropdownButton<String>(
                        value: dropdownFirstValue,
                        icon: RotatedBox(
                            quarterTurns: 3,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                            )),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          PartDetail data =
                              PartDetail(title: '', condition: '', action: '');
                          if (inspectionDetails.isNotEmpty) {
                            inspectionDetails.forEach((element) {
                              if (element.title == "Wheel Turbine") {
                                data = element;
                              }
                            });
                          }
                          if (data.title.isNotEmpty) {
                            inspectionDetails.remove(data);
                          }
                          setState(() {
                            dropdownFirstValue = newValue!;
                          });
                          if (dropdownFirstValue == "good") {
                            setState(() {
                              actionFirstValue = "now";
                            });
                          }
                          if (dropdownFirstValue != "good") {
                            inspectionDetails.add(PartDetail(
                                title: "Wheel Turbine",
                                condition: dropdownFirstValue,
                                action: actionFirstValue));
                          }
                        },
                        items: <String>[...listPartCondition]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                if (dropdownFirstValue != "good")
                  SizedBox(
                    height: 10,
                  ),
                if (dropdownFirstValue != "good")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Action"),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            color: yellow()),
                        child: DropdownButton<String>(
                          value: actionFirstValue,
                          icon: RotatedBox(
                              quarterTurns: 3,
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              )),
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? newValue) {
                            PartDetail data = PartDetail(
                                title: '', condition: '', action: '');
                            if (inspectionDetails.isNotEmpty) {
                              inspectionDetails.forEach((element) {
                                if (element.title == "Wheel Turbine") {
                                  data = element;
                                }
                              });
                            }
                            if (data.title.isNotEmpty) {
                              inspectionDetails.remove(data);
                            }
                            setState(() {
                              actionFirstValue = newValue!;
                            });
                            if (dropdownFirstValue != "good") {
                              inspectionDetails.add(PartDetail(
                                  title: "Wheel Turbine",
                                  condition: dropdownFirstValue,
                                  action: actionFirstValue));
                            }
                          },
                          items: <String>[...partAction]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Turbine Housing",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Condition"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: yellow()),
                      child: DropdownButton<String>(
                        value: dropdownSecondValue,
                        icon: RotatedBox(
                            quarterTurns: 3,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                            )),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          PartDetail data =
                              PartDetail(title: '', condition: '', action: '');
                          if (inspectionDetails.isNotEmpty) {
                            inspectionDetails.forEach((element) {
                              if (element.title == "Turbine Housing") {
                                data = element;
                              }
                            });
                          }
                          if (data.title.isNotEmpty) {
                            inspectionDetails.remove(data);
                          }
                          setState(() {
                            dropdownSecondValue = newValue!;
                          });
                          if (dropdownSecondValue == "good") {
                            setState(() {
                              actionSecondValue = "now";
                            });
                          }
                          if (dropdownSecondValue != "good") {
                            inspectionDetails.add(PartDetail(
                                title: "Turbine Housing",
                                condition: dropdownSecondValue,
                                action: actionSecondValue));
                          }
                        },
                        items: <String>[...listPartCondition]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                if (dropdownSecondValue != "good")
                  SizedBox(
                    height: 10,
                  ),
                if (dropdownSecondValue != "good")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Action"),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            color: yellow()),
                        child: DropdownButton<String>(
                          value: actionSecondValue,
                          icon: RotatedBox(
                              quarterTurns: 3,
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              )),
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? newValue) {
                            PartDetail data = PartDetail(
                                title: '', condition: '', action: '');
                            if (inspectionDetails.isNotEmpty) {
                              inspectionDetails.forEach((element) {
                                if (element.title == "Turbine Housing") {
                                  data = element;
                                }
                              });
                            }
                            if (data.title.isNotEmpty) {
                              inspectionDetails.remove(data);
                            }
                            setState(() {
                              actionSecondValue = newValue!;
                            });

                            if (dropdownSecondValue != "good") {
                              inspectionDetails.add(PartDetail(
                                  title: "Turbine Housing",
                                  condition: dropdownSecondValue,
                                  action: actionSecondValue));
                            }
                          },
                          items: <String>[...partAction]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      );
    }
    return Column(
      // shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Center Housing",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Condition"),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: yellow()),
                    child: DropdownButton<String>(
                      value: dropdownFirstValue,
                      icon: RotatedBox(
                          quarterTurns: 3,
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          )),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        PartDetail data =
                            PartDetail(title: '', condition: '', action: '');
                        if (inspectionDetails.isNotEmpty) {
                          inspectionDetails.forEach((element) {
                            if (element.title == "Center Housing") {
                              data = element;
                            }
                          });
                        }
                        if (data.title.isNotEmpty) {
                          inspectionDetails.remove(data);
                        }
                        setState(() {
                          dropdownFirstValue = newValue!;
                        });
                        if (dropdownFirstValue == "good") {
                          setState(() {
                            actionFirstValue = "now";
                          });
                        }
                        if (dropdownFirstValue != "good") {
                          inspectionDetails.add(PartDetail(
                              title: "Center Housing",
                              condition: dropdownFirstValue,
                              action: actionFirstValue));
                        }
                      },
                      items: <String>[...listPartCondition]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              if (dropdownFirstValue != "good")
                SizedBox(
                  height: 10,
                ),
              if (dropdownFirstValue != "good")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Action"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: yellow()),
                      child: DropdownButton<String>(
                        value: actionFirstValue,
                        icon: RotatedBox(
                            quarterTurns: 3,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                            )),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          PartDetail data =
                              PartDetail(title: '', condition: '', action: '');
                          if (inspectionDetails.isNotEmpty) {
                            inspectionDetails.forEach((element) {
                              if (element.title == "Center Housing") {
                                data = element;
                              }
                            });
                          }
                          if (data.title.isNotEmpty) {
                            inspectionDetails.remove(data);
                          }
                          setState(() {
                            actionFirstValue = newValue!;
                          });
                          if (dropdownFirstValue != "good") {
                            inspectionDetails.add(PartDetail(
                                title: "Center Housing",
                                condition: dropdownFirstValue,
                                action: actionFirstValue));
                          }
                        },
                        items: <String>[...partAction]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 15,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Wheel Shaft",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Condition"),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: yellow()),
                    child: DropdownButton<String>(
                      value: dropdownSecondValue,
                      icon: RotatedBox(
                          quarterTurns: 3,
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          )),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        PartDetail data =
                            PartDetail(title: '', condition: '', action: '');
                        if (inspectionDetails.isNotEmpty) {
                          inspectionDetails.forEach((element) {
                            if (element.title == "Wheel Shaft") {
                              data = element;
                            }
                          });
                        }
                        if (data.title.isNotEmpty) {
                          inspectionDetails.remove(data);
                        }
                        setState(() {
                          dropdownSecondValue = newValue!;
                        });
                        if (dropdownSecondValue == "good") {
                          setState(() {
                            actionSecondValue = "now";
                          });
                        }
                        if (dropdownSecondValue != "good") {
                          inspectionDetails.add(PartDetail(
                              title: "Wheel Shaft",
                              condition: dropdownSecondValue,
                              action: actionSecondValue));
                        }
                      },
                      items: <String>[...listPartCondition]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              if (dropdownSecondValue != "good")
                SizedBox(
                  height: 10,
                ),
              if (dropdownSecondValue != "good")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Action"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: yellow()),
                      child: DropdownButton<String>(
                        value: actionSecondValue,
                        icon: RotatedBox(
                            quarterTurns: 3,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                            )),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          PartDetail data =
                              PartDetail(title: '', condition: '', action: '');
                          if (inspectionDetails.isNotEmpty) {
                            inspectionDetails.forEach((element) {
                              if (element.title == "Wheel Shaft") {
                                data = element;
                              }
                            });
                          }
                          if (data.title.isNotEmpty) {
                            inspectionDetails.remove(data);
                          }
                          setState(() {
                            actionSecondValue = newValue!;
                          });

                          if (dropdownSecondValue != "good") {
                            inspectionDetails.add(PartDetail(
                                title: "Wheel Shaft",
                                condition: dropdownSecondValue,
                                action: actionSecondValue));
                          }
                        },
                        items: <String>[...partAction]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Repair Kit",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Condition"),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: yellow()),
                    child: DropdownButton<String>(
                      value: dropdownThirdValue,
                      icon: RotatedBox(
                          quarterTurns: 3,
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          )),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        PartDetail data =
                            PartDetail(title: '', condition: '', action: '');
                        if (inspectionDetails.isNotEmpty) {
                          inspectionDetails.forEach((element) {
                            if (element.title == "Repair Kit") {
                              data = element;
                            }
                          });
                        }
                        if (data.title.isNotEmpty) {
                          inspectionDetails.remove(data);
                        }
                        setState(() {
                          dropdownThirdValue = newValue!;
                        });
                        if (dropdownThirdValue == "good") {
                          setState(() {
                            actionThirdValue = "now";
                          });
                        }
                        if (dropdownThirdValue != "good") {
                          inspectionDetails.add(PartDetail(
                              title: "Repair Kit",
                              condition: dropdownThirdValue,
                              action: actionThirdValue));
                        }
                      },
                      items: <String>[...listPartCondition]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              if (dropdownThirdValue != "good")
                SizedBox(
                  height: 10,
                ),
              if (dropdownThirdValue != "good")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Action"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: yellow()),
                      child: DropdownButton<String>(
                        value: actionThirdValue,
                        icon: RotatedBox(
                            quarterTurns: 3,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                            )),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          PartDetail data =
                              PartDetail(title: '', condition: '', action: '');
                          if (inspectionDetails.isNotEmpty) {
                            inspectionDetails.forEach((element) {
                              if (element.title == "Repair Kit") {
                                data = element;
                              }
                            });
                          }
                          if (data.title.isNotEmpty) {
                            inspectionDetails.remove(data);
                          }
                          setState(() {
                            actionThirdValue = newValue!;
                          });
                          if (dropdownThirdValue != "good") {
                            inspectionDetails.add(PartDetail(
                                title: "Repair Kit",
                                condition: dropdownThirdValue,
                                action: actionThirdValue));
                          }
                        },
                        items: <String>[...partAction]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 15,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Oil Inlet",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Condition"),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: yellow()),
                    child: DropdownButton<String>(
                      value: dropdownForthValue,
                      icon: RotatedBox(
                          quarterTurns: 3,
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          )),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        PartDetail data =
                            PartDetail(title: '', condition: '', action: '');
                        if (inspectionDetails.isNotEmpty) {
                          inspectionDetails.forEach((element) {
                            if (element.title == "Oil Inlet") {
                              data = element;
                            }
                          });
                        }
                        if (data.title.isNotEmpty) {
                          inspectionDetails.remove(data);
                        }
                        setState(() {
                          dropdownForthValue = newValue!;
                        });
                        if (dropdownForthValue == "good") {
                          setState(() {
                            actionForthValue = "now";
                          });
                        }
                        if (dropdownForthValue != "good") {
                          inspectionDetails.add(PartDetail(
                              title: "Oil Inlet",
                              condition: dropdownForthValue,
                              action: actionForthValue));
                        }
                      },
                      items: <String>[...listPartCondition]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              if (dropdownForthValue != "good")
                SizedBox(
                  height: 10,
                ),
              if (dropdownForthValue != "good")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Action"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: yellow()),
                      child: DropdownButton<String>(
                        value: actionForthValue,
                        icon: RotatedBox(
                            quarterTurns: 3,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                            )),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          PartDetail data =
                              PartDetail(title: '', condition: '', action: '');
                          if (inspectionDetails.isNotEmpty) {
                            inspectionDetails.forEach((element) {
                              if (element.title == "Oil Inlet") {
                                data = element;
                              }
                            });
                          }
                          if (data.title.isNotEmpty) {
                            inspectionDetails.remove(data);
                          }
                          setState(() {
                            actionForthValue = newValue!;
                          });

                          if (dropdownForthValue != "good") {
                            inspectionDetails.add(PartDetail(
                                title: "Oil Inlet",
                                condition: dropdownForthValue,
                                action: actionForthValue));
                          }
                        },
                        items: <String>[...partAction]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 15,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Seal",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Condition"),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: yellow()),
                    child: DropdownButton<String>(
                      value: dropdownFifthValue,
                      icon: RotatedBox(
                          quarterTurns: 3,
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          )),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        PartDetail data =
                            PartDetail(title: '', condition: '', action: '');
                        if (inspectionDetails.isNotEmpty) {
                          inspectionDetails.forEach((element) {
                            if (element.title == "Seal") {
                              data = element;
                            }
                          });
                        }
                        if (data.title.isNotEmpty) {
                          inspectionDetails.remove(data);
                        }
                        setState(() {
                          dropdownFifthValue = newValue!;
                        });
                        if (dropdownFifthValue == "good") {
                          setState(() {
                            actionFifthValue = "now";
                          });
                        }
                        if (dropdownFifthValue != "good") {
                          inspectionDetails.add(PartDetail(
                              title: "Oil Inlet",
                              condition: dropdownFifthValue,
                              action: actionFifthValue));
                        }
                      },
                      items: <String>[...listPartCondition]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              if (dropdownFifthValue != "good")
                SizedBox(
                  height: 10,
                ),
              if (dropdownFifthValue != "good")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Action"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: yellow()),
                      child: DropdownButton<String>(
                        value: actionFifthValue,
                        icon: RotatedBox(
                            quarterTurns: 3,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                            )),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          PartDetail data =
                              PartDetail(title: '', condition: '', action: '');
                          if (inspectionDetails.isNotEmpty) {
                            inspectionDetails.forEach((element) {
                              if (element.title == "Seal") {
                                data = element;
                              }
                            });
                          }
                          if (data.title.isNotEmpty) {
                            inspectionDetails.remove(data);
                          }
                          setState(() {
                            actionFifthValue = newValue!;
                          });

                          if (dropdownFifthValue != "good") {
                            inspectionDetails.add(PartDetail(
                                title: "Seal",
                                condition: dropdownFifthValue,
                                action: actionFifthValue));
                          }
                        },
                        items: <String>[...partAction]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
