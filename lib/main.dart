import 'package:flight_search/configs/enums/font_options.dart';
import 'package:flight_search/configs/theme/app_theme_data.dart';
import 'package:flight_search/view/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Search',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData(FontOptions.montserrat),
      darkTheme: AppThemeData.darkThemeData(FontOptions.montserrat),
      themeMode: ThemeMode.light,
      home: HomeView()
    );
  }
}
