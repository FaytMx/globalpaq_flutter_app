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

  Future<FedexAsignacionesResponse> getFedexAsignaciones() async {
    String session = await this.getToken();

    var response = await _dio.get('/fedex/asignaciones',
        options: Options(headers: {"Authorization": session}));
    return FedexAsignacionesResponse.fromJson(response.data);
  }

  Future<FedexHistorialResponse> getFedexHistorial() async {
    String session = await this.getToken();

    var response = await _dio.get('/fedex/historial',
        options: Options(headers: {"Authorization": session}));
    return FedexHistorialResponse.fromJson(response.data);
  }

  Future<FedexDisponiblesResponse> getFedexDisponibles() async {
    String session = await this.getToken();

    var response = await _dio.get('/fedex/disponibles',
        options: Options(headers: {"Authorization": session}));
    return FedexDisponiblesResponse.fromJson(response.data);
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

  Future<FedexCpResponse> getFedexCp(String cp) async {
    String session = await this.getToken();

    var response = await _dio.get('/fedex/cp/$cp',
        options: Options(headers: {"Authorization": session}));

    return FedexCpResponse.fromJson(response.data);
  }

  Future<FedexCoberturaResponse> getFedexCobertura(
      String cpOrigen, String cpDestino) async {
    String session = await _localAuthRepository.session;

    var response = await _dio.get('/fedex/cobertura',
        queryParameters: {"cp_origen": cpOrigen, "cp_destino": cpDestino},
        options: Options(headers: {"Authorization": session}));

    return FedexCoberturaResponse.fromJson(response.data);
  }

  Future<FedexPostGuiaResponse> postFedexGuia(FedexPostGuiaRequest guia) async {
    String session = await _localAuthRepository.session;
    var response = await _dio.post('/fedex/guia',
        options: Options(headers: {"Authorization": session}),
        data: guia.toMap());

    return FedexPostGuiaResponse.fromJson(response.data);
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
