import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/misguias/mis_guias_controller.dart';
import 'package:globalpaq_app/app/modules/misguias/widgets/mis_guias_screen.dart';
import 'package:globalpaq_app/app/utils/responsive.dart';
import 'package:globalpaq_app/app/widgets/side_menu.dart';

class MisGuiasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MisGuiasController>(builder: (_) {
      return Scaffold(
        key: _.scaffoldKey,
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                flex: 5,
                child: MisGuiasScreen(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
