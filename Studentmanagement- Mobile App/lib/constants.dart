import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var kpadding = 20.0;

var kScreenDefaultDecoration = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [Color(0xff804a4a), Color(0xe3a55858), Color(0xc9c76565)],
));

var kContainerDisplayColor = Color(0x82956262);

var kIconDefaultColor = Color(0xfff9dfe2);

var iconTextstyle = TextStyle(
  color: Color(0xff6d0707),
  fontSize: 16,
);

ThemeData customThemData = ThemeData(
    fontFamily: "Varela Round",
    textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white, fontSize: 32),
        headline2: TextStyle(color: Colors.white, fontSize: 24),
        subtitle1: TextStyle(color: Colors.white, fontSize: 16),
        subtitle2: TextStyle(color: Colors.white, fontSize: 20),

        /// Headline 3 is for fonts ontop of input fields
        headline3: TextStyle(color: Colors.white, fontSize: 16),

        /// Buttons is for fonts of the
        button: TextStyle(color: Colors.white, fontSize: 15)));

var kDeleteIconColor = Color(0xffbf1f32);

const randTextStyle = TextStyle(fontSize: 16, color: Colors.black);

convertDateStringToDate(String txt) {
  return DateFormat("dd-MM-yyyy").parse(txt);
}

convertStringToDatePost(String txt) {
  var result = convertDateStringToDate(txt);
  var x = DateFormat("yyyy-MM-dd").format(result).toString();
  return x;
}

var kInputBoxDecoration = InputDecoration(
  errorStyle: TextStyle(color: Colors.red[800]),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.brown,
        width: 2,
      )),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.white10,
        width: 1,
      )),
  filled: true,
  fillColor: Colors.white10,
);

var kInputBoxDecoration2 = InputDecoration(
  prefixIcon: Icon(Icons.search),
  hintText: 'Search',
  fillColor: Color(0XF1F1F1),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: Colors.black12,
        width: 2,
      )),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: Colors.black,
        width: 1,
      )),
  filled: true,
);

var kInputBoxDecoration3 = InputDecoration(
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 2,
      )),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1,
      )),
  filled: true,
  fillColor: Colors.white,
);
