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
import 'package:globalpaq_app/app/data/providers/remote/redpack_api.dart';

class RedpackRepository {
  final RedpackAPI _redpackAPI = Get.find<RedpackAPI>();

  Future<List<RedpackAsignacionesResponse>> getRedpackAsignaciones() =>
      _redpackAPI.getRedpackAsignaciones();

  Future<List<RedpackHistorialResponse>> getRedpackHistorial() =>
      _redpackAPI.getRedpackHistorial();

  Future<List<RedpackDisponiblesResponse>> getRedpackDisponibles() =>
      _redpackAPI.getRedpackDisponibles();

  Future<RedpackGuiaTrackingResponse> getRedpackGuia(String tracking) =>
      _redpackAPI.getRedpackGuia(tracking);

  Future<RedpackCancelResponse> cancelaRedpack(String tracking) =>
      _redpackAPI.cancelaRedpack(tracking);

  Future<RedpackCoberturaResponse> getRedpackCobertura(
          String cpOrigen, String cpDestino) =>
      _redpackAPI.getRedpackCobertura(cpOrigen, cpDestino);

  Future<RedpackPostGuiaData> postRedpackGuia(RedpackPostGuiaRequest guia) =>
      _redpackAPI.postRedpackGuia(guia);

  Future<RedpackRecoleccionResponse> postRedpackRecoleccion(
          RedpackPostRecoleccionRequest recoleccion) =>
      _redpackAPI.postRedpackRecoleccion(recoleccion);
}
