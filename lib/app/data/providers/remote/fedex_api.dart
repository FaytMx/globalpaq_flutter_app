import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/requests/fedex/fedex_post_guia_request.dart';
import 'package:globalpaq_app/app/data/models/requests/fedex/fedex_post_recoleccion_request.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_asignaciones_response.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_cancel_response.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_cobertura_response.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_cp_response.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_disponibles_response.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_guia_tracking_response.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_historial_response.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_post_guia_response.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_recoleccion_response.dart';
import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';

class FedexAPI {
  final Dio _dio = Get.find<Dio>();
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Future<String> getToken() async => _localAuthRepository.session;

  Future<List<FedexAsignacionesResponse>> getFedexAsignaciones() async {
    String session = await this.getToken();

    var response = await _dio.get('/fedex/asignaciones',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }
    return (response.data['data'] as List)
        .map((e) => FedexAsignacionesResponse.fromJson(e))
        .toList();
  }

  Future<List<FedexHistorialResponse>> getFedexHistorial() async {
    String session = await this.getToken();

    var response = await _dio.get('/fedex/historial',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }
    return (response.data['data'] as List)
        .map((e) => FedexHistorialResponse.fromJson(e))
        .toList();
  }

  Future<List<FedexDisponiblesResponse>> getFedexDisponibles() async {
    String session = await this.getToken();

    var response = await _dio.get('/fedex/disponibles',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }

    return (response.data['data'] as List)
        .map((e) => FedexDisponiblesResponse.fromJson(e))
        .toList();
  }

  Future<FedexGuiaTrackingResponse> getFedexGuia(String tracking) async {
    String session = await this.getToken();

    var response = await _dio.get('/fedex/guia/$tracking',
        options: Options(headers: {"Authorization": session}));

    return FedexGuiaTrackingResponse.fromJson(response.data);
  }

  Future<FedexCancelResponse> cancelaFedex(String tracking) async {
    String session = await this.getToken();

    var response = await _dio.get('/fedex/cancelar/$tracking',
        options: Options(headers: {"Authorization": session}));

    return FedexCancelResponse.fromJson(response.data);
  }

  Future<List<CpFedex>> getFedexCp(String cp) async {
    String session = await this.getToken();

    var response = await _dio.get('/fedex/cp/$cp',
        options: Options(headers: {"Authorization": session}));

    if (!(response.data["data"] is List)) {
      print("👌");
      throw new Exception("Token Invalido");
    }

    return (response.data['data'] as List)
        .map((e) => CpFedex.fromJson(e))
        .toList();
  }

  Future<FedexCoberturaResponse> getFedexCobertura(
      String cpOrigen, String cpDestino) async {
    String session = await _localAuthRepository.session;

    var response = await _dio.get('/fedex/cobertura',
        queryParameters: {"cp_origen": cpOrigen, "cp_destino": cpDestino},
        options: Options(headers: {"Authorization": session}));

        print(response.data);

        if (response.data['error'] == true) {
           throw new Exception("No hay servicios disponibles.");
        }

    return FedexCoberturaResponse.fromJson(response.data);
  }

  Future<FedexPostGuiaData> postFedexGuia(FedexPostGuiaRequest guia) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.post('/fedex/guia',
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

    return FedexPostGuiaData.fromJson(response.data["data"]);
  }

  Future<FedexRecoleccionResponse> postFedexRecoleccion(
      FedexPostRecoleccionRequest recoleccion) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.post('/fedex/recoleccion',
        options: Options(headers: {"Authorization": session}),
        data: recoleccion.toMap());

    return FedexRecoleccionResponse.fromJson(response.data);
  }
}
