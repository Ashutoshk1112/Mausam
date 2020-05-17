import 'package:flutter/material.dart';
import 'package:weather/Weather_Data.dart';

class DownBar extends StatelessWidget {
  DownBar({this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
          image: DecorationImage(image:AssetImage('images/$type.jpg'),fit: BoxFit.cover)),
    );
  }
}
