import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/cobertura/cobertura_controller.dart';

class CoberturaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoberturaController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("Cobertura Page"),
        ),
      ),
    );
  }
}
