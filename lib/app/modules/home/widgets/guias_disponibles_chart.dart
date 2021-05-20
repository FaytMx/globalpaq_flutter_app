import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:globalpaq_app/app/data/models/guias_disponibles_chart._model.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';

class GuiasDisponiblesChart extends StatelessWidget {
  GuiasDisponiblesChart({
    Key key,
    this.info,
  }) : super(key: key);

  final GuiasDisponiblesChartModel info;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 50,
              startDegreeOffset: -90,
              sections: [
                PieChartSectionData(
                  color: info.color,
                  value: info.porcentaje,
                  showTitle: false,
                  radius: 16,
                ),
                PieChartSectionData(
                  color: info.color.withOpacity(0.1),
                  value: 100-info.porcentaje,
                  showTitle: false,
                  radius: 13,
                ),
              ],
            ),
          ),
          Positioned.fill(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: defaultPadding,
              ),
              Text(
                "${info.disponible}",
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 0.5),
              ),
              Text("de ${info.total} guias"),
            ],
          )),
        ],
      ),
    );
  }
}
