class FedexPostRecoleccionRequest {
  final String shipperNombre;
  final String shipperCompania;
  final String shipperTelefono;
  final String shipperCalle;
  final String shipperColonia;
  final String shipperCiudad;
  final String shipperEstado;
  final String shipperCp;
  final String shipperInstructions;
  final int packageLineItemPeso;
  final int packageLineItemLargo;
  final int packageLineItemAncho;
  final int packageLineItemAlto;
  final String datePickup;
  final String packageTimeReady;
  final String lastAvailableHour;
  final String tracking;

  FedexPostRecoleccionRequest(
      this.shipperNombre,
      this.shipperCompania,
      this.shipperTelefono,
      this.shipperCalle,
      this.shipperColonia,
      this.shipperCiudad,
      this.shipperEstado,
      this.shipperCp,
      this.shipperInstructions,
      this.packageLineItemPeso,
      this.packageLineItemLargo,
      this.packageLineItemAncho,
      this.packageLineItemAlto,
      this.datePickup,
      this.packageTimeReady,
      this.lastAvailableHour,
      this.tracking);

  Map<String, dynamic> toMap() {
    return {
      "shipper_nombre": this.shipperNombre,
      "shipper_compania": this.shipperCompania,
      "shipper_telefono": this.shipperTelefono,
      "shipper_calle": this.shipperCalle,
      "shipper_colonia": this.shipperColonia,
      "shipper_ciudad": this.shipperCiudad,
      "shipper_estado": this.shipperEstado,
      "shipper_cp": this.shipperCp,
      "shipper_instructions": this.shipperInstructions,
      "packageLineItem_peso": this.packageLineItemPeso,
      "packageLineItem_largo": this.packageLineItemLargo,
      "packageLineItem_ancho": this.packageLineItemAncho,
      "packageLineItem_alto": this.packageLineItemAlto,
      "date_pickup": this.datePickup,
      "package_time_ready": this.packageTimeReady,
      "last_available_hour": this.lastAvailableHour,
      "tracking": this.tracking,
    };
  }
}
