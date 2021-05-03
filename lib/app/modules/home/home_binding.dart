import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
