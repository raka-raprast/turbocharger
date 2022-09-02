// ignore_for_file: avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, avoid_print, prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:turbocharger/models/profile.dart';
import 'package:turbocharger/screens/menu_page.dart';
import 'package:turbocharger/style/colors.dart';
import 'package:turbocharger/widget/gradient_background_body.dart';
import 'package:share_plus/share_plus.dart';

class PDFScreen extends StatefulWidget {
  final String? path;
  final String name;
  final Profile profile;

  const PDFScreen(
      {Key? key,
      this.path,
      required this.document,
      required this.bytes,
      required this.name,
      required this.profile})
      : super(key: key);
  final PdfDocument document;
  final List<int> bytes;
  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  Future<void> downloadFile(PdfDocument document, List<int> bytes) async {
    const path = "/storage/emulated/0/Download";
    DateTime time = DateTime.now();
    String fileName = widget.name;
    final file = File('$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
  }

  Future<void> shareFile(PdfDocument document, List<int> bytes) async {
    final path = (await getExternalStorageDirectory())!.path;

    final file = File('$path/${widget.name}');
    List<String>? files = [file.path];
    await Share.shareFiles(files);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradientBackgroundBody(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * .75,
                  child: PDFView(
                    filePath: widget.path,
                    onRender: (_pages) {
                      setState(() {
                        pages = _pages;
                        isReady = true;
                      });
                    },
                    onError: (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                      print(error.toString());
                    },
                    onPageError: (page, error) {
                      setState(() {
                        errorMessage = '$page: ${error.toString()}';
                      });
                      print('$page: ${error.toString()}');
                    },
                    onViewCreated: (PDFViewController pdfViewController) {
                      _controller.complete(pdfViewController);
                    },
                  ),
                ),
                errorMessage.isEmpty
                    ? !isReady
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container()
                    : Center(
                        child: Text(errorMessage),
                      )
              ],
            ),
          ),
        ),
        OutlinedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: forestGreen(),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              var status = Permission.storage.status;
                              bool isGranted = await status.isGranted;
                              if (isGranted) {
                                downloadFile(widget.document, widget.bytes);
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    backgroundColor: forestGreen(),
                                    title: Text(
                                        'Pdf Telah di Download sebagai ${widget.name}'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                Permission.storage.request();
                              }
                            },
                            child: Container(
                                margin: EdgeInsets.all(30),
                                padding: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: forestGreen()),
                                child: Icon(
                                  Icons.download,
                                  size: 50,
                                  color: Colors.white,
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              shareFile(widget.document, widget.bytes);
                            },
                            child: Container(
                                margin: EdgeInsets.all(30),
                                padding: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: forestGreen()),
                                child: Icon(
                                  Icons.share,
                                  size: 50,
                                  color: Colors.white,
                                )),
                          ),
                        ]),
                  );
                },
              );
            },
            child: Text(
              "Share",
              style: TextStyle(color: Colors.white),
            )),
        OutlinedButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Back to the menu?'),
                  content: const Text(
                      'Please make sure you have finished with the report before going back to the menu'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MenuPage(profile: widget.profile))),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: Text(
              "Done",
              style: TextStyle(color: Colors.white),
            ))
      ],
    ));
  }
}
