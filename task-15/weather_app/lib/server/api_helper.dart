import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class ApiHelper{
  Future<WeatherModel> getData(String cityName)async{
    String apiKey = "6b9d662e2ed9436b832161045242104";
    final response=await Dio().get('http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$cityName&days=7');
    print("response = $response");
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
}
}