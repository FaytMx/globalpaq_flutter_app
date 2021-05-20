import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/misguias/mis_guias_controller.dart';

class MisGuiasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MisGuiasController());
    
  }
}
