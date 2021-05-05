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

import 'package:globalpaq_app/app/data/providers/remote/dhl_api.dart';

class DhlRepository {
  final DhlAPI _dhlAPI = Get.find<DhlAPI>();

  Future<DhlAsignacionesResponse> getAsignaciones() =>
      _dhlAPI.getAsignaciones();

  Future<DhlHistorialResponse> getHistorial() => _dhlAPI.getHistorial();

  Future<DhlDisponiblesResponse> getDisponibles() => _dhlAPI.getDisponibles();

  Future<DhlGuiaTrackingResponse> getGuia(String tracking) =>
      _dhlAPI.getGuia(tracking);

  Future<DhlTrackingResponse> getTracking(String tracking) =>
      _dhlAPI.getTracking(tracking);

  Future<DhlCancelaResponse> cancela(String tracking) =>
      _dhlAPI.cancela(tracking);

  Future<DhlCpResponse> getCp(String cp) => _dhlAPI.getCp(cp);

  Future<DhlCoberturaResponse> getCobertura(
          String cpOrigen, String cpDestino) =>
      _dhlAPI.getCobertura(cpOrigen, cpDestino);

  Future<DhlPostGuiaResponse> postGuia(DhlPostGuiaRequest guia) =>
      _dhlAPI.postGuia(guia);

  Future<DhlRecoleccionResponse> postRecoleccion(
          DhlPostRecoleccionRequest recoleccion) =>
      _dhlAPI.postRecoleccion(recoleccion);
}
