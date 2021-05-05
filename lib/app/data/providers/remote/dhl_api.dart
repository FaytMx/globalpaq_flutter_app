import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/requests/dhl/dhl_post_guia_request.dart';
import 'package:globalpaq_app/app/data/models/requests/dhl/dhl_post_recoleccion_request.dart';

import 'package:globalpaq_app/app/data/models/responses/dhl/dhl_asignaciones_response.dart';
import 'package:globalpaq_app/app/data/models/responses/dhl/dhl_cancela_response.dart';
import 'package:globalpaq_app/app/data/models/responses/dhl/dhl_cobertura_response.dart';
import 'package:globalpaq_app/app/data/models/responses/dhl/dhl_cp_response.dart';
import 'package:globalpaq_app/app/data/models/responses/dhl/dhl_disponibles_response.dart';
import 'package:globalpaq_app/app/data/models/responses/dhl/dhl_guia_tracking_response.dart';
import 'package:globalpaq_app/app/data/models/responses/dhl/dhl_historial_response.dart';
import 'package:globalpaq_app/app/data/models/responses/dhl/dhl_post_guia_response.dart';
import 'package:globalpaq_app/app/data/models/responses/dhl/dhl_post_recoleccion_response.dart';
import 'package:globalpaq_app/app/data/models/responses/dhl/dhl_tracking_response.dart';

import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';

class DhlAPI {
  final Dio _dio = Get.find<Dio>();
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Future<DhlAsignacionesResponse> getAsignaciones() async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/asignaciones',
        options: Options(headers: {"Authorization": session}));
    return DhlAsignacionesResponse.fromJson(response.data);
  }

  Future<DhlHistorialResponse> getHistorial() async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/historial',
        options: Options(headers: {"Authorization": session}));

    return DhlHistorialResponse.fromJson(response.data);
  }

  Future<DhlDisponiblesResponse> getDisponibles() async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/disponibles',
        options: Options(headers: {"Authorization": session}));

    return DhlDisponiblesResponse.fromJson(response.data);
  }

  Future<DhlGuiaTrackingResponse> getGuia(String tracking) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/guia/$tracking',
        options: Options(headers: {"Authorization": session}));

    return DhlGuiaTrackingResponse.fromJson(response.data);
  }

  Future<DhlTrackingResponse> getTracking(String tracking) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/cancelar/$tracking',
        options: Options(headers: {"Authorization": session}));

    return DhlTrackingResponse.fromJson(response.data);
  }

  Future<DhlCancelaResponse> cancela(String tracking) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/guia/$tracking',
        options: Options(headers: {"Authorization": session}));

    return DhlCancelaResponse.fromJson(response.data);
  }

  Future<DhlCpResponse> getCp(String cp) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/cp/$cp',
        options: Options(headers: {"Authorization": session}));

    return DhlCpResponse.fromJson(response.data);
  }

  Future<DhlCoberturaResponse> getCobertura(
      String cpOrigen, String cpDestino) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/cobertura',
        queryParameters: {"cp_origen": cpOrigen, "cp_destino": cpDestino},
        options: Options(headers: {"Authorization": session}));

    return DhlCoberturaResponse.fromJson(response.data);
  }

  Future<DhlPostGuiaResponse> postGuia(DhlPostGuiaRequest guia) async {
    String session = await _localAuthRepository.session;

    var response = await _dio.post('/dhl/guia',
        options: Options(headers: {"Authorization": session}),
        data: guia.toMap());

    return DhlPostGuiaResponse.fromJson(response.data);
  }

  Future<DhlRecoleccionResponse> postRecoleccion(
      DhlPostRecoleccionRequest recoleccion) async {
    String session = await _localAuthRepository.session;

    var response = await _dio.post('/dhl/recoleccion',
        options: Options(headers: {"Authorization": session}),
        data: recoleccion.toMap());

    return DhlRecoleccionResponse.fromJson(response.data);
  }
}
