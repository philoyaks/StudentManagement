import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:studentmanagement_app/widgets/customTexts.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailCOntroller = TextEditingController();
  TextEditingController _passCOntroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: kScreenDefaultDecoration,
            child: ListView(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.2,
                      ),
                      textInput1('Sign in to Student Management',
                          style: theme.textTheme.headline3),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Form(
                        key: _formkey,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 23),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textInput1('Email Address',
                                  style: theme.textTheme.headline3),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                  validator: (value) =>
                                      value!.isEmpty ? 'Empty field' : null,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailCOntroller,
                                  decoration: kInputBoxDecoration),
                              SizedBox(
                                height: 10,
                              ),
                              textInput1('Password',
                                  style: theme.textTheme.headline3),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                  validator: (value) =>
                                      value!.isEmpty ? 'Empty field' : null,
                                  controller: _passCOntroller,
                                  obscureText: true,
                                  decoration: kInputBoxDecoration),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 23),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: buttons(
                                      height: 60,
                                      boxColor:
                                          Color.fromRGBO(254, 109, 115, 1),
                                      textColor:
                                          Color.fromRGBO(242, 242, 242, 1),
                                      text: 'Log in',
                                      style: theme.textTheme.button,
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        if (_formkey.currentState!
                                            .validate()) {}
                                      }),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {},
                                child: Text('forgot password?....',
                                    style: theme.textTheme.subtitle1!
                                        .copyWith(fontStyle: FontStyle.italic)),
                              ),
                            ),
                            SizedBox(height: 30),
                            RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Dont have an account? ',
                                      style: theme.textTheme.subtitle1),
                                  TextSpan(
                                      text: 'Register',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                      style: theme.textTheme.subtitle2!
                                          .copyWith(color: Colors.blue)),
                                  TextSpan(
                                    text: '\n\n',
                                  ),
                                ])),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextButton buttons(
    {required int height,
    required Color boxColor,
    required Color textColor,
    required String text,
    required TextStyle? style,
    required Function() onPressed}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: style,
    ),
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(boxColor),
        foregroundColor: MaterialStateProperty.all(Colors.blue)),
  );
}
