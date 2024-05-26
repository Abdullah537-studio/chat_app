import 'package:chat_2/core/function/sheck_remember_me_.dart';
import 'package:chat_2/core/strings/image_png.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/main_text_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    sheckRememberMeToNavigatorAndGiveTimber(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImageStringPng.backgroundsplashScreen),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: MainTextWidget(
            text: translating(
              context,
              AppKeyTranslateManger.welcome,
            ),
            style: Theme.of(context).textTheme.titleLarge!,
            isCenter: false,
          ),
        ),
      ),
    );
  }
}
