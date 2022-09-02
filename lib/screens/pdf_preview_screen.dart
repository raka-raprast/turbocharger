// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:turbocharger/function/pdf_preview.dart';
import 'package:turbocharger/function/synfucsion_pdf.dart';
import 'package:turbocharger/models/detail.dart';
import 'package:turbocharger/models/image_file.dart';
import 'package:turbocharger/models/payment.dart';
import 'package:turbocharger/models/profile.dart';

import '../models/inspections.dart';

Future<void> createPDF(
    BuildContext context,
    Profile profile,
    List<Detail> detailList,
    Inspection inspection,
    List<ImageFile> imageFiles,
    List<Payment> paymentList,
    String paymentDescription,
    String comment) async {
  PdfDocument document = PdfDocument();
  final firstPage = document.pages.add();
  final secondPage = document.pages.add();
  final thirdPage = document.pages.add();

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('lib/assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  var firstLogo = await getImageFileFromAssets("pt_hh_logo.png");
  var secondLogo = await getImageFileFromAssets("pt_hh_logo_simple.png");

  final firstLogoBytes = firstLogo.readAsBytesSync();
  final secondLogoBytes = secondLogo.readAsBytesSync();
  String firstLogoImg64 = base64Encode(firstLogoBytes);
  String secondLogoImg64 = base64Encode(secondLogoBytes);
  //Heading
  firstPage.graphics.drawImage(PdfBitmap.fromBase64String(firstLogoImg64),
      Rect.fromLTRB(390, 0, 470, 80));
  firstPage.graphics.drawString("PT HIRUP HURIP TRANSINDO",
      PdfStandardFont(PdfFontFamily.helvetica, 20, style: PdfFontStyle.bold));
  firstPage.graphics.drawString("Jl. Mulawarman No.12B RT.23 RW.08",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(0, 25, 0, 0));
  firstPage.graphics.drawString("Sepinggan Balikpapan 76115",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(0, 40, 0, 0));
  firstPage.graphics.drawString("Kalimantan Timur, Indonesia",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(0, 55, 0, 0));
  firstPage.graphics.drawString("Telp.(62)0542 762223, 762224",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(0, 70, 0, 0));
  firstPage.graphics.drawString("Fax. (62)0542 762225",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(150, 70, 0, 0));
  firstPage.graphics.drawString("Email :  sales@hh-transindo.com",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(0, 90, 0, 0));
  //

  // Customer Info
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(0, 115, 300, 135));
  firstPage.graphics.drawString("CUSTOMER",
      PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(5, 117.5, 0, 0));
  firstPage.graphics.drawString(
      "CARD ID", PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(250, 120, 0, 0));

  /// nama PT/CV customer
  firstPage.graphics.drawString("${inspection.customerName.toUpperCase()}",
      PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(5, 140, 0, 0));

  /// card id customer?
  firstPage.graphics.drawString(
      inspection.cardId.isEmpty ? "None" : inspection.cardId,
      PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(255, 140, 0, 0));

  var listAlamat = inspection.customerAddress.split(" ");

  /// alamat customer
  firstPage.graphics.drawString(
      listAlamat
          .sublist(0, listAlamat.length > 6 ? 7 : listAlamat.length)
          .join(" "),
      PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(5, 150, 0, 0));

  if (listAlamat.length > 7) {
    firstPage.graphics.drawString(
        listAlamat
            .sublist(8, listAlamat.length > 13 ? 14 : listAlamat.length)
            .join(" "),
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTRB(5, 160, 0, 0));
  }

  if (listAlamat.length > 14) {
    firstPage.graphics.drawString(
        listAlamat
            .sublist(15, listAlamat.length > 21 ? 22 : listAlamat.length)
            .join(" "),
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: Rect.fromLTRB(5, 170, 0, 0));
  }
  firstPage.graphics.drawString(
      "Att. : ${inspection.att}", PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(5, 185, 0, 0));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(0, 227.5, 300, 210.5));
  firstPage.graphics.drawString("Terms",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(5, 212.5, 0, 0));
  firstPage.graphics.drawString(
      ": Net ${00}", PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(45, 212.5, 0, 0));
  //
  // Quotation
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(350, 115, 510, 135));
  firstPage.graphics.drawString("QUOTATION",
      PdfStandardFont(PdfFontFamily.helvetica, 14, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(387.5, 117.5, 0, 0));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(0, 136, 300, 207.5));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(350, 136, 510, 207.5));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(430, 136, 510, 207.5));
  firstPage.graphics.drawString("Quote No.",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(370, 140, 0, 0));
  firstPage.graphics.drawString(inspection.quoteNumber,
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(445, 140, 0, 0));
  firstPage.graphics.drawString(
      "Rev.", PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(380, 155, 0, 0));

  /// date
  firstPage.graphics.drawString(
      "Date", PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(380, 170, 0, 0));
  firstPage.graphics.drawString(
      "${inspection.quotationMonth}/${inspection.quotationDate}/${inspection.quotationYear}",
      PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(440, 170, 0, 0));

  /// firstPage
  firstPage.graphics.drawString(
      "Page", PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(380, 185, 0, 0));
  firstPage.graphics.drawString(
      "1", PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(462.5, 185, 0, 0));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(350, 227.5, 510, 210.5));
  // cust reff
  firstPage.graphics.drawString("Cust. Reff : ${inspection.custReff}",
      PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(355, 212.5, 0, 0));
  //

  // main desc
  // first desc line
  List<String> splittedDesc = paymentDescription.split(" ");
  if (splittedDesc.isNotEmpty) {
    firstPage.graphics.drawString(
        splittedDesc
            .sublist(0, splittedDesc.length < 6 ? splittedDesc.length : 6)
            .join(" ")
            .toString()
            .toUpperCase(),
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(70, 275, 0, 0));
  }
  if (splittedDesc.length > 7) {
    firstPage.graphics.drawString(
        splittedDesc
            .sublist(7, splittedDesc.length < 13 ? splittedDesc.length : 13)
            .join(" ")
            .toString()
            .toUpperCase(),
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(70, 285, 0, 0));
  }
  if (splittedDesc.length > 14) {
    firstPage.graphics.drawString(
        splittedDesc
            .sublist(14, splittedDesc.length < 20 ? splittedDesc.length : 20)
            .join(" ")
            .toString()
            .toUpperCase(),
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(70, 295, 0, 0));
  }
  if (splittedDesc.length > 21) {
    firstPage.graphics.drawString(
        splittedDesc
            .sublist(21, splittedDesc.length < 27 ? splittedDesc.length : 27)
            .join(" ")
            .toString()
            .toUpperCase(),
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(70, 305, 0, 0));
  }
  if (splittedDesc.length > 28) {
    firstPage.graphics.drawString(
        splittedDesc
            .sublist(28, splittedDesc.length < 35 ? splittedDesc.length : 35)
            .join(" ")
            .toString()
            .toUpperCase(),
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(70, 315, 0, 0));
  }
  if (splittedDesc.length > 36) {
    firstPage.graphics.drawString(
        splittedDesc
            .sublist(36, splittedDesc.length < 42 ? splittedDesc.length : 42)
            .join(" ")
            .toString()
            .toUpperCase(),
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(70, 325, 0, 0));
  }
  if (splittedDesc.length > 43) {
    firstPage.graphics.drawString(
        splittedDesc
            .sublist(43, splittedDesc.length < 49 ? splittedDesc.length : 49)
            .join(" ")
            .toString()
            .toUpperCase(),
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(70, 335, 0, 0));
  }
  if (splittedDesc.length > 50) {
    firstPage.graphics.drawString(
        splittedDesc
            .sublist(50, splittedDesc.length < 56 ? splittedDesc.length : 56)
            .join(" ")
            .toString()
            .toUpperCase(),
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(70, 345, 0, 0));
  }
  if (splittedDesc.length > 57) {
    firstPage.graphics.drawString(
        splittedDesc
            .sublist(57, splittedDesc.length < 63 ? splittedDesc.length : 63)
            .join(" ")
            .toString()
            .toUpperCase(),
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(70, 355, 0, 0));
  }
  if (splittedDesc.length > 64) {
    firstPage.graphics.drawString(
        splittedDesc
            .sublist(64, splittedDesc.length < 70 ? splittedDesc.length : 70)
            .join(" ")
            .toString()
            .toUpperCase(),
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(70, 365, 0, 0));
  }
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';
  double payStart = 385;
  paymentList.forEach((element) {
    payStart = payStart + 10;
    firstPage.graphics.drawString(element.partNo!.toUpperCase(),
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(5, payStart, 0, 0));
    firstPage.graphics.drawString(element.description!.toUpperCase(),
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(70, payStart, 0, 0));
    firstPage.graphics.drawString(element.woNo!.toUpperCase(),
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(292.5, payStart, 0, 0));
    firstPage.graphics.drawString(
        element.qty.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(337.5, payStart, 0, 0));
    firstPage.graphics.drawString(
        "Rp.${element.price.toString().replaceAllMapped(reg, mathFunc)}",
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(365, payStart, 0, 0));
    firstPage.graphics.drawString(
        "Rp.${(element.price! * element.qty!).toString().replaceAllMapped(reg, mathFunc)}",
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(435, payStart, 0, 0));
  });
  List<int> totalEachs = [];
  int subTotal = 0;
  paymentList.forEach((element) {
    totalEachs.add(element.price! * element.qty!);
  });
  subTotal = totalEachs.isNotEmpty ? totalEachs.fold(0, (a, b) => a + b) : 0;
  firstPage.graphics.drawString(
      "Rp.${subTotal.toString().replaceAllMapped(reg, mathFunc)}",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(425, 560, 0, 0));
  double ppn = subTotal * 10 / 100;
  firstPage.graphics.drawString(
      "Rp.${ppn.round().toString().replaceAllMapped(reg, mathFunc)}",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(425, 590, 0, 0));
  firstPage.graphics.drawString(
      "Rp.${(subTotal + ppn).round().toString().replaceAllMapped(reg, mathFunc)}",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(425, 620, 0, 0));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(0, 250, 65, 270));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(65, 250, 290, 270));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(290, 250, 330, 270));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(330, 250, 360, 270));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(360, 250, 430, 270));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(430, 250, 510, 270));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(0, 272.5, 65, 550));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(65, 272.5, 290, 550));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(290, 272.5, 330, 550));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(330, 272.5, 360, 550));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(360, 272.5, 430, 550));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(430, 272.5, 510, 550));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(330, 550, 510, 580));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(330, 580, 510, 610));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(330, 610, 510, 640));
  firstPage.graphics.drawString("Part No.",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(12.5, 255, 0, 0));
  firstPage.graphics.drawString("Description",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(150, 255, 0, 0));
  firstPage.graphics.drawString("Wo No.",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(292.5, 255, 0, 0));
  firstPage.graphics.drawString("Qty",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(337.5, 255, 0, 0));
  firstPage.graphics.drawString("Unit Price",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(370, 255, 0, 0));
  firstPage.graphics.drawString("Total",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(455, 255, 0, 0));
  firstPage.graphics.drawString("SUB TOTAL",
      PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(340, 557.5, 0, 0));
  firstPage.graphics.drawString("TAX/PPN",
      PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(340, 587.5, 0, 0));
  firstPage.graphics.drawString("TOTAL",
      PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(340, 617.5, 0, 0));
  //

  // ending
  firstPage.graphics.drawString("Please remit payment to :",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(5, 560, 0, 0));
  firstPage.graphics.drawString("Bank Mandiri cab, Balikpapan.",
      PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(5, 575, 0, 0));
  firstPage.graphics.drawString("Acc. No. 149 009 7000113 (Rp)",
      PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(5, 590, 0, 0));
  firstPage.graphics.drawString("Acc. No. 149 009 7000279 (USD)",
      PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(5, 605, 0, 0));
  firstPage.graphics.drawString(
      "SWIFT NO. BEIIIDJA 030", PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTRB(5, 620, 0, 0));
  firstPage.graphics.drawString("Authorized by :",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(240, 650, 0, 0));
  firstPage.graphics.drawString(
      "BAGUS",
      PdfStandardFont(PdfFontFamily.helvetica, 10,
          style: PdfFontStyle.underline),
      bounds: Rect.fromLTRB(255, 700, 0, 0));
  firstPage.graphics.drawString(
      "YANNI KOJONGIAN",
      PdfStandardFont(PdfFontFamily.helvetica, 10,
          style: PdfFontStyle.underline),
      bounds: Rect.fromLTRB(370, 700, 0, 0));
  firstPage.graphics.drawString("Director",
      PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(395, 710, 0, 0));
  //

  // second page
  secondPage.graphics.drawImage(
      PdfBitmap.fromBase64String(secondLogoImg64), Rect.fromLTRB(0, 0, 80, 80));
  secondPage.graphics.drawString(
      "PT. HH TRANSINDO",
      PdfStandardFont(PdfFontFamily.helvetica, 16,
          multiStyle: [PdfFontStyle.bold, PdfFontStyle.underline]),
      bounds: Rect.fromLTRB(190, 0, 0, 300));
  secondPage.graphics.drawString(
      "TURBOCHARGER STRIPDOWN REPORT",
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold, PdfFontStyle.underline]),
      bounds: Rect.fromLTRB(130, 30, 0, 300));
  secondPage.graphics.drawString(
      "CUSTOMER",
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(5, 90, 0, 300));
  secondPage.graphics.drawString(
      "NAME",
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(5, 105, 0, 300));
  String getInitials(String customerName) => customerName.isNotEmpty
      ? customerName.trim().split(RegExp(' +')).map((s) => s[0]).take(4).join()
      : '';
  secondPage.graphics.drawString(
      getInitials(inspection.customerName),
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(110, 100, 0, 300));
  secondPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(105, 90, 235, 125));
  secondPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(104, 89, 236, 126));
  secondPage.graphics.drawString(
      "COMPONENT",
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(260, 90, 0, 300));
  secondPage.graphics.drawString(
      "MAKE",
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(260, 105, 0, 300));
  secondPage.graphics.drawString(
      inspection.componentMake,
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(385, 100, 0, 300));

  secondPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(380, 90, 510, 125));
  secondPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(379, 89, 511, 126));
  secondPage.graphics.drawString(
      "SJ",
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(5, 135, 0, 300));
  secondPage.graphics.drawString(
      "NUMBER",
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(5, 150, 0, 300));
  secondPage.graphics.drawString(
      inspection.sjNumber,
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(110, 145, 0, 300));
  secondPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(105, 135, 235, 170));
  secondPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(104, 134, 236, 171));
  secondPage.graphics.drawString(
      "PART",
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(260, 135, 0, 300));
  secondPage.graphics.drawString(
      "NUMBER",
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(260, 150, 0, 300));
  secondPage.graphics.drawString(
      inspection.partNumber,
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(385, 145, 0, 300));
  secondPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(380, 135, 510, 170));
  secondPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(379, 134, 511, 171));
  secondPage.graphics.drawString(
      "QUOTE",
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(5, 180, 0, 300));
  secondPage.graphics.drawString(
      "NUMBER",
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(5, 195, 0, 300));
  secondPage.graphics.drawString(
      inspection.quoteNumber,
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(110, 190, 0, 300));
  secondPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(105, 180, 235, 215));
  secondPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(104, 179, 236, 216));
  secondPage.graphics.drawString(
      "SERIAL",
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(260, 180, 0, 300));
  secondPage.graphics.drawString(
      "NUMBER",
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(260, 195, 0, 300));
  secondPage.graphics.drawString(
      inspection.serialNumber,
      PdfStandardFont(PdfFontFamily.helvetica, 14,
          multiStyle: [PdfFontStyle.bold]),
      bounds: Rect.fromLTRB(385, 190, 0, 300));
  if (detailList.isNotEmpty) {
    secondPage.graphics.drawString(
        detailList[0].title,
        PdfStandardFont(PdfFontFamily.helvetica, 14,
            multiStyle: [PdfFontStyle.bold]),
        bounds: Rect.fromLTRB(5, 250, 0, 300));
    Detail desc1 = Detail(title: "", partDetails: []);
    Detail desc2 = Detail(title: "", partDetails: []);
    Detail desc3 = Detail(title: "", partDetails: []);

    double startP = 275;
    double startQ = 360;
    double startR = 445;
    if (detailList[0].partDetails.isNotEmpty) {
      desc1 = detailList[0];
      if (detailList[0].partDetails[0].condition == "good" &&
          detailList[0].partDetails[1].condition == "good") {
        secondPage.graphics.drawString(
            "Good Condition.",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              14,
            ),
            bounds: Rect.fromLTRB(5, startP, 0, 0));
      }
      desc1.partDetails.forEach((element) {
        if (element.condition != "good") {
          secondPage.graphics.drawString(
              "${element.title} was ${element.condition}, ${element.action == "now" ? "require replacement" : "replace on next repair"}",
              PdfStandardFont(
                PdfFontFamily.helvetica,
                14,
              ),
              bounds: Rect.fromLTRB(5, startP, 0, 0));
          startP = startP + 15;
        }
      });
    }
    if (detailList[0].partDetails.isEmpty) {
      secondPage.graphics.drawString(
          "Good Condition.",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            14,
          ),
          bounds: Rect.fromLTRB(5, startP, 0, 0));
    }
    if (detailList[1].partDetails.isNotEmpty) {
      desc2 = detailList[1];
      if (detailList[1].partDetails[0].condition == "good" &&
          detailList[1].partDetails[1].condition == "good") {
        secondPage.graphics.drawString(
            "Good Condition.",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              14,
            ),
            bounds: Rect.fromLTRB(5, startQ, 0, 0));
      }
      desc2.partDetails.forEach((element) {
        if (element.condition != "good") {
          secondPage.graphics.drawString(
              "${element.title} was ${element.condition}, ${element.action == "now" ? "require replacement" : "replace on next repair"}",
              PdfStandardFont(
                PdfFontFamily.helvetica,
                14,
              ),
              bounds: Rect.fromLTRB(5, startQ, 0, 0));
          startQ = startQ + 15;
        }
      });
    }
    if (detailList[1].partDetails.isEmpty) {
      secondPage.graphics.drawString(
          "Good Condition.",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            14,
          ),
          bounds: Rect.fromLTRB(5, startQ, 0, 0));
    }
    if (detailList[2].partDetails.isNotEmpty) {
      desc3 = detailList[2];
      if (detailList[2].partDetails[0].condition == "good" &&
          detailList[2].partDetails[1].condition == "good" &&
          detailList[2].partDetails[2].condition == "good" &&
          detailList[2].partDetails[3].condition == "good" &&
          detailList[2].partDetails[4].condition == "good") {
        secondPage.graphics.drawString(
            "Good Condition.",
            PdfStandardFont(
              PdfFontFamily.helvetica,
              14,
            ),
            bounds: Rect.fromLTRB(5, startR, 0, 0));
      }
      desc3.partDetails.forEach((element) {
        if (element.condition != "good") {
          secondPage.graphics.drawString(
              "${element.title} was ${element.condition}, ${element.action == "now" ? "require replacement" : "replace on next repair"}",
              PdfStandardFont(
                PdfFontFamily.helvetica,
                14,
              ),
              bounds: Rect.fromLTRB(5, startR, 0, 0));
          startR = startR + 15;
        }
      });
    }
    if (detailList[2].partDetails.isEmpty) {
      secondPage.graphics.drawString(
          "Good Condition.",
          PdfStandardFont(
            PdfFontFamily.helvetica,
            14,
          ),
          bounds: Rect.fromLTRB(5, startR, 0, 0));
    }

    //   if (desc1.isNotEmpty) {
    //     secondPage.graphics.drawString(
    //         desc1
    //             .sublist(0, desc1.length < 7 ? desc1.length : 8)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 275, 0, 0));
    //   }
    //   if (desc1.length > 8) {
    //     secondPage.graphics.drawString(
    //         desc1
    //             .sublist(9, desc1.length > 12 ? desc1.length : 13)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 290, 0, 0));
    //   }
    //   if (desc1.length > 13) {
    //     secondPage.graphics.drawString(
    //         desc1
    //             .sublist(14, desc1.length < 20 ? desc1.length : 21)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 305, 0, 300));
    //   }
    //   if (desc1.length > 21) {
    //     secondPage.graphics.drawString(
    //         desc1
    //             .sublist(22, desc1.length < 26 ? desc1.length : 27)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 320, 0, 300));
    //   }
    // }
    // if (detailList.length > 1) {
    secondPage.graphics.drawString(
        desc2.title,
        PdfStandardFont(PdfFontFamily.helvetica, 14,
            multiStyle: [PdfFontStyle.bold]),
        bounds: Rect.fromLTRB(5, 340, 0, 300));
    //   var desc2 = detailList[1].desc.split(" ");
    //   if (desc2.isNotEmpty) {
    //     secondPage.graphics.drawString(
    //         desc2
    //             .sublist(0, desc2.length < 7 ? desc2.length : 8)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 360, 0, 0));
    //   }
    //   if (desc2.length > 8) {
    //     secondPage.graphics.drawString(
    //         desc2
    //             .sublist(9, desc2.length > 12 ? desc2.length : 13)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 375, 0, 0));
    //   }
    //   if (desc2.length > 13) {
    //     secondPage.graphics.drawString(
    //         desc2
    //             .sublist(14, desc2.length < 20 ? desc2.length : 21)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 390, 0, 300));
    //   }
    //   if (desc2.length > 21) {
    //     secondPage.graphics.drawString(
    //         desc2
    //             .sublist(22, desc2.length < 26 ? desc2.length : 27)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 405, 0, 300));
    //   }
    // }
    // if (detailList.length > 2) {
    secondPage.graphics.drawString(
        desc3.title,
        PdfStandardFont(PdfFontFamily.helvetica, 14,
            multiStyle: [PdfFontStyle.bold]),
        bounds: Rect.fromLTRB(5, 425, 0, 300));
    //   var desc3 = detailList[2].desc.split(" ");
    //   if (desc3.isNotEmpty) {
    //     secondPage.graphics.drawString(
    //         desc3
    //             .sublist(0, desc3.length < 7 ? desc3.length : 8)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 445, 0, 0));
    //   }
    //   if (desc3.length > 8) {
    //     secondPage.graphics.drawString(
    //         desc3
    //             .sublist(9, desc3.length > 12 ? desc3.length : 13)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 460, 0, 0));
    //   }
    //   if (desc3.length > 13) {
    //     secondPage.graphics.drawString(
    //         desc3
    //             .sublist(14, desc3.length < 20 ? desc3.length : 21)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 475, 0, 300));
    //   }
    //   if (desc3.length > 21) {
    //     secondPage.graphics.drawString(
    //         desc3
    //             .sublist(22, desc3.length < 27 ? desc3.length : 28)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 490, 0, 300));
    //   }
    //   if (desc3.length > 28) {
    //     secondPage.graphics.drawString(
    //         desc3
    //             .sublist(29, desc3.length < 35 ? desc3.length : 36)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 505, 0, 300));
    //   }
    //   if (desc3.length > 36) {
    //     secondPage.graphics.drawString(
    //         desc3
    //             .sublist(37, desc3.length < 43 ? desc3.length : 44)
    //             .join(" ")
    //             .toString()
    //             .toUpperCase(),
    //         PdfStandardFont(
    //           PdfFontFamily.helvetica,
    //           14,
    //         ),
    //         bounds: Rect.fromLTRB(5, 520, 0, 300));
    //   }
    // }
    if (comment.isNotEmpty) {
      secondPage.graphics.drawString(
          "Comment",
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              multiStyle: [PdfFontStyle.bold]),
          bounds: Rect.fromLTRB(5, 540, 0, 300));
      var cmt = comment.split(" ");
      if (cmt.isNotEmpty) {
        secondPage.graphics.drawString(
            cmt
                .sublist(0, cmt.length < 7 ? cmt.length : 8)
                .join(" ")
                .toString(),
            PdfStandardFont(
              PdfFontFamily.helvetica,
              14,
            ),
            bounds: Rect.fromLTRB(5, 560, 0, 0));
      }
      if (cmt.length > 8) {
        secondPage.graphics.drawString(
            cmt
                .sublist(9, cmt.length > 12 ? cmt.length : 13)
                .join(" ")
                .toString()
                .toUpperCase(),
            PdfStandardFont(
              PdfFontFamily.helvetica,
              14,
            ),
            bounds: Rect.fromLTRB(5, 575, 0, 0));
      }
      if (cmt.length > 13) {
        secondPage.graphics.drawString(
            cmt
                .sublist(14, cmt.length < 20 ? cmt.length : 21)
                .join(" ")
                .toString()
                .toUpperCase(),
            PdfStandardFont(
              PdfFontFamily.helvetica,
              14,
            ),
            bounds: Rect.fromLTRB(5, 590, 0, 300));
      }
      if (cmt.length > 21) {
        secondPage.graphics.drawString(
            cmt
                .sublist(22, cmt.length < 27 ? cmt.length : 28)
                .join(" ")
                .toString()
                .toUpperCase(),
            PdfStandardFont(
              PdfFontFamily.helvetica,
              14,
            ),
            bounds: Rect.fromLTRB(5, 605, 0, 300));
      }
      if (cmt.length > 28) {
        secondPage.graphics.drawString(
            cmt
                .sublist(29, cmt.length < 35 ? cmt.length : 36)
                .join(" ")
                .toString()
                .toUpperCase(),
            PdfStandardFont(
              PdfFontFamily.helvetica,
              14,
            ),
            bounds: Rect.fromLTRB(5, 620, 0, 300));
      }
    }
    secondPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(380, 180, 510, 215));
    secondPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(379, 179, 511, 216));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 230), Offset(511, 230));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 231), Offset(511, 231));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 290), Offset(511, 290));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 305), Offset(511, 305));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 320), Offset(511, 320));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 335), Offset(511, 335));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 375), Offset(511, 375));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 390), Offset(511, 390));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 405), Offset(511, 405));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 420), Offset(511, 420));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 460), Offset(511, 460));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 475), Offset(511, 475));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 490), Offset(511, 490));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 505), Offset(511, 505));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 520), Offset(511, 520));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 535), Offset(511, 535));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 575), Offset(511, 575));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 590), Offset(511, 590));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 605), Offset(511, 605));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 620), Offset(511, 620));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(5, 635), Offset(511, 635));
    secondPage.graphics.drawString(
        "WORK CARRIED OUT BY :",
        PdfStandardFont(PdfFontFamily.helvetica, 14,
            multiStyle: [PdfFontStyle.bold]),
        bounds: Rect.fromLTRB(10, 665, 0, 0));
    secondPage.graphics.drawString(
        "NAME",
        PdfStandardFont(PdfFontFamily.helvetica, 14,
            multiStyle: [PdfFontStyle.bold]),
        bounds: Rect.fromLTRB(10, 690, 0, 0));
    secondPage.graphics.drawString(
        profile.name,
        PdfStandardFont(PdfFontFamily.helvetica, 14,
            multiStyle: [PdfFontStyle.bold]),
        bounds: Rect.fromLTRB(60, 690, 0, 0));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(60, 705), Offset(220, 705));
    secondPage.graphics.drawString(
        "SIGN",
        PdfStandardFont(PdfFontFamily.helvetica, 14,
            multiStyle: [PdfFontStyle.bold]),
        bounds: Rect.fromLTRB(10, 740, 0, 0));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(60, 755), Offset(220, 755));
    secondPage.graphics.drawString(
        "DATE",
        PdfStandardFont(PdfFontFamily.helvetica, 14,
            multiStyle: [PdfFontStyle.bold]),
        bounds: Rect.fromLTRB(275, 740, 0, 0));
    secondPage.graphics.drawString(
        "${DateTime.now().month}-${DateTime.now().day}-${DateTime.now().year}",
        PdfStandardFont(PdfFontFamily.helvetica, 14,
            multiStyle: [PdfFontStyle.bold]),
        bounds: Rect.fromLTRB(335, 740, 0, 0));
    secondPage.graphics
        .drawLine(PdfPens.black, Offset(330, 755), Offset(490, 755));

    thirdPage.graphics.drawImage(PdfBitmap.fromBase64String(secondLogoImg64),
        Rect.fromLTRB(30, 0, 110, 80));
    thirdPage.graphics.drawString(
        "PT HH TRANSINDO",
        PdfStandardFont(PdfFontFamily.helvetica, 16,
            multiStyle: [PdfFontStyle.bold, PdfFontStyle.underline]),
        bounds: Rect.fromLTRB(190, 0, 0, 0));
    thirdPage.graphics.drawString(
        "INDONESIA",
        PdfStandardFont(PdfFontFamily.helvetica, 16,
            multiStyle: [PdfFontStyle.bold, PdfFontStyle.underline]),
        bounds: Rect.fromLTRB(220, 20, 0, 0));
    thirdPage.graphics.drawString(
        "COMPONENT STRIPDOWN REPORT - PHOTOS",
        PdfStandardFont(PdfFontFamily.helvetica, 12,
            multiStyle: [PdfFontStyle.bold, PdfFontStyle.underline]),
        bounds: Rect.fromLTRB(135, 50, 0, 0));
    thirdPage.graphics.drawString("OWNER",
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(55, 110, 0, 0));
    thirdPage.graphics.drawString(getInitials(inspection.customerName),
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(120, 110, 0, 0));
    thirdPage.graphics.drawString("SJ NO",
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(305, 110, 0, 0));
    thirdPage.graphics.drawString(inspection.sjNumber,
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(380, 110, 0, 0));
    thirdPage.graphics.drawString("MODEL",
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(55, 145, 0, 0));
    thirdPage.graphics.drawString(inspection.model,
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(120, 145, 0, 0));
    thirdPage.graphics.drawString("DATE",
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(305, 145, 0, 0));
    thirdPage.graphics.drawString(
        "${DateTime.now().month}-${DateTime.now().day}-${DateTime.now().year}",
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(380, 145, 0, 0));
    thirdPage.graphics.drawString("SERIAL No",
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(55, 180, 0, 0));
    thirdPage.graphics.drawString(inspection.serialNumber,
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(120, 180, 0, 0));
    thirdPage.graphics.drawString("QUOTE",
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(305, 180, 0, 0));
    thirdPage.graphics.drawString(inspection.quoteNumber,
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(380, 180, 0, 0));
    thirdPage.graphics.drawString("PART",
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(55, 200, 0, 0));
    thirdPage.graphics.drawString("NO",
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(55, 215, 0, 0));
    thirdPage.graphics.drawString(inspection.partNumber,
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(120, 215, 0, 0));
    thirdPage.graphics.drawString("X-UNIT",
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(305, 200, 0, 0));
    thirdPage.graphics.drawString("NUMBER",
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(305, 215, 0, 0));
    thirdPage.graphics.drawString(inspection.unitNumber,
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold),
        bounds: Rect.fromLTRB(380, 215, 0, 0));

    if (imageFiles.isNotEmpty) {
      thirdPage.graphics.drawImage(
          PdfBitmap.fromBase64String(
              base64Encode(imageFiles[0].image.readAsBytesSync())),
          Rect.fromLTRB(20, 240, 250, 370));
      thirdPage.graphics.drawString(
          imageFiles[0].desc,
          PdfStandardFont(PdfFontFamily.helvetica, 10,
              style: PdfFontStyle.bold),
          bounds: Rect.fromLTRB(20, 372.5, 0, 0));
    }
    if (imageFiles.length > 1) {
      thirdPage.graphics.drawImage(
          PdfBitmap.fromBase64String(
              base64Encode(imageFiles[1].image.readAsBytesSync())),
          Rect.fromLTRB(291, 240, 511, 370));
      thirdPage.graphics.drawString(
          imageFiles[1].desc,
          PdfStandardFont(PdfFontFamily.helvetica, 10,
              style: PdfFontStyle.bold),
          bounds: Rect.fromLTRB(291, 372.5, 0, 0));
    }
    if (imageFiles.length > 2) {
      thirdPage.graphics.drawImage(
          PdfBitmap.fromBase64String(
              base64Encode(imageFiles[2].image.readAsBytesSync())),
          Rect.fromLTRB(20, 390, 250, 510));
      thirdPage.graphics.drawString(
          imageFiles[2].desc,
          PdfStandardFont(PdfFontFamily.helvetica, 10,
              style: PdfFontStyle.bold),
          bounds: Rect.fromLTRB(20, 512.5, 0, 0));
    }
    if (imageFiles.length > 3) {
      thirdPage.graphics.drawImage(
          PdfBitmap.fromBase64String(
              base64Encode(imageFiles[3].image.readAsBytesSync())),
          Rect.fromLTRB(291, 390, 511, 510));
      thirdPage.graphics.drawString(
          imageFiles[3].desc,
          PdfStandardFont(PdfFontFamily.helvetica, 10,
              style: PdfFontStyle.bold),
          bounds: Rect.fromLTRB(291, 512.5, 0, 0));
    }
    if (imageFiles.length > 4) {
      thirdPage.graphics.drawImage(
          PdfBitmap.fromBase64String(
              base64Encode(imageFiles[4].image.readAsBytesSync())),
          Rect.fromLTRB(20, 530, 250, 650));
      thirdPage.graphics.drawString(
          imageFiles[4].desc,
          PdfStandardFont(PdfFontFamily.helvetica, 10,
              style: PdfFontStyle.bold),
          bounds: Rect.fromLTRB(20, 652.5, 0, 0));
    }
    if (imageFiles.length > 5) {
      thirdPage.graphics.drawImage(
          PdfBitmap.fromBase64String(
              base64Encode(imageFiles[5].image.readAsBytesSync())),
          Rect.fromLTRB(291, 530, 511, 650));
      thirdPage.graphics.drawString(
          imageFiles[5].desc,
          PdfStandardFont(PdfFontFamily.helvetica, 10,
              style: PdfFontStyle.bold),
          bounds: Rect.fromLTRB(291, 652.5, 0, 0));
    }
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(50, 90, 460, 230));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(48, 88, 462, 232));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(48, 88, 462, 125));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(48, 125, 462, 160));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(48, 160, 462, 195));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(48, 195, 462, 230));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(48, 88, 120, 230));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(120, 88, 300, 230));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(300, 88, 380, 230));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(20, 240, 250, 370));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(291, 240, 511, 370));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(20, 390, 250, 510));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(291, 390, 511, 510));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(20, 530, 250, 650));
    thirdPage.graphics.drawRectangle(
        pen: PdfPens.black, bounds: Rect.fromLTRB(291, 530, 511, 650));
    List<int> bytes = await document.save();

    document.dispose();
    DateTime time = DateTime.now();
    String fileName =
        "TC_${time.day}${time.month}${time.year}${time.hour}${time.minute}.pdf";
    saveAndLaunchFile((path) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFScreen(
            profile: profile,
            name: fileName,
            path: path,
            bytes: bytes,
            document: document,
          ),
        ),
      );
    }, bytes, fileName);
  }
}
