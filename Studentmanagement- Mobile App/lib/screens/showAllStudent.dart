import 'package:flutter/material.dart';
import 'package:studentmanagement_app/models/students.dart';
import 'package:studentmanagement_app/widgets/headerTextAndActions.dart';
import 'package:studentmanagement_app/widgets/studentBoxContainers.dart';

import '../constants.dart';

class ShowStudentsPage extends StatefulWidget {
  final String title;
  final List<Students> students;
  const ShowStudentsPage(
      {Key? key, required this.title, required this.students})
      : super(key: key);

  @override
  _ShowStudentsPageState createState() => _ShowStudentsPageState();
}

class _ShowStudentsPageState extends State<ShowStudentsPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Container(
          decoration: kScreenDefaultDecoration,
          padding: EdgeInsets.symmetric(horizontal: kpadding),
          child: Column(
            children: [
              SizedBox(
                height: kpadding * 1.5,
              ),
              headerTitleAction(
                  press: () {
                    Navigator.pop(context);
                  },
                  txt: widget.title,
                  theme: theme),
              SizedBox(
                height: kpadding * 1.5,
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: widget.students.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          StudentDisplayContainers(
                              count: 1 + index,
                              namesOfStudents: widget.students[index]),
                        ],
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
