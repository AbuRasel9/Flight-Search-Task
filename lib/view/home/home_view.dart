import 'package:flight_search/configs/extension/context_ext.dart';
import 'package:flight_search/view/home/widgets/airport_selecter.dart';
import 'package:flight_search/view/home/widgets/airport_selectrion_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/airport_view_model/airport_view_model.dart';
import '../../view_model/flightSearchViewModel/flight_search_view_model.dart';
import 'flightSearchResult/flight_search_result.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final airportViewModel = Provider.of<AirportViewModel>(context);
    final theme = context.theme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flight Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AirportSelector(
              label: 'Departure Airport',
              airportName: airportViewModel.departureAirport?.airportName,
              airportCode: airportViewModel.departureAirport?.code,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AirportSelectionScreen(
                      isDeparture: true,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            AirportSelector(
              label: 'Arrival Airport',
              airportName: airportViewModel.arrivalAirport?.airportName,
              airportCode: airportViewModel.arrivalAirport?.code,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AirportSelectionScreen(
                      isDeparture: false,
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: (airportViewModel.departureAirport != null &&
                      airportViewModel.arrivalAirport != null)
                  ? () {
                      final flightSearchProvider =
                          Provider.of<FlightSearchViewModel>(context,
                              listen: false);
                      flightSearchProvider.searchFlights(
                        airportViewModel.departureAirport!.code ?? '',
                        airportViewModel.arrivalAirport!.code ?? '',
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FlightResultsScreen(),
                        ),
                      );
                    }
                  : null,
              child: Text(
                'Search Flights',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
