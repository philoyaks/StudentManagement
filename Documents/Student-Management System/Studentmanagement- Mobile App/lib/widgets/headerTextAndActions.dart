import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget headerTitleAction({press, theme, txt}) {
  return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          padding: EdgeInsets.all(0),
          constraints: BoxConstraints(),
          onPressed: press,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          ),
        ),
        Spacer(),
        Center(
            child: Text(
          txt,
          style: theme.textTheme.headline2,
        )),
        Spacer()
      ]);
}
