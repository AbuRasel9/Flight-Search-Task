import 'package:flight_search/configs/extension/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/airport_view_model/airport_view_model.dart';

class AirportSelectionScreen extends StatefulWidget {
  final bool isDeparture;

  const AirportSelectionScreen({super.key, required this.isDeparture});

  @override
  _AirportSelectionScreenState createState() => _AirportSelectionScreenState();
}

class _AirportSelectionScreenState extends State<AirportSelectionScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = Provider.of<AirportViewModel>(context, listen: false);
      vm.fetchAirports();
      // Reset search on open
      vm.searchAirports('');
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final title = widget.isDeparture ? 'Select Departure' : 'Select Arrival';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              style: theme.textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: 'Search by city, airport name, or code...',
                prefixIcon: Icon(Icons.search, color: theme.colorScheme.primary),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: (value) {
                Provider.of<AirportViewModel>(context, listen: false)
                    .searchAirports(value);
              },
            ),
          ),
          Expanded(
            child: Consumer<AirportViewModel>(
              builder: (context, airportProvider, child) {
                if (airportProvider.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.primary,
                    ),
                  );
                }

                if (airportProvider.errorMessage.isNotEmpty) {
                  return Center(
                    child: Text(
                      'Error: ${airportProvider.errorMessage}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                  );
                }

                if (airportProvider.airports.isEmpty) {
                  return Center(
                    child: Text(
                      'No airports found.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  itemCount: airportProvider.airports.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: theme.colorScheme.outline.withOpacity(0.1),
                  ),
                  itemBuilder: (context, index) {
                    final airport = airportProvider.airports[index];
                    return ListTile(
                      leading: Icon(
                        Icons.local_airport,
                        color: theme.colorScheme.primary,
                      ),
                      title: Text(
                        airport.airportName ?? 'Unknown',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      subtitle: Text(
                        '${airport.airportCity ?? ''}, ${airport.airportCountry ?? ''}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      trailing: Text(
                        airport.code ?? '',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      onTap: () {
                        if (widget.isDeparture) {
                          airportProvider.setDepartureAirport(airport);
                        } else {
                          airportProvider.setArrivalAirport(airport);
                        }
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
