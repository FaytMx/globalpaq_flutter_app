class GuiasDisponibles {
  final bool activo;
  final String descripcion;
  final int disponibles;
  final int idarticulo;
  final int peso;
  final String tipo;
  final int total;
  final int usadas;

  GuiasDisponibles({
    this.activo,
    this.descripcion,
    this.disponibles,
    this.idarticulo,
    this.peso,
    this.tipo,
    this.total,
    this.usadas,
  });

  factory GuiasDisponibles.fromJson(Map<String, dynamic> json) =>
      GuiasDisponibles(
        activo: json["fecha"],
        descripcion: json["idtipoguia"],
        disponibles: json["descripcion"],
        idarticulo: json["cantidad"],
        peso: json["peso"],
        tipo: json["venta"],
        total: json["venta"],
        usadas: json["venta"],
      );
}
