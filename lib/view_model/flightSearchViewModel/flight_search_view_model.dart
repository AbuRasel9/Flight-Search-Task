import 'package:flutter/foundation.dart';
import '../../model/flight_model.dart';
import '../../repository/flight_repository/flight_repository.dart';

class FlightSearchViewModel extends ChangeNotifier {
  final FlightRepository _repository;

  FlightSearchViewModel({required FlightRepository repository}) : _repository = repository;

  List<Flight> _flights = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Flight> get flights => _flights;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> searchFlights(String departureCode, String arrivalCode) async {
    _isLoading = true;
    _errorMessage = '';
    _flights = [];
    notifyListeners();

    try {
      _flights = await _repository.searchFlights(departureCode, arrivalCode);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
