import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/envios/envios_controller.dart';

class EnviosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnviosController());
  }
}
