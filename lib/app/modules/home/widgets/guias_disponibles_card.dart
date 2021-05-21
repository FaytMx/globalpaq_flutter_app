import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/guias_disponibles_chart._model.dart';
import 'package:globalpaq_app/app/modules/home/widgets/guias_disponibles_chart.dart';
import 'package:globalpaq_app/app/routes/app_routes.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';

class GuiasDisponiblesCard extends StatelessWidget {
  const GuiasDisponiblesCard({
    Key key,
    @required this.info,
  }) : super(key: key);

  final GuiasDisponiblesChartModel info;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.MIS_GUIAS, arguments: info.paqueteria);
      },
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(info.paqueteria),
            GuiasDisponiblesChart(info:info),
            
          ],
        ),
      ),
    );
  }
}

