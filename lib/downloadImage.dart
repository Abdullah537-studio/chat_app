// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:chat_2/core/api/api_links.dart';
import 'package:chat_2/core/api/api_methods.dart';

class DowanloadImage {
  Future<Widget> downloadImageMethod(int id) async {
    var response = await ApiMethods()
        .get(url: ApiGet.imagePartnerUrl, path: {}, query: {"id": id});
    var imageData = base64Decode(response as String);
    return Image.memory(imageData);
  }
}

class BuildPartnerInformation extends StatelessWidget {
  const BuildPartnerInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: DowanloadImage().downloadImageMethod(257),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 25),
            child: snapshot.data,
          );
        }
      },
    );
  }
}
