import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class ErrorView extends GetView<ErrorController> {

  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("ERROR"),
      )
    );
  }
}