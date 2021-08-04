import 'package:flutter/material.dart';

class KdefaultTextFormfield extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool press;

  const KdefaultTextFormfield(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.press})
      : super(key: key);

  @override
  _KdefaultTextFormfieldState createState() => _KdefaultTextFormfieldState();
}

class _KdefaultTextFormfieldState extends State<KdefaultTextFormfield> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      validator: (val) => val!.isEmpty ? "Field Cannot be left Empty" : null,
      controller: widget.controller,
      maxLines: null,
      readOnly: widget.press,
      style: theme.textTheme.subtitle2?.copyWith(color: Colors.black),
      decoration: InputDecoration(
        hintStyle: theme.textTheme.subtitle1?.copyWith(color: Colors.black),
        hintText: widget.hintText,
        fillColor: Colors.white,
        focusColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
