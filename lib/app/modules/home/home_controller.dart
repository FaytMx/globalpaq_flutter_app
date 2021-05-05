import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/asociado_info_response.dart';
import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/asociado_repository.dart';

class HomeController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  final AsociadoRepository _asociadoRepository = Get.find<AsociadoRepository>();

  DataAsociado _asociado = new DataAsociado();

  DataAsociado get asociado => _asociado;

  @override
  void onReady() {
    super.onReady();
     _init();
  }

  Future<void> _init() async {
    try {
      var response = await _asociadoRepository.getAsociadoInfo();
      // await Future.delayed(Duration(seconds: 5));
      _asociado = response.data;
      update();
    } catch (e) {
      print(e);
    }
  }
}
