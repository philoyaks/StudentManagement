import 'package:flutter/material.dart';
import 'package:studentmanagement_app/constants.dart';
import 'package:studentmanagement_app/repository/api.dart';
import 'package:studentmanagement_app/screens/showAllStudent.dart';

class PopUpMenu extends StatelessWidget {
  final Api api = Api();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.menu, color: Colors.white),
      onSelected: (val) async {
        if (val == 'ShowAll') {
          var student = await api.getStudents();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowStudentsPage(
                      title: "All Students", students: student)));
        }
        if (val == 'Decending') {
          var student = await api.getStudentsByOrder('Dsc');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowStudentsPage(
                      title: "Decending Order", students: student)));
        }
        if (val == 'Ascending') {
          var student = await api.getStudentsByOrder('Asc');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowStudentsPage(
                      title: "Ascending Order", students: student)));
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'ShowAll',
          child: ListTile(
            leading: Icon(Icons.burst_mode),
            title: Text(
              'Show all Students',
              style: randTextStyle,
            ),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Decending',
          child: ListTile(
            leading: Icon(Icons.queue),
            title: Text(
              'All Student in decending order',
              style: randTextStyle,
            ),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Ascending',
          child: ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'All Student in Asecending order',
              style: randTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
