import 'package:flutter/material.dart';

import '../constants.dart';

Widget useICon(
        {required String txt, required press, bool deletebutton = false}) =>
    ElevatedButton(
      onPressed: press,
      child: Text(
        txt,
        style: deletebutton ? TextStyle(fontSize: 16) : iconTextstyle,
      ),
      style: ElevatedButton.styleFrom(
          primary: deletebutton ? kDeleteIconColor : kIconDefaultColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
