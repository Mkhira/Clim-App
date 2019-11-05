import 'package:flutter/material.dart';
import 'loading_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'city_screen.dart';

WeatherModel weatherModel = WeatherModel();

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String city;
  var condition;
  var temp;
  var speed;
  var degree;
  String weathericon;
  String weathermassage;

  @override
  void initState() {
    super.initState();
    updateui(widget.locationweather);
  }

  void updateui(dynamic WeatherDAta) {
    setState(() {
      if (WeatherDAta == null) {
        temp = 0;
        weathericon = 'EROR';
        weathermassage = 'Unable to get weather data';
        city = '';
        speed = '!!!';
        degree = '!!';
        return;
      }
      temp = WeatherDAta['main']['temp'];
      speed = WeatherDAta['wind']['speed'];
      degree = WeatherDAta['wind']['deg'];
      condition = WeatherDAta['weather'][0]['id'];
      weathericon = weatherModel.getWeatherIcon(condition);
      weathermassage = weatherModel.getMessage(temp.toInt());
      city = WeatherDAta['name'];
      print(city);
      print(temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(
                        () async {
                          var WeatherDAta =
                              await WeatherModel().getLocationWeather();
                          updateui(WeatherDAta);
                        },
                      );
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 30.0,
                    ),
                  ),
                  Text(
                    '     Chose your city >>',
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(
                        () async {
                          var city = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CityScreen();
                              },
                            ),
                          );
                          if (city != null) {
                            print(city);
                            var weatherdata =
                                await WeatherModel().getcityweather(city);
                            updateui(weatherdata);
                          }
                        },
                      );
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    ' ${temp.toInt()}°',
                    style: kTempTextStyle,
                  ),
                  Text(
                    weathericon,
                    style: kConditionTextStyle,
                  ),
                ],
              ),
              Text(
                weathermassage + ' in ' + city,
                textAlign: TextAlign.center,
                style: kMessageTextStyle,
              ),
              Text(
                '  Wind Degree: ' + degree.toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '  Wind Speed: ' + speed.toString() + 'm/s',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
