import 'package:flight_search/model/airport_models.dart';
import 'package:flight_search/network/network_client.dart';

abstract class AirportRepository {
  final NetworkClient networkClient;
  AirportRepository(this.networkClient);
  Future<List<Airport>> getAirport();
}
