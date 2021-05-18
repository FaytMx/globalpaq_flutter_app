import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/recolecciones/recolecciones_controller.dart';

class RecoleccionesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecoleccionesController());
  }
}
