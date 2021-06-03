import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/requests/paquetexp/paquetexp_post_guia_request.dart';
import 'package:globalpaq_app/app/data/models/requests/paquetexp/paquetexp_post_recoleccion_request.dart';
import 'package:globalpaq_app/app/data/models/responses/paquetexp/paquetexp_asignaciones_response.dart';
import 'package:globalpaq_app/app/data/models/responses/paquetexp/paquetexp_cancel_response.dart';
import 'package:globalpaq_app/app/data/models/responses/paquetexp/paquetexp_cobertura_response.dart';
import 'package:globalpaq_app/app/data/models/responses/paquetexp/paquetexp_disponibles_response.dart';
import 'package:globalpaq_app/app/data/models/responses/paquetexp/paquetexp_guia_tracking_response.dart';
import 'package:globalpaq_app/app/data/models/responses/paquetexp/paquetexp_historial_response.dart';
import 'package:globalpaq_app/app/data/models/responses/paquetexp/paquetexp_post_guia_response.dart';
import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';

class PaqueteExpressAPI {
  final Dio _dio = Get.find<Dio>();
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Future<String> getToken() async => _localAuthRepository.session;

  Future<List<PaquetexpAsignacionesResponse>> getPaquetexpAsignaciones() async {
    String session = await this.getToken();

    var response = await _dio.get('/paquetexpress/asignaciones',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }
    return (response.data['data'] as List)
        .map((e) => PaquetexpAsignacionesResponse.fromJson(e))
        .toList();
  }

  Future<List<PaquetexpHistorialResponse>> getPaquetexpHistorial() async {
    String session = await this.getToken();

    var response = await _dio.get('/paquetexpress/historial',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }
    return (response.data['data'] as List)
        .map((e) => PaquetexpHistorialResponse.fromJson(e))
        .toList();
  }

  Future<List<PaquetexpDisponiblesResponse>> getPaquetexpDisponibles() async {
    String session = await this.getToken();

    var response = await _dio.get('/paquetexpress/disponibles',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }
    return (response.data['data'] as List)
        .map((e) => PaquetexpDisponiblesResponse.fromJson(e))
        .toList();
  }

  Future<PaquetexpGuiaTrackingResponse> getPaquetexpGuia(
      String tracking) async {
    String session = await this.getToken();

    var response = await _dio.get('/paquetexpress/guia/$tracking',
        options: Options(headers: {"Authorization": session}));

    return PaquetexpGuiaTrackingResponse.fromJson(response.data);
  }

  Future<PaquetexpCancelResponse> cancelaPaquetexp(String tracking) async {
    String session = await this.getToken();

    var response = await _dio.get('/paquetexpress/cancelar/$tracking',
        options: Options(headers: {"Authorization": session}));

    return PaquetexpCancelResponse.fromJson(response.data);
  }

  Future<PaquetexpCoberturaResponse> getPaquetexpCobertura(
      String cpOrigen, String cpDestino) async {
    String session = await _localAuthRepository.session;

    var response = await _dio.get('/paquetexpress/cobertura',
        queryParameters: {"cp_origen": cpOrigen, "cp_destino": cpDestino},
        options: Options(headers: {"Authorization": session}));

    return PaquetexpCoberturaResponse.fromJson(response.data);
  }

  Future<PaquetexpPostGuiaData> postPaquetexpGuia(
      PaquetexpPostGuiaRequest guia) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.post('/paquetexpress/guia',
        options: Options(headers: {"Authorization": session}),
        data: guia.toMap());

    if (response.data["data"] is List || response.data["data"] is String) {
      print("👌");
      throw new Exception(response.data["data"]);
    }

    if (response.data["error"] == true || response.data["err"] == true) {
      print("👌");
      throw new Exception(response.data["data"]);
    }

    return PaquetexpPostGuiaData.fromJson(response.data);
  }

  Future postPaquetexpRecoleccion(
      PaquetexpPostRecoleccionRequest recoleccion) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.post('/paquetexpress/recoleccion',
        options: Options(headers: {"Authorization": session}),
        data: recoleccion.toMap());

    return response.data;
  }
}
