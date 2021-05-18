import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/seguro/seguro_controller.dart';

class SeguroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeguroController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("Seguro Page"),
        ),
      ),
    );
  }
}
