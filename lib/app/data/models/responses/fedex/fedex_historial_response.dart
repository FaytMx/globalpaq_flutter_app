
class FedexHistorialResponse {
    FedexHistorialResponse({
        this.fecha,
        this.tracking,
        this.nombrer,
        this.nombred,
        this.tipoguia,
        this.pesoguia,
        this.filename,
        this.idusuario,
        this.statusenvio,
        this.fechastatus,
        this.comentario,
        this.idtipoguia,
        this.lastEvent,
        this.pesoFedex,
        this.largoFedex,
        this.anchoFedex,
        this.altoFedex,
        this.unidad,
        this.diferencia,
        this.correcionDireccion,
        this.cargoValorDeclarado,
        this.entregaExtendida,
        this.recoleccionSabado,
        this.paqueteExtragrande,
        this.recoleccionExtendida,
        this.devolucionPospago,
        this.embarquePesado,
        this.cpRemitente,
        this.cpDestinatario,
        this.zona,
        this.idventa,
        this.valordeclarado,
        this.guiasHijo,
    });

    final DateTime fecha;
    final String tracking;
    final String nombrer;
    final String nombred;
    final String tipoguia;
    final String pesoguia;
    final String filename;
    final dynamic idusuario;
    final String statusenvio;
    final DateTime fechastatus;
    final String comentario;
    final String idtipoguia;
    final dynamic lastEvent;
    final dynamic pesoFedex;
    final dynamic largoFedex;
    final dynamic anchoFedex;
    final dynamic altoFedex;
    final dynamic unidad;
    final dynamic diferencia;
    final dynamic correcionDireccion;
    final dynamic cargoValorDeclarado;
    final dynamic entregaExtendida;
    final dynamic recoleccionSabado;
    final dynamic paqueteExtragrande;
    final dynamic recoleccionExtendida;
    final dynamic devolucionPospago;
    final dynamic embarquePesado;
    final String cpRemitente;
    final String cpDestinatario;
    final dynamic zona;
    final dynamic idventa;
    final String valordeclarado;
    final dynamic guiasHijo;

    factory FedexHistorialResponse.fromJson(Map<String, dynamic> json) => FedexHistorialResponse(
        fecha: DateTime.parse(json["fecha"]),
        tracking: json["tracking"],
        nombrer: json["nombrer"],
        nombred: json["nombred"],
        tipoguia: json["tipoguia"],
        pesoguia: json["pesoguia"],
        filename: json["filename"],
        idusuario: json["idusuario"],
        statusenvio: json["statusenvio"],
        fechastatus: DateTime.parse(json["fechastatus"]),
        comentario: json["comentario"],
        idtipoguia: json["idtipoguia"],
        lastEvent: json["last_event"],
        pesoFedex: json["peso_fedex"],
        largoFedex: json["largo_fedex"],
        anchoFedex: json["ancho_fedex"],
        altoFedex: json["alto_fedex"],
        unidad: json["unidad"],
        diferencia: json["diferencia"],
        correcionDireccion: json["correcion_direccion"],
        cargoValorDeclarado: json["cargo_valor_declarado"],
        entregaExtendida: json["entrega_extendida"],
        recoleccionSabado: json["recoleccion_sabado"],
        paqueteExtragrande: json["paquete_extragrande"],
        recoleccionExtendida: json["recoleccion_extendida"],
        devolucionPospago: json["devolucion_pospago"],
        embarquePesado: json["embarque_pesado"],
        cpRemitente: json["cp_remitente"],
        cpDestinatario: json["cp_destinatario"],
        zona: json["zona"],
        idventa: json["idventa"],
        valordeclarado: json["valordeclarado"],
        guiasHijo: json["guias_hijo"],
    );

    Map<String, dynamic> toJson() => {
        "fecha": fecha.toIso8601String(),
        "tracking": tracking,
        "nombrer": nombrer,
        "nombred": nombred,
        "tipoguia": tipoguia,
        "pesoguia": pesoguia,
        "filename": filename,
        "idusuario": idusuario,
        "statusenvio": statusenvio,
        "fechastatus": fechastatus.toIso8601String(),
        "comentario": comentario,
        "idtipoguia": idtipoguia,
        "last_event": lastEvent,
        "peso_fedex": pesoFedex,
        "largo_fedex": largoFedex,
        "ancho_fedex": anchoFedex,
        "alto_fedex": altoFedex,
        "unidad": unidad,
        "diferencia": diferencia,
        "correcion_direccion": correcionDireccion,
        "cargo_valor_declarado": cargoValorDeclarado,
        "entrega_extendida": entregaExtendida,
        "recoleccion_sabado": recoleccionSabado,
        "paquete_extragrande": paqueteExtragrande,
        "recoleccion_extendida": recoleccionExtendida,
        "devolucion_pospago": devolucionPospago,
        "embarque_pesado": embarquePesado,
        "cp_remitente": cpRemitente,
        "cp_destinatario": cpDestinatario,
        "zona": zona,
        "idventa": idventa,
        "valordeclarado": valordeclarado,
        "guias_hijo": guiasHijo,
    };
}
