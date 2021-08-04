import 'package:flutter/material.dart';
import 'package:studentmanagement_app/models/students.dart';
import 'package:studentmanagement_app/repository/api.dart';
import 'package:studentmanagement_app/screens/editStudentScreen.dart';
import 'package:studentmanagement_app/screens/homeScreen.dart';
import 'package:studentmanagement_app/widgets/iconsUsed.dart';

import '../constants.dart';
import 'alertDialogWidgets.dart';
import 'inputfieldContainers.dart';

//ignore: must_be_immutable
class StudentDisplayContainers extends StatefulWidget {
  StudentDisplayContainers({
    Key? key,
    required this.namesOfStudents,
    this.openBox = false,
    this.editPage = false,
    required this.count,
  }) : super(key: key);
  bool editPage;
  bool openBox;
  final int count;
  final Students namesOfStudents;

  @override
  _StudentDisplayContainersState createState() =>
      _StudentDisplayContainersState();
}

class _StudentDisplayContainersState extends State<StudentDisplayContainers> {
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
                        "${widget.count}. ${widget.namesOfStudents.studentName}",
                        style: theme.textTheme.headline2,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              widget.openBox = false;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  studentinputDetails(
                      fullname:
                          widget.namesOfStudents.studentName.toUpperCase(),
                      address: widget.namesOfStudents.stdAddress.toUpperCase(),
                      birthday: widget.namesOfStudents.studentBirthday
                          .toString()
                          .substring(0, 10),
                      datecreated: widget.namesOfStudents.dateCreated
                          .toString()
                          .substring(0, 10),
                      theme: theme),
                  // SizedBox.expand(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      useICon(
                          txt: 'Delete Student',
                          press: () {
                            showSimpleAlertDialog(
                                context: context,
                                delete: () async {
                                  var result = await api.deleteStudentDetail(
                                      widget.namesOfStudents.id);
                                  if (result == "success") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  }
                                },
                                deleteClass: false);
                          },
                          deletebutton: true),
                      SizedBox(width: kpadding / 2),
                      useICon(
                        txt: 'Edit Details',
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditStudentScreen(
                                      students: widget.namesOfStudents)));
                        },
                      ),
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
                    "${widget.count}.  ${widget.namesOfStudents.studentName}",
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
