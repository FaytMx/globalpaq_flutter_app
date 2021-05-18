import 'package:flutter/material.dart';
import 'package:globalpaq_app/app/data/models/guias_disponibles_chart._model.dart';
import 'package:globalpaq_app/app/modules/home/widgets/guias_disponibles_chart.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';

class GuiasDisponiblesCard extends StatelessWidget {
  const GuiasDisponiblesCard({
    Key key,
    @required this.info,
  }) : super(key: key);

  final GuiasDisponiblesChartModel info;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

