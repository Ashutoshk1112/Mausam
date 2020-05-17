import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
               decoration: InputDecoration(
                 hintText: 'Enter The Location'
               ),
                onChanged: (value){
                 cityName=value;
                },
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed:(){Navigator.pop(context, cityName);} ,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Location.gif')
                )
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          )
        ],
      ),
    );
  }
}

    