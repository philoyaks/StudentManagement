import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentmanagement_app/models/classes.dart';
import 'package:studentmanagement_app/models/students.dart';
import 'package:studentmanagement_app/repository/api.dart';
import 'package:studentmanagement_app/widgets/classBoxContainers.dart';
import 'package:studentmanagement_app/widgets/popUpMenu.dart';
import '../constants.dart';
import 'createClassScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Api api = Api();
  late Future<List<Classes>> futureClasses;
  late Future<List<Students>> futureStudent;

  @override
  void initState() {
    super.initState();
    futureClasses = api.getClasses();
    futureStudent = api.getStudents();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
            height: size.height,
            width: size.width,
            decoration: kScreenDefaultDecoration,
            padding: EdgeInsets.symmetric(horizontal: kpadding),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Classes",
                        style: theme.textTheme.headline1,
                      ),
                      PopUpMenu(),
                    ],
                  ),
                  SizedBox(
                    height: kpadding / 2,
                  ),
                  FutureBuilder<List<Classes>>(
                      future: futureClasses,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Classes>? classes = snapshot.data;
                          return Flexible(
                            child: ListView.builder(
                                itemCount: classes!.length,
                                itemBuilder: (context, index) {
                                  return FutureBuilder<List<Students>>(
                                      future: futureStudent,
                                      builder: (context, snapshots) {
                                        if (snapshots.hasData) {
                                          List<Students>? students =
                                              snapshots.data;

                                          List<Students> actualStudent =
                                              students!
                                                  .where((element) =>
                                                      element.className ==
                                                      classes[index].classID)
                                                  .toList();

                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ClassDisplayContainers(
                                                  count: index + 1,
                                                  classname:
                                                      classes[index].classID,
                                                  namesOfStudents:
                                                      actualStudent),
                                            ],
                                          );
                                        } else if (snapshots.hasError) {
                                          return Text('${snapshots.error}');
                                        }

                                        // By default, show a loading spinner.
                                        return Center(child: Container());
                                      });
                                }),
                          );
                        } else if (snapshot.hasError) {
                          return Center(child: Text('${snapshot.error}'));
                        }
                        // By default, show a loading spinner.
                        return Expanded(
                            child: Center(
                                child: const CircularProgressIndicator()));
                      }),
                ])),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreatClassScreen()));
          },
          backgroundColor: kIconDefaultColor,
          child: Icon(
            Icons.add,
            color: Color(0xff6d0707),
            size: 40,
          ),
        ),
      ),
    );
  }
}
