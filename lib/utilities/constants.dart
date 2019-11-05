import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 80.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 15.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 40.0,
);

const Ktextfieldinputdecouration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  alignLabelWithHint: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
    borderSide: BorderSide(color: Colors.green),
  ),
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter the city name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
);
