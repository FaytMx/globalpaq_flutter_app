import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/tienda/articulos_response.dart';
import 'package:globalpaq_app/app/data/models/responses/tienda/pedido_detalle_response.dart';
import 'package:globalpaq_app/app/data/models/responses/tienda/pedidos_response.dart';
import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';

class TiendaAPI {
  final Dio _dio = Get.find<Dio>();
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Future<String> getToken() async => _localAuthRepository.session;

  Future<ArticulosResponse> getTiendaArticulos() async {
    String session = await this.getToken();

    var response = await _dio.get('/tienda/articulos',
        options: Options(headers: {"Authorization": session}));

    if (response.data["data"]["message"] != null) {
      throw new Exception("El token expiro");
    }

    return ArticulosResponse.fromJson(response.data["data"]);
  }

  Future<List<PedidosResponse>> getPedidos() async {
    String session = await this.getToken();

    var response = await _dio.get('/tienda/pedidos',
        options: Options(headers: {"Authorization": session}));

    if (response.data["data"] is Map) {
      throw new Exception("El token expiro");
    }

    return (response.data['data'] as List)
        .map((e) => PedidosResponse.fromJson(e))
        .toList();
  }

  Future<List<PedidoDetalleResponse>> getPedidoDetalle(int idVenta) async {
    String session = await this.getToken();

    var response = await _dio.get('/tienda/pedidos/$idVenta',
        options: Options(headers: {"Authorization": session}));

    if (response.data["data"] is Map) {
      throw new Exception("El token expiro");
    }

    return (response.data['data'] as List)
        .map((e) => PedidoDetalleResponse.fromJson(e))
        .toList();
  }
}
