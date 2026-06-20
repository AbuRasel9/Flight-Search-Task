import '../../model/flight_model.dart';
import '../../network/network_client.dart';

abstract class FlightRepository {
  final NetworkClient networkClient;

  FlightRepository(this.networkClient);
  Future<List<Flight>> searchFlights(String departureCode, String arrivalCode);
}
