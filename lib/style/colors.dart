import 'dart:ui';

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

Color yellow() {
  return fromHex("FDE74C");
}

Color darkGreen() {
  return fromHex("A2D2B3");
}

Color lightGreen() {
  return fromHex("6EE1C0");
}

Color grey() {
  return fromHex("72717F");
}

Color forestGreen() {
  return fromHex("41CD7D");
}
