import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/screens/search_page.dart';
import 'package:weather_app/server/api_helper.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      home: SearchPage(),

    );
  }
}
//      base url =  http://api.weatherapi.com/
//      v1/forecast.json?key=6b9d662e2ed9436b832161045242104&q=cairo
//      http://api.weatherapi.com/v1/forecast.json?key=6b9d662e2ed9436b832161045242104&q=cairo