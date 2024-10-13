//! method convert base64 to image

import 'package:chat_2/core/strings/image_png.dart';
import 'package:flutter/material.dart';


String partImageCut = 'data:image/png;base64,';

Widget imageFromBase64String(String base64String) {
 
  return Image.asset(AppImageStringPng.imageNotFoundPng);
}
