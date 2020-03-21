import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/services/weatherApiConect.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    // Esta função é responsavel por carregar os dados meteriologicos

    var weatherData = await GetWheatherData().getWeather();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => (LocationScreen(locationWeather: weatherData,))));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitThreeBounce(
              color: Colors.white,
              size: 30.0,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Carregando',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
