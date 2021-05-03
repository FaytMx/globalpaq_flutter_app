import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';
import 'package:globalpaq_app/app/routes/app_routes.dart';

class SplashController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    try {
      final token = await _localAuthRepository.session;

      Get.offNamed(token != null ? AppRoutes.HOME : AppRoutes.LOGIN);
    } catch (e) {
      print(e);
    }
  }
}
