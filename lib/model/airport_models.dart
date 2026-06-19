// To parse this JSON data, do
//
//     final airportResponse = airportResponseFromJson(jsonString);

import 'dart:convert';

AirportResponse airportResponseFromJson(String str) => AirportResponse.fromJson(json.decode(str));

String airportResponseToJson(AirportResponse data) => json.encode(data.toJson());

class AirportResponse {
  String? jsonFileType;
  int? totalData;
  Map<String, Airport>? data;

  AirportResponse({
    this.jsonFileType,
    this.totalData,
    this.data,
  });

  factory AirportResponse.fromJson(Map<String, dynamic> json) => AirportResponse(
    jsonFileType: json["json_file_type"],
    totalData: json["total_data"],
    data: json["data"] != null ? Map.from(json["data"]!).map((k, v) => MapEntry<String, Airport>(k, Airport.fromJson(v))) : null,
  );

  Map<String, dynamic> toJson() => {
    "json_file_type": jsonFileType,
    "total_data": totalData,
    "data": data != null ? Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())) : null,
  };
}

class Airport {
  String? code;
  String? airportName;
  String? airportCity;
  String? airportCityCode;
  String? airportCountry;
  String? airportCountryCode;
  String? airportTimezone;

  Airport({
    this.code,
    this.airportName,
    this.airportCity,
    this.airportCityCode,
    this.airportCountry,
    this.airportCountryCode,
    this.airportTimezone,
  });

  factory Airport.fromJson(Map<String, dynamic> json) => Airport(
    code: json["code"],
    airportName: json["airport_name"],
    airportCity: json["airport_city"],
    airportCityCode: json["airport_city_code"],
    airportCountry: json["airport_country"],
    airportCountryCode: json["airport_country_code"],
    airportTimezone: json["airport_timezone"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "airport_name": airportName,
    "airport_city": airportCity,
    "airport_city_code": airportCityCode,
    "airport_country": airportCountry,
    "airport_country_code": airportCountryCode,
    "airport_timezone": airportTimezone,
  };

  // Override equality and hashCode so we can compare selected airports
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Airport &&
              runtimeType == other.runtimeType &&
              code == other.code;

  @override
  int get hashCode => code.hashCode;
}
