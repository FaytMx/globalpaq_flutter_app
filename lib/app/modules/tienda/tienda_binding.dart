import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/tienda/tienda_controller.dart';

class TiendaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TiendaController());
  }
}
