import 'package:flutter/material.dart';
import 'package:studentmanagement_app/models/students.dart';
import 'package:studentmanagement_app/widgets/headerTextAndActions.dart';
import 'package:studentmanagement_app/widgets/studentBoxContainers.dart';

import '../constants.dart';
import 'createStudentScreen.dart';

class ShowPerClases extends StatefulWidget {
  final String className;
  final List<Students> students;

  const ShowPerClases(
      {Key? key, required this.className, required this.students})
      : super(key: key);

  @override
  _ShowPerClasesState createState() => _ShowPerClasesState();
}

class _ShowPerClasesState extends State<ShowPerClases> {
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
                  txt: widget.className,
                  theme: theme),
              SizedBox(
                height: kpadding * 1.5,
              ),
              widget.students.length < 1
                  ? Flexible(
                      child: Center(
                        child: Text(
                          "No Student details have been added yet \n  You can add New students Details",
                          style: theme.textTheme.subtitle1,
                        ),
                      ),
                    )
                  : Flexible(
                      child: ListView.builder(
                          itemCount: widget.students.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                StudentDisplayContainers(
                                    editPage: true,
                                    count: 1 + index,
                                    namesOfStudents: widget.students[index]),
                              ],
                            );
                          }),
                    ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateStudentScreen(
                        classname: widget.className,
                      )));
        },
        backgroundColor: kIconDefaultColor,
        child: Icon(
          Icons.add,
          color: Color(0xff6d0707),
          size: 40,
        ),
      ),
    );
  }
}
