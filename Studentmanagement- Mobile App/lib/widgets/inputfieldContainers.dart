import 'package:flutter/material.dart';
import '../constants.dart';

Widget classStudentNames(String txt, int index, var theme) {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: kpadding * 2),
      child: Text(
        '$index. $txt',
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.subtitle2,
      ),
    ),
  );
}

Widget studentinputDetails(
    {required String fullname,
    required String address,
    required String birthday,
    required String datecreated,
    required var theme}) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FULLNAME:$fullname',
          style: theme.textTheme.subtitle2,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'ADDRESS:$address',
          style: theme.textTheme.subtitle2,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'BIRTHDAY:$birthday ',
          style: theme.textTheme.subtitle2,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'DATE CREATED:${datecreated.toUpperCase()} ',
          style: theme.textTheme.subtitle2,
        ),
      ],
    ),
  );
}
