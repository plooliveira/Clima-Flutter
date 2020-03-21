import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
  color: Colors.black87
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextInputdecoration = InputDecoration(
  prefixIcon: Icon(
    Icons.location_city,
    color: Colors.black54,
    size: 30.0,
  ),
  contentPadding: EdgeInsets.all(15.0),
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(40.0)),
    borderSide: BorderSide.none,
  ),
  hintText: 'New York or Salvador,BR',
  hintStyle: TextStyle(color: Colors.black26, fontSize: 18.0),
);