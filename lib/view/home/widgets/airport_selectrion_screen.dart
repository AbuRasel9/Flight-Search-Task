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
    final title = widget.isDeparture ? 'Select Departure' : 'Select Arrival';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by city, airport name, or code...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
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
                  return const Center(child: CircularProgressIndicator());
                }

                if (airportProvider.errorMessage.isNotEmpty) {
                  print("------error---${airportProvider.errorMessage}");
                  return Center(
                    child: Text(
                      'Error: ${airportProvider.errorMessage}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                if (airportProvider.airports.isEmpty) {
                  return const Center(child: Text('No airports found.'));
                }

                return ListView.separated(
                  itemCount: airportProvider.airports.length,
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final airport = airportProvider.airports[index];
                    return ListTile(
                      leading: const Icon(Icons.local_airport, color: Colors.blueAccent),
                      title: Text(
                        airport.airportName ?? 'Unknown',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${airport.airportCity ?? ''}, ${airport.airportCountry ?? ''}'),
                      trailing: Text(
                        airport.code ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        if (widget.isDeparture) {
                          airportProvider?.setDepartureAirport(airport);
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
