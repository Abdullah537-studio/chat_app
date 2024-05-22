// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:chat_2/core/function/convert_base64_to_image_partner_from_api.dart';
import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/image_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class CustomImage extends StatefulWidget {
  final Function(String)? imageFunction;
  const CustomImage({super.key, required this.imageFunction});

  @override
  _CustomImageState createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  File? image;
  String? base64;
  String imageCut = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //?-----------to put container image in center use expanded and flex------------

          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          //?----------------------container background image user -----------------------

          Container(
            height: 116.h,
            width: 116.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColor.kColorBlack,
                width: 2.w,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: image == null
                  ? Container(
                      margin: const EdgeInsets.all(29),
                      child: SvgPicture.asset(
                        imageAvatar,
                      ),
                    )
                  : Image.file(image!, fit: BoxFit.cover),
            ),
          ),
          //?---------------------------icon add image -----------------------------------

          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(right: 35.w),
              child: IconButton(
                onPressed: () async {
                  final ImagePicker imagePicker = ImagePicker();
                  var pickedImage =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(
                      () {
                        image = File(pickedImage.path);
                      },
                    );
                    Uint8List imageBytes =
                        await File(image!.path).readAsBytes();
                    String base64Image = base64Encode(imageBytes);
                    if (base64Image.length >= 4) {
                      imageCut = base64Image.substring(4, base64Image.length);
                    } else {
                      imageCut = '';
                    }
                    widget.imageFunction!(imageCut);
                    //! to print image as base64

                    // printFullText(imageCut);

                    //! for start image cutting can call it in image partner
                    partImageCut = base64Image.substring(0, 4);
                    // i can here take all image  put i will take part cutting to put it with api
                    AppSharedPreferences.cachePartImageHaveCutting(
                      imageCut: partImageCut,
                    );
                  }
                },
                icon: Tab(
                  icon: SvgPicture.asset(pinceliconImagePicker),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
