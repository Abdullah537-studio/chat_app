//! method convert base64 to image
import 'dart:convert';
import 'package:flutter/material.dart';

//* ---- part image cutting
String partImageCut = 'data:image/png;base64,';

Widget imageFromBase64String(String base64String) {
  // if (base64String.startsWith("i")) {
  //   String fullbase64String = partImageCut + base64String;
  //   return Image.memory(base64Decode(fullbase64String));
  // } else {
  return Image.memory(base64Decode(base64String));
  // }
}
