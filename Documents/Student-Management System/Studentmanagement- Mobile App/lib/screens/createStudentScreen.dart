import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studentmanagement_app/models/students.dart';
import 'package:studentmanagement_app/repository/api.dart';
import 'package:studentmanagement_app/widgets/headerTextAndActions.dart';
import 'package:studentmanagement_app/widgets/iconsUsed.dart';
import 'package:studentmanagement_app/widgets/kdefaultTextFields.dart';

import '../constants.dart';
import 'homeScreen.dart';

class CreateStudentScreen extends StatefulWidget {
  const CreateStudentScreen({Key? key, required this.classname})
      : super(key: key);
  final String classname;

  @override
  _CreateStudentScreenState createState() => _CreateStudentScreenState();
}

class _CreateStudentScreenState extends State<CreateStudentScreen> {
  Api api = Api();
  final _formkey = GlobalKey<FormState>();
  TextEditingController _studentEditingCOntroller = TextEditingController();
  TextEditingController ingredientsEditingController = TextEditingController();
  TextEditingController _addressEditingController = TextEditingController();
  TextEditingController _birthdayEditingController = TextEditingController();
  DateTime _fromDate = DateTime.now();

  Future<void> _showDatePicker(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _fromDate,
      firstDate: DateTime(1990, 3),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: ThemeData.light().copyWith(
            primaryColor: kContainerDisplayColor,
            accentColor: kContainerDisplayColor,
            colorScheme: ColorScheme.light(primary: Color(0xff7e3939)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)),
        child: child!,
      ),
    );
    if (picked != null && picked != _fromDate) {
      setState(() {
        _fromDate = picked;

        var s = DateFormat("dd-MM-yyyy").format(picked);

        _birthdayEditingController.text = s.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: kpadding),
        decoration: kScreenDefaultDecoration,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: kpadding * 1.5,
              ),
              headerTitleAction(
                  press: () {
                    Navigator.pop(context);
                  },
                  txt: 'Student Profile',
                  theme: theme),
              SizedBox(
                height: height * 0.2,
              ),
              Center(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Student Name",
                        style: theme.textTheme.subtitle2,
                      ),
                      SizedBox(
                        height: kpadding / 4,
                      ),
                      KdefaultTextFormfield(
                          controller: _studentEditingCOntroller,
                          hintText: 'Enter Student Full name',
                          press: false),
                      SizedBox(
                        height: kpadding,
                      ),
                      Text(
                        "Full Adress",
                        style: theme.textTheme.subtitle2,
                      ),
                      SizedBox(
                        height: kpadding / 4,
                      ),
                      KdefaultTextFormfield(
                          controller: _addressEditingController,
                          hintText: 'Enter Student Home Address',
                          press: false),
                      SizedBox(
                        height: kpadding,
                      ),
                      Text(
                        "Birthday",
                        style: theme.textTheme.subtitle2,
                      ),
                      SizedBox(
                        height: kpadding / 4,
                      ),
                      Row(
                        children: [
                          Container(
                            width: width * 0.7,
                            child: KdefaultTextFormfield(
                              controller: _birthdayEditingController,
                              hintText: 'Tap to input Date',
                              press: true,
                            ),
                          ),
                          IconButton(
                              iconSize: 24,
                              icon: Icon(Icons.calendar_today,
                                  color: Colors.white),
                              onPressed: () {
                                _showDatePicker(context);
                              })
                        ],
                      ),
                      SizedBox(
                        height: kpadding / 2,
                      ),
                      Center(
                        child: useICon(
                            txt: 'Create Student Profile',
                            press: () async {
                              if (_formkey.currentState!.validate()) {
                                var result = await api.postStudentDetails(
                                    Students(
                                        className: widget.classname,
                                        studentName: _studentEditingCOntroller
                                            .text,
                                        stdAddress: _addressEditingController
                                            .text,
                                        dateCreated: convertStringToDatePost(
                                                DateFormat("dd-MM-yyyy")
                                                    .format(DateTime.now()))
                                            .toString(),
                                        studentBirthday:
                                            convertStringToDatePost(
                                                _birthdayEditingController
                                                    .text),
                                        studentID: 'Not used'));
                                if (result == "success") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                }
                              }
                            }),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
