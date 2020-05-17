import 'dart:async';
import 'package:geolocator/geolocator.dart';

class Location
{

  double glatitude;
  double glongitude;
  Position pos;
  Future <void> getCurrentlocation()
  async{
    try {
      pos = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      glongitude = pos.longitude;
      glatitude=  pos.latitude;

    }
    catch(e)
    {
      print(e);

    }


  }
}