import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/tienda/articulos_response.dart';
import 'package:globalpaq_app/app/data/models/responses/tienda/pedido_detalle_response.dart';
import 'package:globalpaq_app/app/data/models/responses/tienda/pedidos_response.dart';
import 'package:globalpaq_app/app/data/providers/remote/tienda_api.dart';

class TiendaRepository {
  final TiendaAPI _tiendaAPI = Get.find<TiendaAPI>();

  Future<ArticulosResponse> getTiendaArticulos() =>
      _tiendaAPI.getTiendaArticulos();

  Future<List<PedidosResponse>> getPedidos() => _tiendaAPI.getPedidos();

  Future<List<PedidoDetalleResponse>> getPedidoDetalle(int idVenta) =>
      _tiendaAPI.getPedidoDetalle(idVenta);
}
