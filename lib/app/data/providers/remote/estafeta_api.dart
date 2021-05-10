import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/requests/estafeta/estafeta_post_guia_request.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_asignaciones_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_cancel_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_cobertura_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_disponibles_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_guia_tracking_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_historial_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_post_guia_response.dart';
import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';

class EstafetaAPI {
  final Dio _dio = Get.find<Dio>();
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Future<String> getToken() async => _localAuthRepository.session;

  Future<List<EstafetaAsignacionesResponse>> getEstafetaAsignaciones() async {
    String session = await this.getToken();

    var response = await _dio.get('/estafeta/asignaciones',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }

    return (response.data['data'] as List)
        .map((e) => EstafetaAsignacionesResponse.fromJson(e))
        .toList();
  }

  Future<List<EstafetaHistorialResponse>> getEstafetaHistorial() async {
    String session = await this.getToken();

    var response = await _dio.get('/estafeta/historial',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }

    return (response.data['data'] as List)
        .map((e) => EstafetaHistorialResponse.fromJson(e))
        .toList();
  }

  Future<List<EstafetaDisponiblesResponse>> getEstafetaDisponibles() async {
    String session = await this.getToken();

    var response = await _dio.get('/estafeta/disponibles',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }

    return (response.data['data'] as List)
        .map((e) => EstafetaDisponiblesResponse.fromJson(e))
        .toList();
  }

  Future<EstafetaGuiaTrackingResponse> getEstafetaGuia(String tracking) async {
    String session = await this.getToken();

    var response = await _dio.get('/estafeta/guia/$tracking',
        options: Options(headers: {"Authorization": session}));

    return EstafetaGuiaTrackingResponse.fromJson(response.data);
  }

  Future<EstafetaCancelResponse> cancelaEstafeta(String tracking) async {
    String session = await this.getToken();

    var response = await _dio.get('/estafeta/cancelar/$tracking',
        options: Options(headers: {"Authorization": session}));

    return EstafetaCancelResponse.fromJson(response.data);
  }

  Future<EstafetaCoberturaResponse> getEstafetaCobertura(
      String cpOrigen, String cpDestino) async {
    String session = await _localAuthRepository.session;

    var response = await _dio.get('/estafeta/cobertura',
        queryParameters: {"cp_origen": cpOrigen, "cp_destino": cpDestino},
        options: Options(headers: {"Authorization": session}));

    return EstafetaCoberturaResponse.fromJson(response.data);
  }

  Future<EstafetaPostGuiaData> postEstafetaGuia(
      EstafetaPostGuiaRequest guia) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.post('/estafeta/guia',
        options: Options(headers: {"Authorization": session}),
        data: guia.toMap());

    if (response.data["data"] is List || response.data["data"] is String) {
      print("👌");
      throw new Exception(response.data["data"]);
    }

    return EstafetaPostGuiaData.fromJson(response.data["data"]);
  }
}
