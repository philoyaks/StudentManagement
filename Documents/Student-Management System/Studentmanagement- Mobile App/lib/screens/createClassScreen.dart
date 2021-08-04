import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studentmanagement_app/models/classes.dart';
import 'package:studentmanagement_app/repository/api.dart';
import 'package:studentmanagement_app/screens/homeScreen.dart';
import 'package:studentmanagement_app/widgets/headerTextAndActions.dart';
import 'package:studentmanagement_app/widgets/iconsUsed.dart';
import 'package:studentmanagement_app/widgets/kdefaultTextFields.dart';

import '../constants.dart';

class CreatClassScreen extends StatefulWidget {
  const CreatClassScreen({Key? key}) : super(key: key);

  @override
  _CreatClassScreenState createState() => _CreatClassScreenState();
}

class _CreatClassScreenState extends State<CreatClassScreen> {
  Api api = Api();
  final _formkey = GlobalKey<FormState>();
  TextEditingController _classEditingCOntroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: kpadding),
        decoration: kScreenDefaultDecoration,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: kpadding * 1.5,
              ),
              headerTitleAction(
                  press: () {
                    Navigator.pop(context);
                  },
                  theme: theme,
                  txt: "Class Name"),
              Container(
                height: height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Class Name",
                      style: theme.textTheme.subtitle2,
                    ),
                    SizedBox(
                      height: kpadding / 2,
                    ),
                    Form(
                      key: _formkey,
                      child: KdefaultTextFormfield(
                          hintText: 'Enter Class Name',
                          controller: _classEditingCOntroller,
                          press: false),
                    ),
                    Center(
                      child: useICon(
                          press: () async {
                            if (_formkey.currentState!.validate()) {
                              var result = await api.postClassDetails(Classes(
                                classID: _classEditingCOntroller.text,
                                id: "",
                                dateCreated: convertStringToDatePost(
                                        DateFormat("dd-MM-yyyy")
                                            .format(DateTime.now()))
                                    .toString(),
                              ));
                              if (result == "success") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              }
                            }
                          },
                          txt: 'Create Class'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
