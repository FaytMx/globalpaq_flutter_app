import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/home/home_binding.dart';
import 'package:globalpaq_app/app/modules/home/home_page.dart';
import 'package:globalpaq_app/app/modules/login/login_binding.dart';
import 'package:globalpaq_app/app/modules/login/login_page.dart';
import 'package:globalpaq_app/app/modules/splash/splash_binding.dart';
import 'package:globalpaq_app/app/modules/splash/splash_page.dart';
import 'package:globalpaq_app/app/routes/app_routes.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.HOME, page: () => HomePage(), binding: HomeBindings()),
  ];
}
