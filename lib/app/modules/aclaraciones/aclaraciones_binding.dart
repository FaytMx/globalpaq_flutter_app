import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/aclaraciones/aclaraciones_controller.dart';

class AclaracionesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AclaracionesController());
  }
}
