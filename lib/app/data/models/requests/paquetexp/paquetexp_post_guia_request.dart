class PaquetexpPostGuiaRequest {
  final int guiaTipo;
  final int guiaPeso;
  final String guiaRec;
  final String shipperNombre;
  final String shipperCompania;
  final String shipperTelefono;
  final String shipperCalle;
  final String shipperCalle2;
  final String shipperCiudad;
  final String shipperEstado;
  final String shipperCp;
  final String recipientNombre;
  final String recipientCompania;
  final String recipientTelefono;
  final String recipientCalle;
  final String recipientCalle2;
  final String recipientCiudad;
  final String recipientEstado;
  final String recipientCp;
  final int packageLineItemPeso;
  final int packageLineItemLargo;
  final int packageLineItemAncho;
  final int packageLineItemAlto;
  final String packageLineItemContenido;
  final String shipperNumExt;
  final String recipientNumExt;
  final String shipperEmail;
  final String recipientEmail;
  final double packageLineItemValor;

  PaquetexpPostGuiaRequest(
    this.guiaTipo,
    this.guiaPeso,
    this.guiaRec,
    this.shipperNombre,
    this.shipperCompania,
    this.shipperTelefono,
    this.shipperCalle,
    this.shipperCalle2,
    this.shipperCiudad,
    this.shipperEstado,
    this.shipperCp,
    this.shipperNumExt,
    this.shipperEmail,
    this.recipientNombre,
    this.recipientCompania,
    this.recipientTelefono,
    this.recipientCalle,
    this.recipientCalle2,
    this.recipientCiudad,
    this.recipientEstado,
    this.recipientCp,
    this.recipientNumExt,
    this.recipientEmail,
    this.packageLineItemPeso,
    this.packageLineItemLargo,
    this.packageLineItemAncho,
    this.packageLineItemAlto,
    this.packageLineItemContenido,
    this.packageLineItemValor,
  );

  Map<String, dynamic> toMap() {
    return {
      "guia_tipo": this.guiaTipo,
      "guia_peso": this.guiaPeso,
      "guia_rec": this.guiaRec,
      "shipper_nombre": this.shipperNombre,
      "shipper_compania": this.shipperCompania,
      "shipper_telefono": this.shipperTelefono,
      "shipper_calle": this.shipperCalle,
      "shipper_calle2": this.shipperCalle2,
      "shipper_ciudad": this.shipperCiudad,
      "shipper_estado": this.shipperEstado,
      "shipper_cp": this.shipperCp,
      "recipient_nombre": this.recipientNombre,
      "recipient_compania": this.recipientCompania,
      "recipient_telefono": this.recipientTelefono,
      "recipient_calle": this.recipientCalle,
      "recipient_calle2": this.recipientCalle2,
      "recipient_ciudad": this.recipientCiudad,
      "recipient_estado": this.recipientEstado,
      "recipient_cp": this.recipientCp,
      "packageLineItem_peso": this.packageLineItemPeso,
      "packageLineItem_largo": this.packageLineItemLargo,
      "packageLineItem_ancho": this.packageLineItemAncho,
      "packageLineItem_alto": this.packageLineItemAlto,
      "packageLineItem_contenido": this.packageLineItemContenido,
      "shipper_num_ext": this.shipperNumExt,
      "recipient_num_ext": this.recipientNumExt,
      "shipper_email": this.shipperEmail,
      "recipient_email": this.recipientEmail,
      "packageLineItem_valor": this.packageLineItemValor,
    };
  }
}
