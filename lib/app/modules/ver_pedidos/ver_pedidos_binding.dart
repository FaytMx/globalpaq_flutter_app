import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/ver_pedidos/ver_pedidos_controller.dart';

class VerPedidosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerPedidosController());
  }
}
