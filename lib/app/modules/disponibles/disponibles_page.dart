import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/disponibles/disponibles_controller.dart';

class DisponiblesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DisponiblesController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("Disponibles Page"),
        ),
      ),
    );
  }
}
