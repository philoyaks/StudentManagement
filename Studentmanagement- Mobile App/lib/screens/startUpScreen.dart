import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import 'homeScreen.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kScreenDefaultDecoration,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset("assets/icons/clip1.svg")),
            Positioned(
                top: 0,
                left: 0,
                child: SvgPicture.asset("assets/icons/clip2.svg")),
            Positioned(
                bottom: 0,
                left: 0,
                child: SvgPicture.asset(
                  "assets/icons/clip3.svg",
                  color: Color(0xff84575c),
                )),
            Center(
                child: SvgPicture.asset(
              "assets/icons/wlcome.svg",
            )),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 35,
        width: 60,
        child: SizedBox(
          child: FloatingActionButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            elevation: 30,
            backgroundColor: Color.fromRGBO(250, 224, 227, 1),
            tooltip: 'Move to the next page',
            child: Text('Next', style: iconTextstyle),
          ),
        ),
      ),
    );
  }
}
