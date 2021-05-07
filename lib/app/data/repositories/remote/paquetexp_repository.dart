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
import 'package:globalpaq_app/app/data/providers/remote/paquete_express_api.dart';

class PaquetexpRepository {
  final PaqueteExpressAPI _paqueteExpressAPI = Get.find<PaqueteExpressAPI>();

  Future<PaquetexpAsignacionesResponse> getPaquetexpAsignaciones() =>
      _paqueteExpressAPI.getPaquetexpAsignaciones();

  Future<PaquetexpHistorialResponse> getPaquetexpHistorial() =>
      _paqueteExpressAPI.getPaquetexpHistorial();

  Future<PaquetexpDisponiblesResponse> getPaquetexpDisponibles() =>
      _paqueteExpressAPI.getPaquetexpDisponibles();

  Future<PaquetexpGuiaTrackingResponse> getPaquetexpGuia(String tracking) =>
      _paqueteExpressAPI.getPaquetexpGuia(tracking);

  Future<PaquetexpCancelResponse> cancelaPaquetexp(String tracking) =>
      _paqueteExpressAPI.cancelaPaquetexp(tracking);

  Future<PaquetexpCoberturaResponse> getPaquetexpCobertura(
          String cpOrigen, String cpDestino) =>
      _paqueteExpressAPI.getPaquetexpCobertura(cpOrigen, cpDestino);

  Future<PaquetexpPostGuiaResponse> postPaquetexpGuia(
          PaquetexpPostGuiaRequest guia) =>
      _paqueteExpressAPI.postPaquetexpGuia(guia);

  Future postPaquetexpRecoleccion(
          PaquetexpPostRecoleccionRequest recoleccion) =>
      _paqueteExpressAPI.postPaquetexpRecoleccion(recoleccion);
}
