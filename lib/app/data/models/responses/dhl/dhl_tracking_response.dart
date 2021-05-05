class DhlTrackingResponse {
  DhlTrackingResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final TrackingDhl data;

  factory DhlTrackingResponse.fromJson(Map<String, dynamic> json) =>
      DhlTrackingResponse(
        error: json["error"],
        status: json["status"],
        data: TrackingDhl.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
      };
}

class TrackingDhl {
  TrackingDhl({this.response, this.awbInfo, this.languageCode, this.message});

  final Response response;
  final AwbInfo awbInfo;
  final String languageCode;
  final String message;

  factory TrackingDhl.fromJson(Map<String, dynamic> json) => TrackingDhl(
        response: Response.fromJson(json["Response"]),
        awbInfo: AwbInfo.fromJson(json["AWBInfo"]),
        languageCode: json["LanguageCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "Response": response.toJson(),
        "AWBInfo": awbInfo.toJson(),
        "LanguageCode": languageCode,
        "message": message
      };
}

class AwbInfo {
  AwbInfo({
    this.awbNumber,
    this.status,
    this.shipmentInfo,
  });

  final String awbNumber;
  final Status status;
  final ShipmentInfo shipmentInfo;

  factory AwbInfo.fromJson(Map<String, dynamic> json) => AwbInfo(
        awbNumber: json["AWBNumber"],
        status: Status.fromJson(json["Status"]),
        shipmentInfo: ShipmentInfo.fromJson(json["ShipmentInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "AWBNumber": awbNumber,
        "Status": status.toJson(),
        "ShipmentInfo": shipmentInfo.toJson(),
      };
}

class ShipmentInfo {
  ShipmentInfo({
    this.originServiceArea,
    this.destinationServiceArea,
    this.shipperName,
    this.consigneeName,
    this.shipmentDate,
    this.pieces,
    this.weight,
    this.weightUnit,
    this.estDlvyDate,
    this.estDlvyDateUtc,
    this.globalProductCode,
    this.shipmentDesc,
    this.dlvyNotificationFlag,
    this.shipper,
    this.consignee,
    this.shipperReference,
    this.shipmentEvent,
  });

  final ServiceArea originServiceArea;
  final ServiceArea destinationServiceArea;
  final String shipperName;
  final String consigneeName;
  final DateTime shipmentDate;
  final String pieces;
  final String weight;
  final String weightUnit;
  final String estDlvyDate;
  final DateTime estDlvyDateUtc;
  final String globalProductCode;
  final String shipmentDesc;
  final String dlvyNotificationFlag;
  final Consignee shipper;
  final Consignee consignee;
  final ShipperReference shipperReference;
  final List<ShipmentEvent> shipmentEvent;

  factory ShipmentInfo.fromJson(Map<String, dynamic> json) => ShipmentInfo(
        originServiceArea: ServiceArea.fromJson(json["OriginServiceArea"]),
        destinationServiceArea:
            ServiceArea.fromJson(json["DestinationServiceArea"]),
        shipperName: json["ShipperName"],
        consigneeName: json["ConsigneeName"],
        shipmentDate: DateTime.parse(json["ShipmentDate"]),
        pieces: json["Pieces"],
        weight: json["Weight"],
        weightUnit: json["WeightUnit"],
        estDlvyDate: json["EstDlvyDate"],
        estDlvyDateUtc: DateTime.parse(json["EstDlvyDateUTC"]),
        globalProductCode: json["GlobalProductCode"],
        shipmentDesc: json["ShipmentDesc"],
        dlvyNotificationFlag: json["DlvyNotificationFlag"],
        shipper: Consignee.fromJson(json["Shipper"]),
        consignee: Consignee.fromJson(json["Consignee"]),
        shipperReference: ShipperReference.fromJson(json["ShipperReference"]),
        shipmentEvent: List<ShipmentEvent>.from(
            json["ShipmentEvent"].map((x) => ShipmentEvent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "OriginServiceArea": originServiceArea.toJson(),
        "DestinationServiceArea": destinationServiceArea.toJson(),
        "ShipperName": shipperName,
        "ConsigneeName": consigneeName,
        "ShipmentDate": shipmentDate.toIso8601String(),
        "Pieces": pieces,
        "Weight": weight,
        "WeightUnit": weightUnit,
        "EstDlvyDate": estDlvyDate,
        "EstDlvyDateUTC": estDlvyDateUtc.toIso8601String(),
        "GlobalProductCode": globalProductCode,
        "ShipmentDesc": shipmentDesc,
        "DlvyNotificationFlag": dlvyNotificationFlag,
        "Shipper": shipper.toJson(),
        "Consignee": consignee.toJson(),
        "ShipperReference": shipperReference.toJson(),
        "ShipmentEvent":
            List<dynamic>.from(shipmentEvent.map((x) => x.toJson())),
      };
}

class Consignee {
  Consignee({
    this.city,
    this.divisionCode,
    this.postalCode,
    this.countryCode,
  });

  final String city;
  final String divisionCode;
  final String postalCode;
  final String countryCode;

  factory Consignee.fromJson(Map<String, dynamic> json) => Consignee(
        city: json["City"],
        divisionCode: json["DivisionCode"],
        postalCode: json["PostalCode"],
        countryCode: json["CountryCode"],
      );

  Map<String, dynamic> toJson() => {
        "City": city,
        "DivisionCode": divisionCode,
        "PostalCode": postalCode,
        "CountryCode": countryCode,
      };
}

class ServiceArea {
  ServiceArea({
    this.serviceAreaCode,
    this.description,
  });

  final String serviceAreaCode;
  final String description;

  factory ServiceArea.fromJson(Map<String, dynamic> json) => ServiceArea(
        serviceAreaCode: json["ServiceAreaCode"],
        description: json["Description"],
      );

  Map<String, dynamic> toJson() => {
        "ServiceAreaCode": serviceAreaCode,
        "Description": description,
      };
}

class ShipmentEvent {
  ShipmentEvent({
    this.date,
    this.time,
    this.serviceEvent,
    this.signatory,
    this.serviceArea,
  });

  final DateTime date;
  final String time;
  final ServiceEvent serviceEvent;
  final List<dynamic> signatory;
  final ServiceArea serviceArea;

  factory ShipmentEvent.fromJson(Map<String, dynamic> json) => ShipmentEvent(
        date: DateTime.parse(json["Date"]),
        time: json["Time"],
        serviceEvent: ServiceEvent.fromJson(json["ServiceEvent"]),
        signatory: List<dynamic>.from(json["Signatory"].map((x) => x)),
        serviceArea: ServiceArea.fromJson(json["ServiceArea"]),
      );

  Map<String, dynamic> toJson() => {
        "Date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "Time": time,
        "ServiceEvent": serviceEvent.toJson(),
        "Signatory": List<dynamic>.from(signatory.map((x) => x)),
        "ServiceArea": serviceArea.toJson(),
      };
}

class ServiceEvent {
  ServiceEvent({
    this.eventCode,
    this.description,
  });

  final String eventCode;
  final String description;

  factory ServiceEvent.fromJson(Map<String, dynamic> json) => ServiceEvent(
        eventCode: json["EventCode"],
        description: json["Description"],
      );

  Map<String, dynamic> toJson() => {
        "EventCode": eventCode,
        "Description": description,
      };
}

class ShipperReference {
  ShipperReference({
    this.referenceId,
  });

  final String referenceId;

  factory ShipperReference.fromJson(Map<String, dynamic> json) =>
      ShipperReference(
        referenceId: json["ReferenceID"],
      );

  Map<String, dynamic> toJson() => {
        "ReferenceID": referenceId,
      };
}

class Status {
  Status({
    this.actionStatus,
  });

  final String actionStatus;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        actionStatus: json["ActionStatus"],
      );

  Map<String, dynamic> toJson() => {
        "ActionStatus": actionStatus,
      };
}

class Response {
  Response({
    this.serviceHeader,
  });

  final ServiceHeader serviceHeader;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        serviceHeader: ServiceHeader.fromJson(json["ServiceHeader"]),
      );

  Map<String, dynamic> toJson() => {
        "ServiceHeader": serviceHeader.toJson(),
      };
}

class ServiceHeader {
  ServiceHeader({
    this.messageTime,
    this.messageReference,
  });

  final DateTime messageTime;
  final String messageReference;

  factory ServiceHeader.fromJson(Map<String, dynamic> json) => ServiceHeader(
        messageTime: DateTime.parse(json["MessageTime"]),
        messageReference: json["MessageReference"],
      );

  Map<String, dynamic> toJson() => {
        "MessageTime": messageTime.toIso8601String(),
        "MessageReference": messageReference,
      };
}
