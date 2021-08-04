import 'package:flutter/material.dart';
import 'package:studentmanagement_app/widgets/iconsUsed.dart';

showSimpleAlertDialog(
    {required BuildContext context,
    required Function delete,
    required bool deleteClass}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            title: Text(
              'Confirm',
              // style: headingtextStyle,
            ),
            content: deleteClass
                ? Text(
                    'You would be deleting the Whole Student\'s details in the class \n\nAre you sure you want to delete?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  )
                : Text(
                    'Are you sure you want to delete Student Profile?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
            actions: [
              // ElevatedButton(onPressed: delete, child: Text('Yes')),
              useICon(txt: 'Yes', press: delete),
              useICon(
                  txt: 'No',
                  deletebutton: true,
                  press: () {
                    Navigator.pop(context);
                  }),
            ],
          ));
}
