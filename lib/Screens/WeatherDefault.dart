import 'package:flutter/material.dart';
import 'package:weather/Components/UpBar.dart';
import 'package:weather/Components/MainBody.dart';
import 'package:weather/Screens/Location_Screen.dart';
import 'package:weather/Weather_Data.dart';
import 'package:weather/Screens/EScreen404.dart';
class Weather extends StatefulWidget {
  Weather({this.locationWeather});
  final locationWeather;


  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherModel weather=WeatherModel();
  String cityName;
    String mssg;
    int temp;
    IconData icon;
    String img;
    @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return E404();
        },));
//        return;
      }
      double tempd = weatherData['main']['temp'];
      temp = tempd.toInt();
      var condition = weatherData['weather'][0]['id'];
      icon= weather.getWeatherIcon(condition);
      mssg = weather.getMessage(temp);
      img=weather.getImage(temp);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffFF72E1),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: IconButton(
                        icon: Icon(Icons.near_me,color: Colors.white,size: 30.0,),
                      onPressed:() async {
                    var weatherData = await weather.getLocationWeather();
                    updateUI(weatherData);
                    },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:10.0),
                      child: IconButton(
                        icon: Icon(Icons.location_city,color: Colors.white,size: 30.0),
                        onPressed: () async {
                          var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LocationScreen();
                              },
                            ),
                          );
                          if (typedName != null) {
                            var weatherData =
                            await weather.getCityWeather(typedName);
                            updateUI(weatherData);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
              UpBar(temperatue: temp,message: mssg,wicon:icon),
              Expanded(child: DownBar(type:img)),
            ],
          ),
        )
      ),
    );
  }
}
