import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/pedidos/pedidos_controller.dart';

class PedidosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PedidosController());
  }
}
