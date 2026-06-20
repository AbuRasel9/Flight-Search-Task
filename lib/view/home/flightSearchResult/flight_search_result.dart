import 'package:flight_search/configs/extension/context_ext.dart';
import 'package:flight_search/view/home/flightSearchResult/widget/flight_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/airport_view_model/airport_view_model.dart';
import '../../../view_model/flightSearchViewModel/flight_search_view_model.dart';

class FlightResultsScreen extends StatelessWidget {
  const FlightResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final airportVM = Provider.of<AirportViewModel>(context, listen: false);
    final theme = context.theme;
    final depCode = airportVM.departureAirport?.code ?? '';
    final arrCode = airportVM.arrivalAirport?.code ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('$depCode to $arrCode'),
      ),
      body: Consumer<FlightSearchViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
              ),
            );
          }
          //error message
          if (vm.errorMessage.isNotEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error: ${vm.errorMessage}',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          //no flight message
          if (vm.flights.isEmpty) {
            return Center(
              child: Text(
                'No flights found for this route.',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            );
          }
          //all flight list
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: vm.flights.length,
            itemBuilder: (context, index) {
              return FlightCard(flight: vm.flights[index]);
            },
          );
        },
      ),
    );
  }
}
