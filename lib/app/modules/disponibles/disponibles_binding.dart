import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/disponibles/disponibles_controller.dart';

class DisponiblesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DisponiblesController());
  }
}
