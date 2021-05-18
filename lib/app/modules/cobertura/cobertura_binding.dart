import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/cobertura/cobertura_controller.dart';

class CoberturaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoberturaController());
  }
}
