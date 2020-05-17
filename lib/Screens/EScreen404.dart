import 'package:flutter/material.dart';
class E404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5730A1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('images/error.png'),
              radius: 100.0,
            ),
          ),
          Center(child: Text('ERROR 404',style: TextStyle(fontSize:50.0,color: Colors.white),)),
          Center(child: Text('PAGE NOT FOUND',style: TextStyle(fontSize:30.0,color: Colors.white)))
        ],
      ),
    );
  }
}
