import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/requests/redpack/redpack_post_guia_request.dart';
import 'package:globalpaq_app/app/data/models/requests/redpack/redpack_post_recoleccion_request.dart';
import 'package:globalpaq_app/app/data/models/responses/redpack/redpack_asignaciones_response.dart';
import 'package:globalpaq_app/app/data/models/responses/redpack/redpack_cancel_response.dart';
import 'package:globalpaq_app/app/data/models/responses/redpack/redpack_cobertura_response.dart';
import 'package:globalpaq_app/app/data/models/responses/redpack/redpack_disponibles_response.dart';
import 'package:globalpaq_app/app/data/models/responses/redpack/redpack_guia_tracking_response.dart';
import 'package:globalpaq_app/app/data/models/responses/redpack/redpack_historial_response.dart';
import 'package:globalpaq_app/app/data/models/responses/redpack/redpack_post_guia_request.dart';
import 'package:globalpaq_app/app/data/models/responses/redpack/redpack_recoleccion_response.dart';
import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';

class RedpackAPI {
  final Dio _dio = Get.find<Dio>();
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Future<String> getToken() async => _localAuthRepository.session;

  Future<List<RedpackAsignacionesResponse>> getRedpackAsignaciones() async {
    String session = await this.getToken();

    var response = await _dio.get('/redpack/asignaciones',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }
    return (response.data['data'] as List)
        .map((e) => RedpackAsignacionesResponse.fromJson(e))
        .toList();
  }

  Future<List<RedpackHistorialResponse>> getRedpackHistorial() async {
    String session = await this.getToken();

    var response = await _dio.get('/redpack/historial',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }
    return (response.data['data'] as List)
        .map((e) => RedpackHistorialResponse.fromJson(e))
        .toList();
  }

  Future<List<RedpackDisponiblesResponse>> getRedpackDisponibles() async {
    String session = await this.getToken();

    var response = await _dio.get('/redpack/disponibles',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }
    return (response.data['data'] as List)
        .map((e) => RedpackDisponiblesResponse.fromJson(e))
        .toList();
  }

  Future<RedpackGuiaTrackingResponse> getRedpackGuia(String tracking) async {
    String session = await this.getToken();

    var response = await _dio.get('/redpack/guia/$tracking',
        options: Options(headers: {"Authorization": session}));

    return RedpackGuiaTrackingResponse.fromJson(response.data);
  }

  Future<RedpackCancelResponse> cancelaRedpack(String tracking) async {
    String session = await this.getToken();

    var response = await _dio.get('/redpack/cancelar/$tracking',
        options: Options(headers: {"Authorization": session}));

    return RedpackCancelResponse.fromJson(response.data);
  }

  Future<RedpackCoberturaResponse> getRedpackCobertura(
      String cpOrigen, String cpDestino) async {
    String session = await _localAuthRepository.session;

    var response = await _dio.get('/redpack/cobertura',
        queryParameters: {"cp_origen": cpOrigen, "cp_destino": cpDestino},
        options: Options(headers: {"Authorization": session}));

    return RedpackCoberturaResponse.fromJson(response.data);
  }

  Future<RedpackPostGuiaData> postFedexGuia(RedpackPostGuiaRequest guia) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.post('/redpack/guia',
        options: Options(headers: {"Authorization": session}),
        data: guia.toMap());

    if (response.data["data"] is List || response.data["data"] is String) {
      print("👌");
      throw new Exception(response.data["data"]);
    }

    return RedpackPostGuiaData.fromJson(response.data["data"]);
  }

  Future<RedpackRecoleccionResponse> postRedpackRecoleccion(
      RedpackPostRecoleccionRequest recoleccion) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.post('/redpack/recoleccion',
        options: Options(headers: {"Authorization": session}),
        data: recoleccion.toMap());

    return RedpackRecoleccionResponse.fromJson(response.data);
  }
}
