class EstafetaTrackingResponse {
  EstafetaTrackingResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final EstafetaTracking data;

  factory EstafetaTrackingResponse.fromJson(Map<String, dynamic> json) =>
      EstafetaTrackingResponse(
        error: json["error"],
        status: json["status"],
        data: EstafetaTracking.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
      };
}

class EstafetaTracking {
  EstafetaTracking({
    this.executeQueryResult,
  });

  final ExecuteQueryResult executeQueryResult;

  factory EstafetaTracking.fromJson(Map<String, dynamic> json) => EstafetaTracking(
        executeQueryResult:
            ExecuteQueryResult.fromJson(json["ExecuteQueryResult"]),
      );

  Map<String, dynamic> toJson() => {
        "ExecuteQueryResult": executeQueryResult.toJson(),
      };
}

class ExecuteQueryResult {
  ExecuteQueryResult({
    this.errorCode,
    this.errorCodeDescriptionSpa,
    this.errorCodeDescriptionEng,
    this.trackingData,
  });

  final String errorCode;
  final String errorCodeDescriptionSpa;
  final String errorCodeDescriptionEng;
  final TrackingData trackingData;

  factory ExecuteQueryResult.fromJson(Map<String, dynamic> json) =>
      ExecuteQueryResult(
        errorCode: json["errorCode"],
        errorCodeDescriptionSpa: json["errorCodeDescriptionSPA"],
        errorCodeDescriptionEng: json["errorCodeDescriptionENG"],
        trackingData: TrackingData.fromJson(json["trackingData"]),
      );

  Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "errorCodeDescriptionSPA": errorCodeDescriptionSpa,
        "errorCodeDescriptionENG": errorCodeDescriptionEng,
        "trackingData": trackingData.toJson(),
      };
}

class TrackingData {
  TrackingData({
    this.trackingData,
  });

  final TrackingDataClass trackingData;

  factory TrackingData.fromJson(Map<String, dynamic> json) => TrackingData(
        trackingData: TrackingDataClass.fromJson(json["TrackingData"]),
      );

  Map<String, dynamic> toJson() => {
        "TrackingData": trackingData.toJson(),
      };
}

class TrackingDataClass {
  TrackingDataClass({
    this.waybill,
    this.shortWaybillId,
    this.serviceId,
    this.serviceDescriptionSpa,
    this.serviceDescriptionEng,
    this.customerNumber,
    this.packageType,
    this.additionalInformation,
    this.statusSpa,
    this.statusEng,
    this.pickupData,
    this.deliveryData,
    this.history,
  });

  final String waybill;
  final String shortWaybillId;
  final String serviceId;
  final String serviceDescriptionSpa;
  final String serviceDescriptionEng;
  final String customerNumber;
  final String packageType;
  final String additionalInformation;
  final String statusSpa;
  final String statusEng;
  final PickupData pickupData;
  final DeliveryData deliveryData;
  final History history;

  factory TrackingDataClass.fromJson(Map<String, dynamic> json) =>
      TrackingDataClass(
        waybill: json["waybill"],
        shortWaybillId: json["shortWaybillId"],
        serviceId: json["serviceId"],
        serviceDescriptionSpa: json["serviceDescriptionSPA"],
        serviceDescriptionEng: json["serviceDescriptionENG"],
        customerNumber: json["customerNumber"],
        packageType: json["packageType"],
        additionalInformation: json["additionalInformation"],
        statusSpa: json["statusSPA"],
        statusEng: json["statusENG"],
        pickupData: PickupData.fromJson(json["pickupData"]),
        deliveryData: DeliveryData.fromJson(json["deliveryData"]),
        history: History.fromJson(json["history"]),
      );

  Map<String, dynamic> toJson() => {
        "waybill": waybill,
        "shortWaybillId": shortWaybillId,
        "serviceId": serviceId,
        "serviceDescriptionSPA": serviceDescriptionSpa,
        "serviceDescriptionENG": serviceDescriptionEng,
        "customerNumber": customerNumber,
        "packageType": packageType,
        "additionalInformation": additionalInformation,
        "statusSPA": statusSpa,
        "statusENG": statusEng,
        "pickupData": pickupData.toJson(),
        "deliveryData": deliveryData.toJson(),
        "history": history.toJson(),
      };
}

class DeliveryData {
  DeliveryData({
    this.destinationAcronym,
    this.destinationName,
    this.deliveryDateTime,
    this.zipCode,
    this.receiverName,
  });

  final String destinationAcronym;
  final String destinationName;
  final String deliveryDateTime;
  final String zipCode;
  final String receiverName;

  factory DeliveryData.fromJson(Map<String, dynamic> json) => DeliveryData(
        destinationAcronym: json["destinationAcronym"],
        destinationName: json["destinationName"],
        deliveryDateTime: json["deliveryDateTime"],
        zipCode: json["zipCode"],
        receiverName: json["receiverName"],
      );

  Map<String, dynamic> toJson() => {
        "destinationAcronym": destinationAcronym,
        "destinationName": destinationName,
        "deliveryDateTime": deliveryDateTime,
        "zipCode": zipCode,
        "receiverName": receiverName,
      };
}

class History {
  History({
    this.history,
  });

  final List<HistoryElement> history;

  factory History.fromJson(Map<String, dynamic> json) => History(
        history: List<HistoryElement>.from(
            json["History"].map((x) => HistoryElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "History": List<dynamic>.from(history.map((x) => x.toJson())),
      };
}

class HistoryElement {
  HistoryElement({
    this.eventDateTime,
    this.eventId,
    this.eventDescriptionSpa,
    this.eventDescriptionEng,
    this.eventPlaceAcronym,
    this.eventPlaceName,
    this.exceptionCode,
    this.exceptionCodeDescriptionSpa,
    this.exceptionCodeDescriptionEng,
    this.exceptionCodeDetails,
  });

  final String eventDateTime;
  final String eventId;
  final String eventDescriptionSpa;
  final String eventDescriptionEng;
  final String eventPlaceAcronym;
  final String eventPlaceName;
  final String exceptionCode;
  final String exceptionCodeDescriptionSpa;
  final String exceptionCodeDescriptionEng;
  final String exceptionCodeDetails;

  factory HistoryElement.fromJson(Map<String, dynamic> json) => HistoryElement(
        eventDateTime: json["eventDateTime"],
        eventId: json["eventId"],
        eventDescriptionSpa: json["eventDescriptionSPA"],
        eventDescriptionEng: json["eventDescriptionENG"],
        eventPlaceAcronym: json["eventPlaceAcronym"],
        eventPlaceName: json["eventPlaceName"],
        exceptionCode: json["exceptionCode"],
        exceptionCodeDescriptionSpa: json["exceptionCodeDescriptionSPA"],
        exceptionCodeDescriptionEng: json["exceptionCodeDescriptionENG"],
        exceptionCodeDetails: json["exceptionCodeDetails"],
      );

  Map<String, dynamic> toJson() => {
        "eventDateTime": eventDateTime,
        "eventId": eventId,
        "eventDescriptionSPA": eventDescriptionSpa,
        "eventDescriptionENG": eventDescriptionEng,
        "eventPlaceAcronym": eventPlaceAcronym,
        "eventPlaceName": eventPlaceName,
        "exceptionCode": exceptionCode,
        "exceptionCodeDescriptionSPA": exceptionCodeDescriptionSpa,
        "exceptionCodeDescriptionENG": exceptionCodeDescriptionEng,
        "exceptionCodeDetails": exceptionCodeDetails,
      };
}

class PickupData {
  PickupData({
    this.originAcronym,
    this.originName,
    this.pickupDateTime,
  });

  final String originAcronym;
  final String originName;
  final String pickupDateTime;

  factory PickupData.fromJson(Map<String, dynamic> json) => PickupData(
        originAcronym: json["originAcronym"],
        originName: json["originName"],
        pickupDateTime: json["pickupDateTime"],
      );

  Map<String, dynamic> toJson() => {
        "originAcronym": originAcronym,
        "originName": originName,
        "pickupDateTime": pickupDateTime,
      };
}
