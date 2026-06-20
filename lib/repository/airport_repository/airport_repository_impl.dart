import 'package:flight_search/configs/app_url.dart';
import 'package:flight_search/model/airport_models.dart';
import 'package:flight_search/repository/airport_repository/airport_repository.dart';

class AirportRepositoryImpl extends AirportRepository {
  AirportRepositoryImpl(super.networkClient);

  @override
  Future<List<Airport>> getAirport() async {
    final response = await networkClient.get(AppUrl.airportListUrl);
    final Map<String, dynamic> data = response['data'];
    return data.values.map((e) => Airport.fromJson(e)).toList();
  }
}
