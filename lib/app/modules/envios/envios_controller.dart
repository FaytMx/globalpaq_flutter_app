import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_historial_response.dart';
import 'package:globalpaq_app/app/data/repositories/remote/dhl_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/estafeta_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/fedex_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/paquetexp_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/redpack_repository.dart';

class HistorialResponse {
  final String tipoguia;
  final String pesoguia;
  final String filename;
  final String nombred;
  final String nombrer;
  final String tracking;
  final DateTime fecha;

  HistorialResponse({
    this.tipoguia,
    this.pesoguia,
    this.filename,
    this.nombred,
    this.nombrer,
    this.tracking,
    this.fecha,
  });
}

class EnviosController extends GetxController {
  //servicios
  final FedexRepository _fedexRepository = Get.find<FedexRepository>();
  final DhlRepository _dhlRepository = Get.find<DhlRepository>();
  final EstafetaRepository _estafetaRepository = Get.find<EstafetaRepository>();
  final RedpackRepository _redpackRepository = Get.find<RedpackRepository>();
  final PaquetexpRepository _paquetexpRepository =
      Get.find<PaquetexpRepository>();

  //datos
  List<HistorialResponse> _historial = [];
  List<HistorialResponse> get historial => _historial;

  //ciclo de vida
  @override
  void onClose() {
    super.onClose();
    this._historial.clear();
  }

  Future<void> getHistorial(String tipo) async {
    switch (tipo) {
      case 'Fedex':
        List<FedexHistorialResponse> resultado =
            await this._fedexRepository.getFedexHistorial();
        // print(resultado);
        this._historial = resultado
            .map((e) => new HistorialResponse(
                  tipoguia: e.tipoguia,
                  pesoguia: e.pesoguia,
                  filename: e.filename,
                  nombrer: e.nombrer,
                  nombred: e.nombred,
                  tracking: e.tracking,
                  fecha: e.fecha,
                ))
            .toList();

        // print(this._historial);
        update();
        break;
      default:
    }
  }
}
