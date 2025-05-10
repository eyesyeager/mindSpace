import 'package:mind_space/bootstrap/binding.dart';
import 'package:mind_space/bootstrap/bootstrap.dart';
import 'package:mind_space/config/theme/app_theme.dart';
import 'package:mind_space/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/app_config.dart';

Future<void> main() async {
  await Bootstrap.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.appName,
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: AppPages.initial,
      initialBinding: InitBinding(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}