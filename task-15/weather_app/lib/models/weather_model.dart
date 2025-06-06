import 'package:flutter/foundation.dart';

class WeatherModel {
  final String cityName;
  final double tempC;
  final String state;
  final String mainIcon;
  final List<ForecastDay> foreCastDay;

  WeatherModel({
    required this.cityName,
    required this.tempC,
    required this.state,
    required this.mainIcon,
    required this.foreCastDay,
  });

  factory WeatherModel.fromJson(Map<String, dynamic>json){
    return WeatherModel(
      cityName: json['location']['name'],
      tempC: json['current']['temp_c'],
      state: json['current']['condition']['text'],
      mainIcon: json['current']['condition']['icon'],
      foreCastDay: (json['forecast']['forecastday'] as List).map((e)=> ForecastDay.fromJson(e)).toList());
  }
}

class ForecastDay {
  final String date;
  final double avgT;
  final String listIcon;
  final List<Hour> hour;


  ForecastDay(
      {required this.date,
        required this.avgT,
        required this.listIcon,
        required this.hour,
      });
  factory ForecastDay.fromJson(Map<String,dynamic>json){
    return ForecastDay(
        date: json['date'],
        avgT: json['day']['avgtemp_c'],
        listIcon: json['day']['condition']['icon'],
      hour: (json['hour'] as List).map((e)=> Hour.fromJson(e)).toList());
  }
}



class Hour {
  final String time;
  final double temp;
  final String icon;

  Hour(
      {required this.time,
        required this.temp,
        required this.icon
      });
  factory Hour.fromJson(Map<String,dynamic>json){
    return Hour(
        time: json['time'],
        temp: json['temp_c'],
        icon: json['condition']['icon']
    );
  }
}
