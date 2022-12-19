import 'package:flutter/material.dart';

class CwDialog extends StatelessWidget {
  final String title;
  final Widget content;

  const CwDialog({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = this.title;
    var content = this.content;
    return AlertDialog(
      title: Text(title),
      // To display the title it is optional
      content: content,
      // Message which will be pop up on the screen
      // Action widget which will provide the user to acknowledge the choice
      actions: [
        ElevatedButton(
          // FlatButton widget is used to make a text to work like a button
          onPressed: () {
            Navigator.pop(context);
          },
          // function used to perform after pressing the button
          child: const Text('Close'),
        ),
      ],
    );
  }
}
