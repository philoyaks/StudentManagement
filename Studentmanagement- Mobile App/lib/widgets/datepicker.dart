


//   import 'package:flutter/material.dart';

// DateTime _fromDate = DateTime.now();

//   Future<void> _showDatePicker(BuildContext context) async {
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: _fromDate,
//       firstDate: DateTime(2020, 3),
//       lastDate: DateTime(2100),
//       builder: (context, child) => Theme(
//           data: ThemeData.light().copyWith(
//               primaryColor: Colors.brown,
//               accentColor: Colors.brown,
//               colorScheme: ColorScheme.light(primary: Colors.brown),
//               buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)),
//           child: child),
//     );
//     if (picked != null && picked != _fromDate) {
//       setState(() {
//         _fromDate = picked;
//       });
//     }
//   }