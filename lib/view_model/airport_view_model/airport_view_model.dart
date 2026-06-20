import 'package:flight_search/model/airport_models.dart';
import 'package:flight_search/repository/airport_repository/airport_repository.dart';
import 'package:flutter/cupertino.dart';

class AirportViewModel extends ChangeNotifier{
  AirportRepository _repository;
  AirportViewModel({required AirportRepository repository}) : _repository = repository;
  List<Airport> _allAirport=[];
  List<Airport> _filteredAirports = [];
  bool _isLoading = false;
  String _errorMessage = '';

  Airport?_departureAirport;
  Airport?_arrivalAirport;
  List<Airport> get airports => _filteredAirports;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  Airport? get departureAirport => _departureAirport;
  Airport? get arrivalAirport => _arrivalAirport;
  //fetch all airport list
  Future<void>fetchAirports()async{
    if(_allAirport.isNotEmpty) {
      return;
    }
    _isLoading=true;
    _errorMessage="";
    notifyListeners();
    try{
      _allAirport=await _repository.getAirport();
      _filteredAirports=List.from(_allAirport);


    }catch(e){
      _errorMessage=e.toString();

    }finally {
      _isLoading=false;
      notifyListeners();
    }
  }
  //search airport form list
  void searchAirports(String query){
    if(query.isEmpty){
      _filteredAirports=List.from(_allAirport);
    }else{
      final lowerQuery=query.toLowerCase();
      _filteredAirports = _allAirport.where((airport) {
        return (airport.airportName?.toLowerCase().contains(lowerQuery) ?? false) ||
            (airport.code?.toLowerCase().contains(lowerQuery) ?? false) ||
            (airport.airportCity?.toLowerCase().contains(lowerQuery) ?? false);
      }).toList();
    }
    notifyListeners();
  }

  void setDepartureAirport(Airport airport) {
    _departureAirport = airport;
    notifyListeners();
  }

  void setArrivalAirport(Airport airport) {
    _arrivalAirport = airport;
    notifyListeners();
  }



}