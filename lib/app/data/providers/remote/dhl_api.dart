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

  Future<List<DhlAsignacionesResponse>> getDhlAsignaciones() async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/asignaciones',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }
    return (response.data['data'] as List)
        .map((e) => DhlAsignacionesResponse.fromJson(e))
        .toList();
  }

  Future<List<DhlHistorialResponse>> getDhlHistorial() async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/historial',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }
    return (response.data['data'] as List)
        .map((e) => DhlHistorialResponse.fromJson(e))
        .toList();
  }

  Future<List<DhlDisponiblesResponse>> getDhlDisponibles() async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/disponibles',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }
    return (response.data['data'] as List)
        .map((e) => DhlDisponiblesResponse.fromJson(e))
        .toList();
  }

  Future<DhlGuiaTrackingResponse> getDhlGuia(String tracking) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/guia/$tracking',
        options: Options(headers: {"Authorization": session}));

    return DhlGuiaTrackingResponse.fromJson(response.data);
  }

  Future<DhlTrackingResponse> getDhlTracking(String tracking) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/cancelar/$tracking',
        options: Options(headers: {"Authorization": session}));

    return DhlTrackingResponse.fromJson(response.data);
  }

  Future<DhlCancelaResponse> cancelaDhl(String tracking) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/guia/$tracking',
        options: Options(headers: {"Authorization": session}));

    return DhlCancelaResponse.fromJson(response.data);
  }

  Future<DhlCpResponse> getDhlCp(String cp) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/cp/$cp',
        options: Options(headers: {"Authorization": session}));

    return DhlCpResponse.fromJson(response.data);
  }

  Future<DhlCoberturaResponse> getDhlCobertura(
      String cpOrigen, String cpDestino) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/dhl/cobertura',
        queryParameters: {"cp_origen": cpOrigen, "cp_destino": cpDestino},
        options: Options(headers: {"Authorization": session}));

    return DhlCoberturaResponse.fromJson(response.data);
  }

  Future<DhlPostGuiaData> postDhlGuia(DhlPostGuiaRequest guia) async {
    String session = await _localAuthRepository.session;

    var response = await _dio.post('/dhl/guia',
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

    return DhlPostGuiaData.fromJson(response.data["data"]);
  }

  Future<DhlRecoleccionResponse> postDhlRecoleccion(
      DhlPostRecoleccionRequest recoleccion) async {
    String session = await _localAuthRepository.session;

    var response = await _dio.post('/dhl/recoleccion',
        options: Options(headers: {"Authorization": session}),
        data: recoleccion.toMap());

    return DhlRecoleccionResponse.fromJson(response.data);
  }
}
