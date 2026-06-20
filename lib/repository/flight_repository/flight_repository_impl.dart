import 'package:flight_search/configs/app_url.dart';
import 'package:flight_search/repository/flight_repository/flight_repository.dart';

import '../../model/flight_model.dart';

class FlightRepositoryImpl extends FlightRepository{
  FlightRepositoryImpl(super.networkClient);


  @override
  Future<List<Flight>> searchFlights(String departureCode, String arrivalCode) async {
    final response = await networkClient.get(AppUrl.flightSearchUrl);

    final repriceResponse = AirBookingRepriceResponse.fromJson(response);

    List<Flight> bestFlights = repriceResponse.bestFlights ?? [];
    List<Flight> otherFlights = repriceResponse.otherFlights ?? [];

    return [...bestFlights, ...otherFlights];
  }



}