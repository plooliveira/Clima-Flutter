import 'location.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetWheatherData{
  Location _location = Location();
  String _apiKey = '7d2af0dd521e90fcbb370b5eefa0d014';
  String _apiUrl = 'https://api.openweathermap.org/data/2.5/weather?';
  String _latitude;
  String _longitude;

  Future getLocation () async {
    await _location.getCurrentLocation();
    _latitude = _location.latitude.toString();
    _longitude = _location.longitude.toString();

  }

   Future<dynamic> getWeather() async {
    await getLocation();
     try {

       http.Response response = await http.get('${_apiUrl}lat=${_location
           .latitude}&lon=${_location.longitude}&appid=$_apiKey&units=metric');

       return jsonDecode(response.body);
     } catch(e){
       print(e);
       return null;
     }
   }

  Future<dynamic> getWeatherByCity({String city}) async {
    try {
      print(city);
      http.Response response = await http.get('${_apiUrl}q=$city&appid=$_apiKey&units=metric');
      return jsonDecode(response.body);
    } catch(e){
      print(e);
      return null;
    }
  }

}



