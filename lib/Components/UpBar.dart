import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/Screens/WeatherDefault.dart';
import 'package:weather/Weather_Data.dart';
import 'package:weather_icons/weather_icons.dart';
//import 'package:weather_icons/weather_icons.dart';
class UpBar extends StatelessWidget {
  UpBar({this.temperatue,this.wicon,this.message});
  final int temperatue;
  final IconData wicon;
  final String message;

  Weather weat=Weather();
  WeatherModel weather=WeatherModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
//              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.0)),
            color: Color(0xffFF72E1)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text(message,style: TextStyle(fontSize: 30.0,color: Colors.white,fontStyle: FontStyle.italic)),
                  )),
                  Expanded(child: Icon(wicon,size: 50.0,color: Colors.white,))
                ],
              ),
            ),
            Center(
              child: Text('$temperatue°',style: TextStyle(fontSize: 60.0,color: Colors.white,fontWeight: FontWeight.w300),),
            ),

          ],
        ),
      ),
    );
  }
//
//  @override
//  Size get preferredSize => const Size.fromHeight(250.0);
}












