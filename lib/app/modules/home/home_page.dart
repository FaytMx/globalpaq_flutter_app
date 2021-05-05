import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/home/home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      if (_.asociado.idasociado == null) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return Scaffold(
        body: Center(
          child: Text("${_.asociado.idasociado}"),
        ),
      );
    });
  }
}
