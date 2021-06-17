
class PedidoDetalleResponse {
    PedidoDetalleResponse({
        this.idarticulo,
        this.articulo,
        this.cantidad,
        this.precio,
    });

    final String idarticulo;
    final String articulo;
    final String cantidad;
    final String precio;

    PedidoDetalleResponse copyWith({
        String idarticulo,
        String articulo,
        String cantidad,
        String precio,
    }) => 
        PedidoDetalleResponse(
            idarticulo: idarticulo ?? this.idarticulo,
            articulo: articulo ?? this.articulo,
            cantidad: cantidad ?? this.cantidad,
            precio: precio ?? this.precio,
        );

    factory PedidoDetalleResponse.fromJson(Map<String, dynamic> json) => PedidoDetalleResponse(
        idarticulo: json["idarticulo"],
        articulo: json["articulo"],
        cantidad: json["cantidad"],
        precio: json["precio"],
    );

    Map<String, dynamic> toJson() => {
        "idarticulo": idarticulo,
        "articulo": articulo,
        "cantidad": cantidad,
        "precio": precio,
    };
}
