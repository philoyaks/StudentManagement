import 'package:flutter/material.dart';
import 'package:studentmanagement_app/widgets/customTexts.dart';

import '../../constants.dart';
import 'loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  bool? checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: kScreenDefaultDecoration,
          width: width,
          height: height,
          child: ListView(
            children: [
              Container(
                // decoration: kborderRadius,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    textInput1('Sign Up to Student Management',
                        style: theme.textTheme.headline3),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Form(
                      key: _formkey,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textInput1('School Name',
                                style: theme.textTheme.headline3),
                            TextFormField(
                                validator: (value) =>
                                    value!.isEmpty ? 'Empty field' : null,
                                controller: _fullnameController,
                                decoration: kInputBoxDecoration),
                            SizedBox(
                              height: 10,
                            ),
                            textInput1('School Year Founded',
                                style: theme.textTheme.headline3),
                            TextFormField(
                                validator: (value) =>
                                    value!.isEmpty ? 'Year Founded' : null,
                                controller: _usernameController,
                                decoration: kInputBoxDecoration),
                            SizedBox(
                              height: 10,
                            ),
                            textInput1(' School\'s Email',
                                style: theme.textTheme.headline3),
                            TextFormField(
                                validator: (value) =>
                                    value!.isEmpty ? 'Email' : null,
                                controller: _emailController,
                                decoration: kInputBoxDecoration),
                            SizedBox(
                              height: 10,
                            ),
                            textInput1('Password',
                                style: theme.textTheme.headline3),
                            TextFormField(
                                validator: (value) =>
                                    value!.isEmpty ? 'password' : null,
                                controller: _passwordController,
                                obscureText: true,
                                decoration: kInputBoxDecoration),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Checkbox(
                            value: checkBoxValue,
                            focusColor: Colors.white,
                            activeColor: Colors.white,
                            fillColor: MaterialStateProperty.all(Colors.white),
                            onChanged: (val) {
                              setState(() {
                                checkBoxValue = val;
                              });
                            }),
                        SizedBox(
                            width: width * 0.8,
                            child: Text(
                              'Creating an account means you agree with our Terms and Condition',
                              style: theme.textTheme.subtitle1,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23),
                      child: Row(
                        children: [
                          Expanded(
                            child: buttons(
                                height: 56,
                                boxColor: Color.fromRGBO(254, 109, 115, 1),
                                textColor: Color.fromRGBO(242, 242, 242, 1),
                                text: 'Register',
                                style: theme.textTheme.button,
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  if (_formkey.currentState!.validate() &&
                                      checkBoxValue == true) {
                                    //
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
