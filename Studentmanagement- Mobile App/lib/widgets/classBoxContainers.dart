import 'package:flutter/material.dart';
import 'package:studentmanagement_app/models/students.dart';
import 'package:studentmanagement_app/repository/api.dart';
import 'package:studentmanagement_app/screens/createStudentScreen.dart';
import 'package:studentmanagement_app/screens/homeScreen.dart';
import 'package:studentmanagement_app/screens/showForClasses.dart';
import 'package:studentmanagement_app/widgets/iconsUsed.dart';

import '../constants.dart';
import 'alertDialogWidgets.dart';
import 'inputfieldContainers.dart';

//ignore: must_be_immutable
class ClassDisplayContainers extends StatefulWidget {
  ClassDisplayContainers({
    Key? key,
    required this.namesOfStudents,
    this.openBox = false,
    this.classname = "",
    required this.count,
  }) : super(key: key);
  bool openBox;
  final List<Students> namesOfStudents;
  String classname;
  final int count;

  @override
  _ClassDisplayContainersState createState() => _ClassDisplayContainersState();
}

class _ClassDisplayContainersState extends State<ClassDisplayContainers> {
  Api api = Api();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return widget.openBox
        ? Flexible(
            child: Container(
              margin: EdgeInsets.only(bottom: kpadding),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: kpadding / 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: kContainerDisplayColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.classname.isNotEmpty
                            ? "${widget.count}. ${widget.classname}"
                            : "${widget.count}. ${widget.namesOfStudents[0].className}",
                        style: theme.textTheme.headline2,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              widget.openBox = false;
                            });
                          },
                          icon: Icon(Icons.arrow_downward, color: Colors.white))
                    ],
                  ),
                  widget.namesOfStudents.length < 0
                      ? Text('None')
                      : Column(
                          children: widget.namesOfStudents
                              .map((e) => classStudentNames(e.studentName,
                                  widget.namesOfStudents.indexOf(e) + 1, theme))
                              .toList()),
                  // SizedBox.expand(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      useICon(
                          txt: 'Delete Class',
                          press: () {
                            showSimpleAlertDialog(
                                context: context,
                                delete: () async {
                                  var result =
                                      await api.deleteClasses(widget.classname);
                                  if (result == "success") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  }
                                },
                                deleteClass: true);
                          },
                          deletebutton: true),
                      useICon(
                        txt: 'Add Std',
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateStudentScreen(
                                        classname: widget.classname,
                                      )));
                        },
                      ),
                      useICon(
                        txt: 'Show all',
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowPerClases(
                                        students: widget.namesOfStudents,
                                        className: widget.classname.isNotEmpty
                                            ? "${widget.classname}"
                                            : "${widget.namesOfStudents[0].className}",
                                      )));
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.only(bottom: kpadding),
            width: double.infinity,
            padding: EdgeInsets.all(kpadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: kContainerDisplayColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.classname.isNotEmpty
                        ? "${widget.count}. ${widget.classname}"
                        : "${widget.count}. ${widget.namesOfStudents[0].className}",
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.subtitle1,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        widget.openBox = true;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ))
              ],
            ),
          );
  }
}
