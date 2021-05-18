import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/aclaraciones/aclaraciones_binding.dart';
import 'package:globalpaq_app/app/modules/aclaraciones/aclaraciones_page.dart';
import 'package:globalpaq_app/app/modules/cobertura/cobertura_binding.dart';
import 'package:globalpaq_app/app/modules/cobertura/cobertura_page.dart';
import 'package:globalpaq_app/app/modules/envios/envios_binding.dart';
import 'package:globalpaq_app/app/modules/envios/envios_page.dart';
import 'package:globalpaq_app/app/modules/home/home_binding.dart';
import 'package:globalpaq_app/app/modules/home/home_page.dart';
import 'package:globalpaq_app/app/modules/login/login_binding.dart';
import 'package:globalpaq_app/app/modules/login/login_page.dart';
import 'package:globalpaq_app/app/modules/misguias/mis_guias_binding.dart';
import 'package:globalpaq_app/app/modules/misguias/mis_guias_page.dart';
import 'package:globalpaq_app/app/modules/movimientos/movimientos_binding.dart';
import 'package:globalpaq_app/app/modules/movimientos/movimientos_page.dart';
import 'package:globalpaq_app/app/modules/pedidos/pedidos_binding.dart';
import 'package:globalpaq_app/app/modules/pedidos/pedidos_page.dart';
import 'package:globalpaq_app/app/modules/recolecciones/recolecciones_binding.dart';
import 'package:globalpaq_app/app/modules/recolecciones/recolecciones_page.dart';
import 'package:globalpaq_app/app/modules/seguro/seguro_binding.dart';
import 'package:globalpaq_app/app/modules/seguro/seguro_page.dart';
import 'package:globalpaq_app/app/modules/splash/splash_binding.dart';
import 'package:globalpaq_app/app/modules/splash/splash_page.dart';
import 'package:globalpaq_app/app/modules/tienda/tienda_binding.dart';
import 'package:globalpaq_app/app/modules/tienda/tienda_page.dart';
import 'package:globalpaq_app/app/routes/app_routes.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.MIS_GUIAS,
      page: () => MisGuiasPage(),
      binding: MisGuiasBinding(),
    ),
    GetPage(
      name: AppRoutes.MOVIMIENTOS,
      page: () => MovimientosPage(),
      binding: MovimientosBinding(),
    ),
    GetPage(
      name: AppRoutes.PEDIDOS,
      page: () => PedidosPage(),
      binding: PedidosBinding(),
    ),
    GetPage(
      name: AppRoutes.ENVIOS,
      page: () => EnviosPage(),
      binding: EnviosBinding(),
    ),
    GetPage(
      name: AppRoutes.RECOLECCIONES,
      page: () => RecoleccionesPage(),
      binding: RecoleccionesBinding(),
    ),
    GetPage(
      name: AppRoutes.TIENDA,
      page: () => TiendaPage(),
      binding: TiendaBinding(),
    ),
    GetPage(
      name: AppRoutes.COBERTURA,
      page: () => CoberturaPage(),
      binding: CoberturaBinding(),
    ),
    GetPage(
      name: AppRoutes.SEGURO,
      page: () => SeguroPage(),
      binding: SeguroBinding(),
    ),
    GetPage(
      name: AppRoutes.ACLARACIONES,
      page: () => AclaracionesPage(),
      binding: AclaracionesBinding(),
    ),
  ];
}
