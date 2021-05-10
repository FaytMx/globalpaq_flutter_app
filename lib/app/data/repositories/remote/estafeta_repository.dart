import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/requests/estafeta/estafeta_post_guia_request.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_asignaciones_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_cancel_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_cobertura_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_disponibles_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_guia_tracking_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_historial_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_post_guia_response.dart';
import 'package:globalpaq_app/app/data/providers/remote/estafeta_api.dart';

class EstafetaRepository {
  final EstafetaAPI _estafetaAPI = Get.find<EstafetaAPI>();

  Future<List<EstafetaAsignacionesResponse>> getEstafetaAsignaciones() =>
      _estafetaAPI.getEstafetaAsignaciones();

  Future<List<EstafetaHistorialResponse>> getEstafetaHistorial() =>
      _estafetaAPI.getEstafetaHistorial();

  Future<List<EstafetaDisponiblesResponse>> getEstafetaDisponibles() =>
      _estafetaAPI.getEstafetaDisponibles();

  Future<EstafetaGuiaTrackingResponse> getEstafetapGuia(String tracking) =>
      _estafetaAPI.getEstafetaGuia(tracking);

  Future<EstafetaCancelResponse> cancelaEstafeta(String tracking) =>
      _estafetaAPI.cancelaEstafeta(tracking);

  Future<EstafetaCoberturaResponse> getEstafetapCobertura(
          String cpOrigen, String cpDestino) =>
      _estafetaAPI.getEstafetaCobertura(cpOrigen, cpDestino);

  Future<EstafetaPostGuiaData> postEstafetaGuia(
          EstafetaPostGuiaRequest guia) =>
      _estafetaAPI.postEstafetaGuia(guia);
}
