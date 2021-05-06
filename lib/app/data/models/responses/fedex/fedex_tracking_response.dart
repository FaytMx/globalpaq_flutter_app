class FedexTrackingResponse {
  FedexTrackingResponse({
    this.error,
    this.status,
    this.type,
    this.data,
  });

  final bool error;
  final int status;
  final int type;
  final FedexTracking data;

  factory FedexTrackingResponse.fromJson(Map<String, dynamic> json) =>
      FedexTrackingResponse(
        error: json["error"],
        status: json["status"],
        type: json["type"],
        data: FedexTracking.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "type": type,
        "data": data.toJson(),
      };
}

class FedexTracking {
  FedexTracking({
    this.notification,
    this.trackingNumber,
    this.trackingNumberUniqueIdentifier,
    this.statusDetail,
    this.serviceCommitMessage,
    this.destinationServiceArea,
    this.carrierCode,
    this.operatingCompanyOrCarrierDescription,
    this.otherIdentifiers,
    this.service,
    this.packageWeight,
    this.packageDimensions,
    this.shipmentWeight,
    this.packaging,
    this.packagingType,
    this.packageSequenceNumber,
    this.packageCount,
    this.creatorSoftwareId,
    this.specialHandlings,
    this.payments,
    this.shipperAddress,
    this.datesOrTimes,
    this.destinationAddress,
    this.deliveryAttempts,
    this.totalUniqueAddressCountInConsolidation,
    this.notificationEventsAvailable,
    this.deliveryOptionEligibilityDetails,
    this.events,
    this.message,
  });

  final Notification notification;
  final String trackingNumber;
  final String trackingNumberUniqueIdentifier;
  final StatusDetail statusDetail;
  final String serviceCommitMessage;
  final String destinationServiceArea;
  final String carrierCode;
  final String operatingCompanyOrCarrierDescription;
  final OtherIdentifiers otherIdentifiers;
  final Service service;
  final Weight packageWeight;
  final PackageDimensions packageDimensions;
  final Weight shipmentWeight;
  final String packaging;
  final String packagingType;
  final int packageSequenceNumber;
  final int packageCount;
  final String creatorSoftwareId;
  final SpecialHandlings specialHandlings;
  final Payments payments;
  final Address shipperAddress;
  final List<DatesOrTime> datesOrTimes;
  final Address destinationAddress;
  final int deliveryAttempts;
  final int totalUniqueAddressCountInConsolidation;
  final List<String> notificationEventsAvailable;
  final List<DeliveryOptionEligibilityDetail> deliveryOptionEligibilityDetails;
  final Events events;
  final String message;

  factory FedexTracking.fromJson(Map<String, dynamic> json) => FedexTracking(
        notification: Notification.fromJson(json["Notification"]),
        trackingNumber: json["TrackingNumber"],
        trackingNumberUniqueIdentifier: json["TrackingNumberUniqueIdentifier"],
        statusDetail: StatusDetail.fromJson(json["StatusDetail"]),
        serviceCommitMessage: json["ServiceCommitMessage"],
        destinationServiceArea: json["DestinationServiceArea"],
        carrierCode: json["CarrierCode"],
        operatingCompanyOrCarrierDescription:
            json["OperatingCompanyOrCarrierDescription"],
        otherIdentifiers: OtherIdentifiers.fromJson(json["OtherIdentifiers"]),
        service: Service.fromJson(json["Service"]),
        packageWeight: Weight.fromJson(json["PackageWeight"]),
        packageDimensions:
            PackageDimensions.fromJson(json["PackageDimensions"]),
        shipmentWeight: Weight.fromJson(json["ShipmentWeight"]),
        packaging: json["Packaging"],
        packagingType: json["PackagingType"],
        packageSequenceNumber: json["PackageSequenceNumber"],
        packageCount: json["PackageCount"],
        creatorSoftwareId: json["CreatorSoftwareId"],
        specialHandlings: SpecialHandlings.fromJson(json["SpecialHandlings"]),
        payments: Payments.fromJson(json["Payments"]),
        shipperAddress: Address.fromJson(json["ShipperAddress"]),
        datesOrTimes: List<DatesOrTime>.from(
            json["DatesOrTimes"].map((x) => DatesOrTime.fromJson(x))),
        destinationAddress: Address.fromJson(json["DestinationAddress"]),
        deliveryAttempts: json["DeliveryAttempts"],
        totalUniqueAddressCountInConsolidation:
            json["TotalUniqueAddressCountInConsolidation"],
        notificationEventsAvailable: List<String>.from(
            json["NotificationEventsAvailable"].map((x) => x)),
        deliveryOptionEligibilityDetails:
            List<DeliveryOptionEligibilityDetail>.from(
                json["DeliveryOptionEligibilityDetails"]
                    .map((x) => DeliveryOptionEligibilityDetail.fromJson(x))),
        events: Events.fromJson(json["Events"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "Notification": notification.toJson(),
        "TrackingNumber": trackingNumber,
        "TrackingNumberUniqueIdentifier": trackingNumberUniqueIdentifier,
        "StatusDetail": statusDetail.toJson(),
        "ServiceCommitMessage": serviceCommitMessage,
        "DestinationServiceArea": destinationServiceArea,
        "CarrierCode": carrierCode,
        "OperatingCompanyOrCarrierDescription":
            operatingCompanyOrCarrierDescription,
        "OtherIdentifiers": otherIdentifiers.toJson(),
        "Service": service.toJson(),
        "PackageWeight": packageWeight.toJson(),
        "PackageDimensions": packageDimensions.toJson(),
        "ShipmentWeight": shipmentWeight.toJson(),
        "Packaging": packaging,
        "PackagingType": packagingType,
        "PackageSequenceNumber": packageSequenceNumber,
        "PackageCount": packageCount,
        "CreatorSoftwareId": creatorSoftwareId,
        "SpecialHandlings": specialHandlings.toJson(),
        "Payments": payments.toJson(),
        "ShipperAddress": shipperAddress.toJson(),
        "DatesOrTimes": List<dynamic>.from(datesOrTimes.map((x) => x.toJson())),
        "DestinationAddress": destinationAddress.toJson(),
        "DeliveryAttempts": deliveryAttempts,
        "TotalUniqueAddressCountInConsolidation":
            totalUniqueAddressCountInConsolidation,
        "NotificationEventsAvailable":
            List<dynamic>.from(notificationEventsAvailable.map((x) => x)),
        "DeliveryOptionEligibilityDetails": List<dynamic>.from(
            deliveryOptionEligibilityDetails.map((x) => x.toJson())),
        "Events": events.toJson(),
        "message": message
      };
}

class DatesOrTime {
  DatesOrTime({
    this.type,
    this.dateOrTimestamp,
  });

  final String type;
  final DateTime dateOrTimestamp;

  factory DatesOrTime.fromJson(Map<String, dynamic> json) => DatesOrTime(
        type: json["Type"],
        dateOrTimestamp: DateTime.parse(json["DateOrTimestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "DateOrTimestamp": dateOrTimestamp.toIso8601String(),
      };
}

class DeliveryOptionEligibilityDetail {
  DeliveryOptionEligibilityDetail({
    this.option,
    this.eligibility,
  });

  final String option;
  final String eligibility;

  factory DeliveryOptionEligibilityDetail.fromJson(Map<String, dynamic> json) =>
      DeliveryOptionEligibilityDetail(
        option: json["Option"],
        eligibility: json["Eligibility"],
      );

  Map<String, dynamic> toJson() => {
        "Option": option,
        "Eligibility": eligibility,
      };
}

class Address {
  Address({
    this.city,
    this.stateOrProvinceCode,
    this.countryCode,
    this.countryName,
    this.residential,
  });

  final String city;
  final String stateOrProvinceCode;
  final String countryCode;
  final String countryName;
  final bool residential;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["City"],
        stateOrProvinceCode: json["StateOrProvinceCode"],
        countryCode: json["CountryCode"],
        countryName: json["CountryName"],
        residential: json["Residential"],
      );

  Map<String, dynamic> toJson() => {
        "City": city,
        "StateOrProvinceCode": stateOrProvinceCode,
        "CountryCode": countryCode,
        "CountryName": countryName,
        "Residential": residential,
      };
}

class Events {
  Events({
    this.timestamp,
    this.eventType,
    this.eventDescription,
    this.address,
    this.arrivalLocation,
  });

  final DateTime timestamp;
  final String eventType;
  final String eventDescription;
  final AddressClass address;
  final String arrivalLocation;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        timestamp: DateTime.parse(json["Timestamp"]),
        eventType: json["EventType"],
        eventDescription: json["EventDescription"],
        address: AddressClass.fromJson(json["Address"]),
        arrivalLocation: json["ArrivalLocation"],
      );

  Map<String, dynamic> toJson() => {
        "Timestamp": timestamp.toIso8601String(),
        "EventType": eventType,
        "EventDescription": eventDescription,
        "Address": address.toJson(),
        "ArrivalLocation": arrivalLocation,
      };
}

class AddressClass {
  AddressClass({
    this.residential,
  });

  final bool residential;

  factory AddressClass.fromJson(Map<String, dynamic> json) => AddressClass(
        residential: json["Residential"],
      );

  Map<String, dynamic> toJson() => {
        "Residential": residential,
      };
}

class Notification {
  Notification({
    this.severity,
    this.source,
    this.code,
    this.message,
    this.localizedMessage,
  });

  final String severity;
  final String source;
  final String code;
  final String message;
  final String localizedMessage;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        severity: json["Severity"],
        source: json["Source"],
        code: json["Code"],
        message: json["Message"],
        localizedMessage: json["LocalizedMessage"],
      );

  Map<String, dynamic> toJson() => {
        "Severity": severity,
        "Source": source,
        "Code": code,
        "Message": message,
        "LocalizedMessage": localizedMessage,
      };
}

class OtherIdentifiers {
  OtherIdentifiers({
    this.packageIdentifier,
  });

  final PackageIdentifier packageIdentifier;

  factory OtherIdentifiers.fromJson(Map<String, dynamic> json) =>
      OtherIdentifiers(
        packageIdentifier:
            PackageIdentifier.fromJson(json["PackageIdentifier"]),
      );

  Map<String, dynamic> toJson() => {
        "PackageIdentifier": packageIdentifier.toJson(),
      };
}

class PackageIdentifier {
  PackageIdentifier({
    this.type,
    this.value,
  });

  final String type;
  final String value;

  factory PackageIdentifier.fromJson(Map<String, dynamic> json) =>
      PackageIdentifier(
        type: json["Type"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "Value": value,
      };
}

class PackageDimensions {
  PackageDimensions({
    this.length,
    this.width,
    this.height,
    this.units,
  });

  final int length;
  final int width;
  final int height;
  final String units;

  factory PackageDimensions.fromJson(Map<String, dynamic> json) =>
      PackageDimensions(
        length: json["Length"],
        width: json["Width"],
        height: json["Height"],
        units: json["Units"],
      );

  Map<String, dynamic> toJson() => {
        "Length": length,
        "Width": width,
        "Height": height,
        "Units": units,
      };
}

class Weight {
  Weight({
    this.units,
    this.value,
  });

  final String units;
  final String value;

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        units: json["Units"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Units": units,
        "Value": value,
      };
}

class Payments {
  Payments({
    this.classification,
    this.type,
    this.description,
  });

  final String classification;
  final String type;
  final String description;

  factory Payments.fromJson(Map<String, dynamic> json) => Payments(
        classification: json["Classification"],
        type: json["Type"],
        description: json["Description"],
      );

  Map<String, dynamic> toJson() => {
        "Classification": classification,
        "Type": type,
        "Description": description,
      };
}

class Service {
  Service({
    this.type,
    this.description,
    this.shortDescription,
  });

  final String type;
  final String description;
  final String shortDescription;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        type: json["Type"],
        description: json["Description"],
        shortDescription: json["ShortDescription"],
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "Description": description,
        "ShortDescription": shortDescription,
      };
}

class SpecialHandlings {
  SpecialHandlings({
    this.type,
    this.description,
    this.paymentType,
  });

  final String type;
  final String description;
  final String paymentType;

  factory SpecialHandlings.fromJson(Map<String, dynamic> json) =>
      SpecialHandlings(
        type: json["Type"],
        description: json["Description"],
        paymentType: json["PaymentType"],
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "Description": description,
        "PaymentType": paymentType,
      };
}

class StatusDetail {
  StatusDetail({
    this.creationTime,
    this.code,
    this.description,
    this.location,
    this.ancillaryDetails,
  });

  final DateTime creationTime;
  final String code;
  final String description;
  final AddressClass location;
  final AncillaryDetails ancillaryDetails;

  factory StatusDetail.fromJson(Map<String, dynamic> json) => StatusDetail(
        creationTime: DateTime.parse(json["CreationTime"]),
        code: json["Code"],
        description: json["Description"],
        location: AddressClass.fromJson(json["Location"]),
        ancillaryDetails: AncillaryDetails.fromJson(json["AncillaryDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "CreationTime": creationTime.toIso8601String(),
        "Code": code,
        "Description": description,
        "Location": location.toJson(),
        "AncillaryDetails": ancillaryDetails.toJson(),
      };
}

class AncillaryDetails {
  AncillaryDetails({
    this.reason,
    this.reasonDescription,
  });

  final String reason;
  final String reasonDescription;

  factory AncillaryDetails.fromJson(Map<String, dynamic> json) =>
      AncillaryDetails(
        reason: json["Reason"],
        reasonDescription: json["ReasonDescription"],
      );

  Map<String, dynamic> toJson() => {
        "Reason": reason,
        "ReasonDescription": reasonDescription,
      };
}
