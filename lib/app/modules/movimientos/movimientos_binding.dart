import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/movimientos/movimientos_controller.dart';

class MovimientosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovimientosController());
  }
}
