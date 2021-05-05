class AsociadoInfoResponse {
  AsociadoInfoResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final DataAsociado data;

  factory AsociadoInfoResponse.fromJson(Map<String, dynamic> json) =>
      AsociadoInfoResponse(
        error: json["error"],
        status: json["status"],
        data: DataAsociado.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
      };
}

class DataAsociado {
  DataAsociado(
      {this.idasociado,
      this.nombre,
      this.correo,
      this.telefono,
      this.telefono2,
      this.telActivo,
      this.telActivo2,
      this.nombreU,
      this.correoU,
      this.telAsesor,
      this.saldo,
      this.saldoPrepago,
      this.idusuario,
      this.correoC,
      this.rfc,
      this.direccion,
      this.cp,
      this.colonia,
      this.ciudad,
      this.estado,
      this.cbz,
      this.cbzTelefono,
      this.cbzCorreo,
      this.atc,
      this.atcTelefono,
      this.atcCorreo,
      this.sop,
      this.sopTelefono,
      this.sopCorreo,
      this.logi,
      this.logiTelefono,
      this.logiCorreo,
      this.excedente,
      this.nivel,
      this.articuloRestringido,
      this.autActivo,
      this.seguro,
      this.multiguia,
      this.recoleccion,
      this.multiusuario,
      this.generar,
      this.tienda,
      this.credito,
      this.remitentes,
      this.maxguias,
      this.message});

  final String idasociado;
  final String nombre;
  final String correo;
  final dynamic telefono;
  final dynamic telefono2;
  final String telActivo;
  final String telActivo2;
  final String nombreU;
  final String correoU;
  final String telAsesor;
  final String saldo;
  final String saldoPrepago;
  final String idusuario;
  final dynamic correoC;
  final String rfc;
  final dynamic direccion;
  final dynamic cp;
  final dynamic colonia;
  final dynamic ciudad;
  final dynamic estado;
  final String cbz;
  final String cbzTelefono;
  final String cbzCorreo;
  final String atc;
  final String atcTelefono;
  final String atcCorreo;
  final String sop;
  final String sopTelefono;
  final String sopCorreo;
  final String logi;
  final String logiTelefono;
  final String logiCorreo;
  final String excedente;
  final String nivel;
  final String articuloRestringido;
  final String autActivo;
  final String seguro;
  final String multiguia;
  final String recoleccion;
  final String multiusuario;
  final String generar;
  final String tienda;
  final String credito;
  final String remitentes;
  final String maxguias;
  final String message;

  factory DataAsociado.fromJson(Map<String, dynamic> json) => DataAsociado(
        idasociado: json["idasociado"],
        nombre: json["nombre"],
        correo: json["correo"],
        telefono: json["telefono"],
        telefono2: json["telefono2"],
        telActivo: json["tel_activo"],
        telActivo2: json["tel_activo2"],
        nombreU: json["nombreU"],
        correoU: json["correoU"],
        telAsesor: json["tel_asesor"],
        saldo: json["saldo"],
        saldoPrepago: json["saldoPrepago"],
        idusuario: json["idusuario"],
        correoC: json["correoC"],
        rfc: json["rfc"],
        direccion: json["direccion"],
        cp: json["cp"],
        colonia: json["colonia"],
        ciudad: json["ciudad"],
        estado: json["estado"],
        cbz: json["cbz"],
        cbzTelefono: json["cbzTelefono"],
        cbzCorreo: json["cbzCorreo"],
        atc: json["atc"],
        atcTelefono: json["atcTelefono"],
        atcCorreo: json["atcCorreo"],
        sop: json["sop"],
        sopTelefono: json["sopTelefono"],
        sopCorreo: json["sopCorreo"],
        logi: json["logi"],
        logiTelefono: json["logiTelefono"],
        logiCorreo: json["logiCorreo"],
        excedente: json["excedente"],
        nivel: json["nivel"],
        articuloRestringido: json["articulo_restringido"],
        autActivo: json["aut_activo"],
        seguro: json["seguro"],
        multiguia: json["multiguia"],
        recoleccion: json["recoleccion"],
        multiusuario: json["multiusuario"],
        generar: json["generar"],
        tienda: json["tienda"],
        credito: json["credito"],
        remitentes: json["remitentes"],
        maxguias: json["maxguias"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "idasociado": idasociado,
        "nombre": nombre,
        "correo": correo,
        "telefono": telefono,
        "telefono2": telefono2,
        "tel_activo": telActivo,
        "tel_activo2": telActivo2,
        "nombreU": nombreU,
        "correoU": correoU,
        "tel_asesor": telAsesor,
        "saldo": saldo,
        "saldoPrepago": saldoPrepago,
        "idusuario": idusuario,
        "correoC": correoC,
        "rfc": rfc,
        "direccion": direccion,
        "cp": cp,
        "colonia": colonia,
        "ciudad": ciudad,
        "estado": estado,
        "cbz": cbz,
        "cbzTelefono": cbzTelefono,
        "cbzCorreo": cbzCorreo,
        "atc": atc,
        "atcTelefono": atcTelefono,
        "atcCorreo": atcCorreo,
        "sop": sop,
        "sopTelefono": sopTelefono,
        "sopCorreo": sopCorreo,
        "logi": logi,
        "logiTelefono": logiTelefono,
        "logiCorreo": logiCorreo,
        "excedente": excedente,
        "nivel": nivel,
        "articulo_restringido": articuloRestringido,
        "aut_activo": autActivo,
        "seguro": seguro,
        "multiguia": multiguia,
        "recoleccion": recoleccion,
        "multiusuario": multiusuario,
        "generar": generar,
        "tienda": tienda,
        "credito": credito,
        "remitentes": remitentes,
        "maxguias": maxguias,
        "message": message
      };
}
