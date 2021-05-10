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
import 'package:globalpaq_app/app/data/providers/remote/fedex_api.dart';

class FedexRepository {
  FedexAPI _fedexApi = Get.find<FedexAPI>();

  Future<List<FedexAsignacionesResponse>> getFedexAsignaciones() =>
      _fedexApi.getFedexAsignaciones();

  Future<List<FedexHistorialResponse>> getFedexHistorial() =>
      _fedexApi.getFedexHistorial();

  Future<List<FedexDisponiblesResponse>> getFedexDisponibles() =>
      _fedexApi.getFedexDisponibles();

  Future<FedexGuiaTrackingResponse> getFedexGuia(String tracking) =>
      _fedexApi.getFedexGuia(tracking);

  Future<FedexCancelResponse> cancelaFedex(String tracking) =>
      _fedexApi.cancelaFedex(tracking);

  Future<FedexCpResponse> getFedexCp(String cp) => _fedexApi.getFedexCp(cp);

  Future<FedexCoberturaResponse> getFedexCobertura(
          String cpOrigen, String cpDestino) =>
      _fedexApi.getFedexCobertura(cpOrigen, cpDestino);

  Future<FedexPostGuiaData> postFedexGuia(FedexPostGuiaRequest guia) =>
      _fedexApi.postFedexGuia(guia);

  Future<FedexRecoleccionResponse> postFedexRecoleccion(
          FedexPostRecoleccionRequest recoleccion) =>
      _fedexApi.postFedexRecoleccion(recoleccion);
}
