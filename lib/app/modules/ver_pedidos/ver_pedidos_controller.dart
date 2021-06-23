
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/tienda/pedidos_response.dart';
import 'package:globalpaq_app/app/data/repositories/remote/tienda_repository.dart';

class VerPedidosController extends GetxController {
   final TiendaRepository _tiendaRepository = Get.find<TiendaRepository>();

   //datos

   @override
  void onReady() {
    super.onReady();
    this.init();
  }


  void init()async {
    List<PedidosResponse> res = await _tiendaRepository.getPedidos();
  }
}