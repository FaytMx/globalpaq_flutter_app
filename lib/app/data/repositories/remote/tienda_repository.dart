import 'dart:io';

import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/tienda/articulos_response.dart';
import 'package:globalpaq_app/app/data/models/responses/tienda/pedido_detalle_response.dart';
import 'package:globalpaq_app/app/data/models/responses/tienda/pedidos_response.dart';
import 'package:globalpaq_app/app/data/providers/remote/tienda_api.dart';

class TiendaRepository {
  final TiendaAPI _tiendaAPI = Get.find<TiendaAPI>();

  Future<ArticulosResponse> getTiendaArticulos() =>
      _tiendaAPI.getTiendaArticulos();

  Future<List<PedidosResponse>> getPedidos(String cantidad, String pagina) =>
      _tiendaAPI.getPedidos(cantidad, pagina);

  Future<List<PedidoDetalleResponse>> getPedidoDetalle(int idVenta) =>
      _tiendaAPI.getPedidoDetalle(idVenta);

  Future<void> postCoprobantePedido(Map<String, dynamic> data, File file) =>
      _tiendaAPI.postCoprobantePedido(data, file);
}
