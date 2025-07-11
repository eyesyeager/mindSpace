import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class SplashView extends GetView<SplashController> {

  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            "assets/images/boot.png",
            fit: BoxFit.cover,
            width: 300,
          ),
        )
    );
  }
}