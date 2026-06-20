// To parse this JSON data, do
//
//     final airBookingRepriceResponse = airBookingRepriceResponseFromJson(jsonString);

import 'dart:convert';

AirBookingRepriceResponse airBookingRepriceResponseFromJson(String str) => AirBookingRepriceResponse.fromJson(json.decode(str));

String airBookingRepriceResponseToJson(AirBookingRepriceResponse data) => json.encode(data.toJson());

class AirBookingRepriceResponse {
  SearchMetadata? searchMetadata;
  SearchParameters? searchParameters;
  List<Flight>? bestFlights;
  List<Flight>? otherFlights;
  PriceInsights? priceInsights;
  List<AirportElement>? airports;

  AirBookingRepriceResponse({
    this.searchMetadata,
    this.searchParameters,
    this.bestFlights,
    this.otherFlights,
    this.priceInsights,
    this.airports,
  });

  factory AirBookingRepriceResponse.fromJson(Map<String, dynamic> json) => AirBookingRepriceResponse(
    searchMetadata: json["search_metadata"] == null ? null : SearchMetadata.fromJson(json["search_metadata"]),
    searchParameters: json["search_parameters"] == null ? null : SearchParameters.fromJson(json["search_parameters"]),
    bestFlights: json["best_flights"] == null ? [] : List<Flight>.from(json["best_flights"]!.map((x) => Flight.fromJson(x))),
    otherFlights: json["other_flights"] == null ? [] : List<Flight>.from(json["other_flights"]!.map((x) => Flight.fromJson(x))),
    priceInsights: json["price_insights"] == null ? null : PriceInsights.fromJson(json["price_insights"]),
    airports: json["airports"] == null ? [] : List<AirportElement>.from(json["airports"]!.map((x) => AirportElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "search_metadata": searchMetadata?.toJson(),
    "search_parameters": searchParameters?.toJson(),
    "best_flights": bestFlights == null ? [] : List<dynamic>.from(bestFlights!.map((x) => x.toJson())),
    "other_flights": otherFlights == null ? [] : List<dynamic>.from(otherFlights!.map((x) => x.toJson())),
    "price_insights": priceInsights?.toJson(),
    "airports": airports == null ? [] : List<dynamic>.from(airports!.map((x) => x.toJson())),
  };
}

class AirportElement {
  List<Arrival>? departure;
  List<Arrival>? arrival;

  AirportElement({
    this.departure,
    this.arrival,
  });

  factory AirportElement.fromJson(Map<String, dynamic> json) => AirportElement(
    departure: json["departure"] == null ? [] : List<Arrival>.from(json["departure"]!.map((x) => Arrival.fromJson(x))),
    arrival: json["arrival"] == null ? [] : List<Arrival>.from(json["arrival"]!.map((x) => Arrival.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "departure": departure == null ? [] : List<dynamic>.from(departure!.map((x) => x.toJson())),
    "arrival": arrival == null ? [] : List<dynamic>.from(arrival!.map((x) => x.toJson())),
  };
}

class Arrival {
  ArrivalAirport? airport;
  String? city;
  String? country;
  String? countryCode;
  String? image;
  String? thumbnail;

  Arrival({
    this.airport,
    this.city,
    this.country,
    this.countryCode,
    this.image,
    this.thumbnail,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
    airport: json["airport"] == null ? null : ArrivalAirport.fromJson(json["airport"]),
    city: json["city"],
    country: json["country"],
    countryCode: json["country_code"],
    image: json["image"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "airport": airport?.toJson(),
    "city": city,
    "country": country,
    "country_code": countryCode,
    "image": image,
    "thumbnail": thumbnail,
  };
}

class ArrivalAirport {
  String? id;
  String? name;

  ArrivalAirport({
    this.id,
    this.name,
  });

  factory ArrivalAirport.fromJson(Map<String, dynamic> json) => ArrivalAirport(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Flight {
  List<FlightElement>? flights;
  int? totalDuration;
  CarbonEmissions? carbonEmissions;
  int? price;
  String? type;
  String? airlineLogo;
  String? bookingToken;
  List<Layover>? layovers;

  Flight({
    this.flights,
    this.totalDuration,
    this.carbonEmissions,
    this.price,
    this.type,
    this.airlineLogo,
    this.bookingToken,
    this.layovers,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
    flights: json["flights"] == null ? [] : List<FlightElement>.from(json["flights"]!.map((x) => FlightElement.fromJson(x))),
    totalDuration: json["total_duration"],
    carbonEmissions: json["carbon_emissions"] == null ? null : CarbonEmissions.fromJson(json["carbon_emissions"]),
    price: json["price"],
    type: json["type"],
    airlineLogo: json["airline_logo"],
    bookingToken: json["booking_token"],
    layovers: json["layovers"] == null ? [] : List<Layover>.from(json["layovers"]!.map((x) => Layover.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "flights": flights == null ? [] : List<dynamic>.from(flights!.map((x) => x.toJson())),
    "total_duration": totalDuration,
    "carbon_emissions": carbonEmissions?.toJson(),
    "price": price,
    "type": type,
    "airline_logo": airlineLogo,
    "booking_token": bookingToken,
    "layovers": layovers == null ? [] : List<dynamic>.from(layovers!.map((x) => x.toJson())),
  };
}

class CarbonEmissions {
  int? thisFlight;
  int? typicalForThisRoute;
  int? differencePercent;

  CarbonEmissions({
    this.thisFlight,
    this.typicalForThisRoute,
    this.differencePercent,
  });

  factory CarbonEmissions.fromJson(Map<String, dynamic> json) => CarbonEmissions(
    thisFlight: json["this_flight"],
    typicalForThisRoute: json["typical_for_this_route"],
    differencePercent: json["difference_percent"],
  );

  Map<String, dynamic> toJson() => {
    "this_flight": thisFlight,
    "typical_for_this_route": typicalForThisRoute,
    "difference_percent": differencePercent,
  };
}

class FlightElement {
  FlightAirport? departureAirport;
  FlightAirport? arrivalAirport;
  int? duration;
  String? airplane;
  String? airline;
  String? airlineLogo;
  String? travelClass;
  String? flightNumber;
  String? legroom;
  List<String>? extensions;
  bool? overnight;

  FlightElement({
    this.departureAirport,
    this.arrivalAirport,
    this.duration,
    this.airplane,
    this.airline,
    this.airlineLogo,
    this.travelClass,
    this.flightNumber,
    this.legroom,
    this.extensions,
    this.overnight,
  });

  factory FlightElement.fromJson(Map<String, dynamic> json) => FlightElement(
    departureAirport: json["departure_airport"] == null ? null : FlightAirport.fromJson(json["departure_airport"]),
    arrivalAirport: json["arrival_airport"] == null ? null : FlightAirport.fromJson(json["arrival_airport"]),
    duration: json["duration"],
    airplane: json["airplane"],
    airline: json["airline"],
    airlineLogo: json["airline_logo"],
    travelClass: json["travel_class"],
    flightNumber: json["flight_number"],
    legroom: json["legroom"],
    extensions: json["extensions"] == null ? [] : List<String>.from(json["extensions"]!.map((x) => x)),
    overnight: json["overnight"],
  );

  Map<String, dynamic> toJson() => {
    "departure_airport": departureAirport?.toJson(),
    "arrival_airport": arrivalAirport?.toJson(),
    "duration": duration,
    "airplane": airplane,
    "airline": airline,
    "airline_logo": airlineLogo,
    "travel_class": travelClass,
    "flight_number": flightNumber,
    "legroom": legroom,
    "extensions": extensions == null ? [] : List<dynamic>.from(extensions!.map((x) => x)),
    "overnight": overnight,
  };
}

class FlightAirport {
  String? name;
  String? id;
  String? time;

  FlightAirport({
    this.name,
    this.id,
    this.time,
  });

  factory FlightAirport.fromJson(Map<String, dynamic> json) => FlightAirport(
    name: json["name"],
    id: json["id"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "time": time,
  };
}

class Layover {
  int? duration;
  String? name;
  String? id;

  Layover({
    this.duration,
    this.name,
    this.id,
  });

  factory Layover.fromJson(Map<String, dynamic> json) => Layover(
    duration: json["duration"],
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "duration": duration,
    "name": name,
    "id": id,
  };
}

class PriceInsights {
  int? lowestPrice;
  String? priceLevel;
  List<int>? typicalPriceRange;
  List<List<int>>? priceHistory;

  PriceInsights({
    this.lowestPrice,
    this.priceLevel,
    this.typicalPriceRange,
    this.priceHistory,
  });

  factory PriceInsights.fromJson(Map<String, dynamic> json) => PriceInsights(
    lowestPrice: json["lowest_price"],
    priceLevel: json["price_level"],
    typicalPriceRange: json["typical_price_range"] == null ? [] : List<int>.from(json["typical_price_range"]!.map((x) => x)),
    priceHistory: json["price_history"] == null ? [] : List<List<int>>.from(json["price_history"]!.map((x) => List<int>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "lowest_price": lowestPrice,
    "price_level": priceLevel,
    "typical_price_range": typicalPriceRange == null ? [] : List<dynamic>.from(typicalPriceRange!.map((x) => x)),
    "price_history": priceHistory == null ? [] : List<dynamic>.from(priceHistory!.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}

class SearchMetadata {
  String? id;
  String? status;
  String? jsonEndpoint;
  String? createdAt;
  String? processedAt;
  String? googleFlightsUrl;
  String? rawHtmlFile;
  String? prettifyHtmlFile;
  double? totalTimeTaken;

  SearchMetadata({
    this.id,
    this.status,
    this.jsonEndpoint,
    this.createdAt,
    this.processedAt,
    this.googleFlightsUrl,
    this.rawHtmlFile,
    this.prettifyHtmlFile,
    this.totalTimeTaken,
  });

  factory SearchMetadata.fromJson(Map<String, dynamic> json) => SearchMetadata(
    id: json["id"],
    status: json["status"],
    jsonEndpoint: json["json_endpoint"],
    createdAt: json["created_at"],
    processedAt: json["processed_at"],
    googleFlightsUrl: json["google_flights_url"],
    rawHtmlFile: json["raw_html_file"],
    prettifyHtmlFile: json["prettify_html_file"],
    totalTimeTaken: json["total_time_taken"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "json_endpoint": jsonEndpoint,
    "created_at": createdAt,
    "processed_at": processedAt,
    "google_flights_url": googleFlightsUrl,
    "raw_html_file": rawHtmlFile,
    "prettify_html_file": prettifyHtmlFile,
    "total_time_taken": totalTimeTaken,
  };
}

class SearchParameters {
  String? engine;
  String? hl;
  String? gl;
  String? type;
  String? departureId;
  String? arrivalId;
  DateTime? outboundDate;
  String? currency;

  SearchParameters({
    this.engine,
    this.hl,
    this.gl,
    this.type,
    this.departureId,
    this.arrivalId,
    this.outboundDate,
    this.currency,
  });

  factory SearchParameters.fromJson(Map<String, dynamic> json) => SearchParameters(
    engine: json["engine"],
    hl: json["hl"],
    gl: json["gl"],
    type: json["type"],
    departureId: json["departure_id"],
    arrivalId: json["arrival_id"],
    outboundDate: json["outbound_date"] == null ? null : DateTime.parse(json["outbound_date"]),
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "engine": engine,
    "hl": hl,
    "gl": gl,
    "type": type,
    "departure_id": departureId,
    "arrival_id": arrivalId,
    "outbound_date": "${outboundDate?.year.toString().padLeft(4, '0')}-${outboundDate?.month.toString().padLeft(2, '0')}-${outboundDate?.day.toString().padLeft(2, '0')}",
    "currency": currency,
  };
}
