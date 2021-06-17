
class ArticulosResponse {
    ArticulosResponse({
        this.articulos,
    });

    final List<Articulo> articulos;

    ArticulosResponse copyWith({
        List<Articulo> articulos,
    }) => 
        ArticulosResponse(
            articulos: articulos ?? this.articulos,
        );

    factory ArticulosResponse.fromJson(Map<String, dynamic> json) => ArticulosResponse(
        articulos: List<Articulo>.from(json["articulos"].map((x) => Articulo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "articulos": List<dynamic>.from(articulos.map((x) => x.toJson())),
    };
}

class Articulo {
    Articulo({
        this.idarticulo,
        this.articulo,
        this.precio0,
        this.costo,
        this.activo,
        this.bloqueado,
        this.restringido1,
        this.restringido2,
        this.sistemaWeb,
        this.precio,
    });

    final String idarticulo;
    final String articulo;
    final String precio0;
    final String costo;
    final String activo;
    final String bloqueado;
    final String restringido1;
    final String restringido2;
    final String sistemaWeb;
    final String precio;

    Articulo copyWith({
        String idarticulo,
        String articulo,
        String precio0,
        String costo,
        String activo,
        String bloqueado,
        String restringido1,
        String restringido2,
        String sistemaWeb,
        String precio,
    }) => 
        Articulo(
            idarticulo: idarticulo ?? this.idarticulo,
            articulo: articulo ?? this.articulo,
            precio0: precio0 ?? this.precio0,
            costo: costo ?? this.costo,
            activo: activo ?? this.activo,
            bloqueado: bloqueado ?? this.bloqueado,
            restringido1: restringido1 ?? this.restringido1,
            restringido2: restringido2 ?? this.restringido2,
            sistemaWeb: sistemaWeb ?? this.sistemaWeb,
            precio: precio ?? this.precio,
        );

    factory Articulo.fromJson(Map<String, dynamic> json) => Articulo(
        idarticulo: json["idarticulo"],
        articulo: json["articulo"],
        precio0: json["precio_0"],
        costo: json["costo"],
        activo: json["activo"],
        bloqueado: json["bloqueado"],
        restringido1: json["restringido1"],
        restringido2: json["restringido2"],
        sistemaWeb: json["sistema_web"],
        precio: json["precio"],
    );

    Map<String, dynamic> toJson() => {
        "idarticulo": idarticulo,
        "articulo": articulo,
        "precio_0": precio0,
        "costo": costo,
        "activo": activo,
        "bloqueado": bloqueado,
        "restringido1": restringido1,
        "restringido2": restringido2,
        "sistema_web": sistemaWeb,
        "precio": precio,
    };
}
