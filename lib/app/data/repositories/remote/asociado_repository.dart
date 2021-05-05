import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/asociado_info_response.dart';
import 'package:globalpaq_app/app/data/providers/remote/asociado_api.dart';

class AsociadoRepository {
  final AsociadoAPI _asociadoAPI = Get.find<AsociadoAPI>();

  Future<AsociadoInfoResponse> getAsociadoInfo() =>
      _asociadoAPI.getAsociadoInfo();

}
