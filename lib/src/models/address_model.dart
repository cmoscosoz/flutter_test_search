import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Address extends Equatable {
  final String locationId;
  final String? coreLogicTui;
  final String addressText;
  final String? floor;
  final String? buildingName;
  final String? flatNumber;
  final String streetNumber;
  final String? streetNumberSubDescription;
  final String streetName;
  final String streetType;
  final String? streetDirection;
  final String suburb;
  final String? city;
  final String postCode;
  final String? ufbRegion;

  const Address({
    required this.locationId,
    this.coreLogicTui,
    required this.addressText,
    this.floor,
    this.buildingName,
    this.flatNumber,
    required this.streetNumber,
    this.streetNumberSubDescription,
    required this.streetName,
    required this.streetType,
    this.streetDirection,
    required this.suburb,
    this.city,
    required this.postCode,
    this.ufbRegion,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    try {
      return Address(
        locationId: json['locationId'],
        coreLogicTui: json['coreLogicTui'],
        addressText: json['addressText'],
        floor: json['floor'],
        buildingName: json['buildingName'],
        flatNumber: json['flatNumber'],
        streetNumber: json['streetNumber'],
        streetNumberSubDescription: json['streetNumberSubDescription'],
        streetName: json['streetName'],
        streetType: json['streetType'],
        streetDirection: json['streetDirection'],
        suburb: json['suburb'],
        city: json['city'],
        postCode: json['postCode'],
        ufbRegion: json['ufbRegion'],
      );
    } catch (e, stackTrace) {
      debugPrint('Error parsing Address: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'locationId': locationId,
      'coreLogicTui': coreLogicTui,
      'addressText': addressText,
      'floor': floor,
      'buildingName': buildingName,
      'flatNumber': flatNumber,
      'streetNumber': streetNumber,
      'streetNumberSubDescription': streetNumberSubDescription,
      'streetName': streetName,
      'streetType': streetType,
      'streetDirection': streetDirection,
      'suburb': suburb,
      'city': city,
      'postCode': postCode,
      'ufbRegion': ufbRegion,
    };
  }

  @override
  List<Object?> get props => [
        locationId,
        coreLogicTui,
        addressText,
        floor,
        buildingName,
        flatNumber,
        streetNumber,
        streetNumberSubDescription,
        streetName,
        streetType,
        streetDirection,
        suburb,
        city,
        postCode,
        ufbRegion,
      ];
}
