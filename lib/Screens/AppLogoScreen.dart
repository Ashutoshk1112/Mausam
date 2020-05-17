//import 'dart:async';
//import 'package:weather/Location.dart';
import 'package:flutter/material.dart';
import 'package:weather/Screens/WeatherDefault.dart';
import 'package:weather_icons/weather_icons.dart';
//import 'package:weather/Ntwork.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Weather_Data.dart';
//import 'package:weather/Screens/WeatherDefault.dart';
//import 'package:weather/main.dart';


const key='973406ca8e606717178d9b934ec56f20';

class ALS extends StatefulWidget {
  @override
  _ALSState createState() => _ALSState();
}

class _ALSState extends State<ALS> {

  @override
  void initState(){
    super.initState();
    getLocationData();
//    if(res.statusCode==404)
//    Timer(Duration(milliseconds: 5000),(){ Navigator.pushNamed(context, '/e404');} );
//    else
//    Timer(Duration(milliseconds: 5000),(){ Navigator.pushNamed(context, '/loca');} );
  }

void getLocationData() async  {
  var weatherData = await WeatherModel().getLocationWeather();
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Weather(
      locationWeather: weatherData,
    );
  }));
}
//  Location l = new Location();
//  await l.getCurrentlocation();
//  Ntwrk n = Ntwrk('https://api.openweathermap.org/data/2.5/weather?lat=${l.glatitude}&lon=${l.glongitude}&appid=$key');
//  var wdata = n.getData();
////  temperature = n.temp;
////    print(wdata);
////  print(temperature);

@override
  Widget build(BuildContext context) {


      return MaterialApp(
    home: Scaffold(
          backgroundColor: Colors.blue.withOpacity(0.8),
          body:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(child: Icon(WeatherIcons.day_rain_wind,size: 80.0,color: Colors.black,),),
              SpinKitFadingFour(
                color: Colors.black,
                size: 100.0,
              ),
              Center(child: Text('MAUSAM',style: TextStyle(fontSize: 80.0,color: Colors.black),)),
//             TextField(
//              decoration:InputDecoration(
//                border:InputBorder.none,
//                hintText: 'CITY NAME',
//                focusColor: Colors.blueAccent.shade700,
//                fillColor: Colors.red,
//                hoverColor: Colors.yellow
//              ) ,
//             )
            ],
          )
      ),
    );
  }
}



