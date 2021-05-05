import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/asociado_info_response.dart';
import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';

class AsociadoAPI {
  final Dio _dio = Get.find<Dio>();
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Future<AsociadoInfoResponse> getAsociadoInfo() async {
    String session = await _localAuthRepository.session;
    var response = await _dio.get('/asociado/info',
        options:
            Options(headers: {"Authorization": session}));

    return AsociadoInfoResponse.fromJson(response.data);
  }
}
