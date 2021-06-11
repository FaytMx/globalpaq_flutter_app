import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/dhl/dhl_asignaciones_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_asignaciones_response.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_asignaciones_response.dart';
import 'package:globalpaq_app/app/data/models/responses/paquetexp/paquetexp_asignaciones_response.dart';
import 'package:globalpaq_app/app/data/models/responses/redpack/redpack_asignaciones_response.dart';
import 'package:globalpaq_app/app/data/repositories/remote/dhl_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/estafeta_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/fedex_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/paquetexp_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/redpack_repository.dart';

class AsignacionesResponse {
  AsignacionesResponse({
    this.fecha,
    this.idtipoguia,
    this.descripcion,
    this.cantidad,
    this.peso,
    this.venta,
  });

  final DateTime fecha;
  final String idtipoguia;
  final String descripcion;
  final String cantidad;
  final String peso;
  final String venta;

  factory AsignacionesResponse.fromJson(Map<String, dynamic> json) =>
      AsignacionesResponse(
        fecha: DateTime.parse(json["fecha"]),
        idtipoguia: json["idtipoguia"],
        descripcion: json["descripcion"],
        cantidad: json["cantidad"],
        peso: json["peso"],
        venta: json["venta"],
      );

  Map<String, dynamic> toJson() => {
        "fecha": fecha.toIso8601String(),
        "idtipoguia": idtipoguia,
        "descripcion": descripcion,
        "cantidad": cantidad,
        "peso": peso,
        "venta": venta,
      };
}

class MovimientosController extends GetxController {
  //servicios
  final FedexRepository _fedexRepository = Get.find<FedexRepository>();
  final DhlRepository _dhlRepository = Get.find<DhlRepository>();
  final EstafetaRepository _estafetaRepository = Get.find<EstafetaRepository>();
  final RedpackRepository _redpackRepository = Get.find<RedpackRepository>();
  final PaquetexpRepository _paquetexpRepository =
      Get.find<PaquetexpRepository>();

  //datos
  List<AsignacionesResponse> _asignaciones = [];
  List<AsignacionesResponse> get asignaciones => _asignaciones;

  //ciclo de vida
  @override
  void onClose() {
    super.onClose();
    this._asignaciones.clear();
  }


  //metodos

  Future<void> getMovimientos(String tipo) async {
    switch (tipo) {
      case 'Fedex':
        List<FedexAsignacionesResponse> resultado =
            await this._fedexRepository.getFedexAsignaciones();
        this._asignaciones = resultado
            .map(
              (e) => AsignacionesResponse(
                fecha: e.fecha,
                idtipoguia: e.idtipoguia,
                descripcion: e.descripcion,
                cantidad: e.cantidad,
                peso: e.peso,
                venta: e.venta,
              ),
            )
            .toList();

            update();
        break;
      case 'Dhl':
        List<DhlAsignacionesResponse> resultado =
            await this._dhlRepository.getAsignaciones();
        this._asignaciones = resultado
            .map(
              (e) => AsignacionesResponse(
                fecha: e.fecha,
                idtipoguia: e.idtipoguia,
                descripcion: e.descripcion,
                cantidad: e.cantidad,
                peso: e.peso,
                venta: e.venta,
              ),
            )
            .toList();
            update();
        break;
      case 'Estafeta':
        List<EstafetaAsignacionesResponse> resultado =
            await this._estafetaRepository.getEstafetaAsignaciones();
        this._asignaciones = resultado
            .map(
              (e) => AsignacionesResponse(
                fecha: e.fecha,
                idtipoguia: e.idtipoguia,
                descripcion: e.descripcion,
                cantidad: e.cantidad,
                peso: e.peso,
                venta: e.venta,
              ),
            )
            .toList();
            update();
        break;
      case 'Redpack':
        List<RedpackAsignacionesResponse> resultado =
            await this._redpackRepository.getRedpackAsignaciones();
        this._asignaciones = resultado
            .map(
              (e) => AsignacionesResponse(
                fecha: e.fecha,
                idtipoguia: e.idtipoguia,
                descripcion: e.descripcion,
                cantidad: e.cantidad,
                peso: e.peso,
                venta: e.venta,
              ),
            )
            .toList();
            update();
        break;
      case 'Paquetexp':
        List<PaquetexpAsignacionesResponse> resultado =
            await this._paquetexpRepository.getPaquetexpAsignaciones();
        this._asignaciones = resultado
            .map(
              (e) => AsignacionesResponse(
                fecha: e.fecha,
                idtipoguia: e.idtipoguia,
                descripcion: e.descripcion,
                cantidad: e.cantidad,
                peso: e.peso,
                venta: e.venta,
              ),
            )
            .toList();
            update();
        break;
      default:
        break;
    }
  }
}
