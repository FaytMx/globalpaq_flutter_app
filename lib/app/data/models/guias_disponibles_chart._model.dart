import 'package:flutter/material.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';

class GuiasDisponiblesChartModel {
  int total;
  int usadas;
  int disponible;
  double porcentaje;
  String paqueteria;
  Color color;

  GuiasDisponiblesChartModel({
    this.total = 0,
    this.usadas = 0,
    this.disponible = 0,
    this.porcentaje = 0,
    this.paqueteria = "",
    this.color = primaryColor,
  });
}
