import 'package:flight_search/configs/enums/font_options.dart';
import 'package:flight_search/configs/theme/app_theme_data.dart';
import 'package:flight_search/repository/airport_repository/airport_repository_impl.dart';
import 'package:flight_search/repository/flight_repository/flight_repository_impl.dart';
import 'package:flight_search/view/home/home_view.dart';
import 'package:flight_search/view_model/airport_view_model/airport_view_model.dart';
import 'package:flight_search/view_model/flightSearchViewModel/flight_search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'network/network_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final networkClient = NetworkClient();
    final airportRepository = AirportRepositoryImpl(networkClient);
    final flightRepository = FlightRepositoryImpl(networkClient);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AirportViewModel(repository: airportRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => FlightSearchViewModel(repository: flightRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Flight Search',
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.lightThemeData(FontOptions.montserrat),
        darkTheme: AppThemeData.darkThemeData(FontOptions.montserrat),
        themeMode: ThemeMode.light,
        home: const HomeView(),
      ),
    );
  }
}
