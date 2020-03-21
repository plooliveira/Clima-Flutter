import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weatherApiConect.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  const LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  String city;
  int weatherId;
  int temp;
  WeatherModel weatherConditions = WeatherModel();
  String weatherIcon;
  String weatherMessage;

  @override
  void initState() {
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {

      if (weatherData == null || weatherData['cod'] == '404'){
        city = '';
        weatherIcon = 'Error';
        temp = 0;
        weatherMessage = 'Unable to get weather data';
        return weatherData;
      }
      city = weatherData['name'];
      weatherId = weatherData['weather'][0]['id'];
      temp = weatherData['main']['temp'].toInt();
      weatherIcon = weatherConditions.getWeatherIcon(weatherId);
      weatherMessage = weatherConditions.getMessage(temp);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/backgroundCity.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await GetWheatherData().getWeather();
                      updateUi(weatherData);

                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var citySelected = await Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen()));
                      if (citySelected != null){
                        var weatherData = await GetWheatherData().getWeatherByCity(city: citySelected);
                        updateUi(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      temp.toStringAsFixed(0) + 'º',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $city!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
