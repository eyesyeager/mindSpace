import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class UpdateView extends GetView<UpdateController> {

  const UpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Update"),
      )
    );
  }
}