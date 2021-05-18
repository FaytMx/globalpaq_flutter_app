import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/seguro/seguro_controller.dart';

class SeguroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SeguroController());
  }
}
