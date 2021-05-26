import 'package:get/get.dart';
import 'package:globalpaq_app/app/controllers/menu_controller.dart';
import 'package:globalpaq_app/app/modules/generaguia/genera_guia_controller.dart';

class GeneraGuiaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuController());
    Get.lazyPut(() => GeneraGuiaController());
  }
}
