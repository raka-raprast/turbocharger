// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<void> saveAndLaunchFile(
    Function(String path) onLaunch, List<int> bytes, String fileName) async {
  final path = (await getExternalStorageDirectory())!.path;
  log(path);

  final file = File('$path/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  onLaunch('$path/$fileName');
}
