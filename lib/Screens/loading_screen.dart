import '../services/weather.dart';
import 'location_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
const APIkey = "91a85e04dc5999f49c15d9a3aea8b77b";

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double longitude;
  late double latitude;

  @override
  void initState() {
    getPostionData();
    getData();
    super.initState();
  }

 void  getPostionData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return LocationScreen(locationWeather: weatherData,);
   }));


  }

  void getData() async {}

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: SpinKitDoubleBounce(
         size: 30,
         color: Colors.lightBlue,
       ),



          ),
    );
  }
}
