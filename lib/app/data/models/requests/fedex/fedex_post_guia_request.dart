class FedexPostGuiaRequest {
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
  final String packageLineItemValor;

  FedexPostGuiaRequest({
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
    this.recipientNombre,
    this.recipientCompania,
    this.recipientTelefono,
    this.recipientCalle,
    this.recipientCalle2,
    this.recipientCiudad,
    this.recipientEstado,
    this.recipientCp,
    this.packageLineItemPeso,
    this.packageLineItemLargo,
    this.packageLineItemAncho,
    this.packageLineItemAlto,
    this.packageLineItemValor,
  });

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
      "packageLineItem_valor": this.packageLineItemValor,
      "packageLineItem_largo": this.packageLineItemLargo,
      "packageLineItem_ancho": this.packageLineItemAncho,
      "packageLineItem_alto": this.packageLineItemAlto,
    };
  }

  FedexPostGuiaRequest copyWith({
    int guiaTipo,
    int guiaPeso,
    String guiaRec,
    String shipperNombre,
    String shipperCompania,
    String shipperTelefono,
    String shipperCalle,
    String shipperCalle2,
    String shipperCiudad,
    String shipperEstado,
    String shipperCp,
    String recipientNombre,
    String recipientCompania,
    String recipientTelefono,
    String recipientCalle,
    String recipientCalle2,
    String recipientCiudad,
    String recipientEstado,
    String recipientCp,
    int packageLineItemPeso,
    int packageLineItemLargo,
    int packageLineItemAncho,
    int packageLineItemAlto,
    String packageLineItemValor,
  }) =>
      FedexPostGuiaRequest(
        guiaTipo: guiaTipo ?? this.guiaTipo,
        guiaPeso: guiaPeso ?? this.guiaPeso,
        guiaRec: guiaRec ?? this.guiaRec,
        shipperNombre: shipperNombre ?? this.shipperNombre,
        shipperCompania: shipperCompania ?? this.shipperCompania,
        shipperTelefono: shipperTelefono ?? this.shipperTelefono,
        shipperCalle: shipperCalle ?? this.shipperCalle,
        shipperCalle2: shipperCalle2 ?? this.shipperCalle2,
        shipperCiudad: shipperCiudad ?? this.shipperCiudad,
        shipperEstado: shipperEstado ?? this.shipperEstado,
        shipperCp: shipperCp ?? this.shipperCp,
        recipientNombre: recipientNombre ?? this.recipientNombre,
        recipientCompania: recipientCompania ?? this.recipientCompania,
        recipientTelefono: recipientTelefono ?? this.recipientTelefono,
        recipientCalle: recipientCalle ?? this.recipientCalle,
        recipientCalle2: recipientCalle2 ?? this.recipientCalle2,
        recipientCiudad: recipientCiudad ?? this.recipientCiudad,
        recipientEstado: recipientEstado ?? this.recipientEstado,
        recipientCp: recipientCp ?? this.recipientCp,
        packageLineItemPeso: packageLineItemPeso ?? this.packageLineItemPeso,
        packageLineItemLargo: packageLineItemLargo ?? this.packageLineItemLargo,
        packageLineItemAncho: packageLineItemAncho ?? this.packageLineItemAncho,
        packageLineItemAlto: packageLineItemAlto ?? this.packageLineItemAlto,
        packageLineItemValor: packageLineItemValor ?? this.packageLineItemValor,
      );
}
