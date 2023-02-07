import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class Location  {
  var latitude;
  var longitude;
  Future getlocation() async {
    bool service ;
    LocationPermission per ;
    service = await Geolocator.isLocationServiceEnabled();
    if (service == false ){
      print("Location isNot Enable");
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied){
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.always){
        getTruePosition();
      }
    }
    print("vvvvvvvvvvvvvvv");
  }

  Future getTruePosition () async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    latitude = position.latitude;
    longitude = position.longitude;


  }

    }



