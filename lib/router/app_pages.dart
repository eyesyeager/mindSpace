import 'package:mind_space/router/app_routes.dart';
import 'package:mind_space/views/common/splash/binding.dart';
import 'package:mind_space/views/common/error/binding.dart';
import 'package:mind_space/views/common/update/binding.dart';
import 'package:mind_space/views/common/splash/views.dart';
import 'package:mind_space/views/common/error/views.dart';
import 'package:mind_space/views/common/update/views.dart';
import 'package:get/get.dart';
import 'package:mind_space/views/content/calm/detail/binding.dart';
import 'package:mind_space/views/content/calm/detail/views.dart';
import 'package:mind_space/views/content/focus/detail/binding.dart';
import 'package:mind_space/views/content/focus/detail/views.dart';
import 'package:mind_space/views/content/thinking/detail/binding.dart';
import 'package:mind_space/views/content/thinking/detail/views.dart';
import 'package:mind_space/views/index/binding.dart';
import 'package:mind_space/views/index/views.dart';

sealed class AppPages {
  static const initial = AppRoutes.splash;

  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.index, page: () => IndexView(), binding: IndexBinding()),

    GetPage(name: AppRoutes.splash, page: () => SplashView(), binding: SplashBinding()),

    GetPage(name: AppRoutes.error, page: () => ErrorView(), binding: ErrorBinding()),

    GetPage(name: AppRoutes.update, page: () => UpdateView(), binding: UpdateBinding()),

    GetPage(name: AppRoutes.calmDetail, page: () => CalmDetailView(), binding: CalmDetailBinding()),

    GetPage(name: AppRoutes.focusDetail, page: () => FocusDetailView(), binding: FocusDetailBinding()),

    GetPage(name: AppRoutes.thinkingDetail, page: () => ThinkingDetailView(), binding: ThinkingDetailBinding()),
  ];
}